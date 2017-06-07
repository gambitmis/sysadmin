if( ! $(Get-Module -Name VMware.*)){
. "C:\Program Files (x86)\VMware\Infrastructure\PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1"
}

function valiDateFile {
    param (

        [Parameter(Mandatory=$true)]
        [String]$file,

        [Parameter(Mandatory=$true)]
        [int]$milestone,

        [Parameter(Mandatory)][validateSet("Day","Hour","Minutes")]
        [string]$milestone_scope
    )
    # check if found file
    # --------------------
    $testPath = Test-Path $file
    if($testPath){

        $fileInfo = Get-ChildItem $file
        $file_last_wr = $fileInfo.LastWriteTime
        switch($milestone_scope){

            "Day"     {$timelimit = $(get-date).AddDays($milestone)}
            "Hour"    {$timelimit = $(get-date).AddHours($milestone)}
            "Minutes" {$timelimit = $(get-date).AddMinutes($milestone); }

        }
        Write-Host -ForegroundColor Yellow "Now Working on ValidateFile function ....."
        Write-host -ForegroundColor DarkYellow "Your last write change on this file: $file_last_wr"

        if ( $timelimit -gt $file_last_wr ){
        
            write-host -ForegroundColor Red "*** Recommenced rescan File Because it should not over ""$timelimit"" ***"
            $ans = $false 
            return $ans
        
        }else{
            Write-host -ForegroundColor Green "File Validate"
            $ans = $true
            return $ans
        }

    }else{
        Write-host -ForegroundColor DarkYellow "!!! File NOt Found !!!"
        $ans = $false
        return $ans
    }
    
}

function populateVM{

    param (

        [Parameter(Mandatory=$true)]
        [String]$viserv,

        [Parameter(Mandatory=$true)]
        [int]$newscan,

        [Parameter(Mandatory=$true)]
        [int]$newpso,

        [Parameter(Mandatory=$true)]
        [string]$psobject,

        [Parameter(Mandatory=$true)]
        [string]$export
    )
    
    Connect-VIServer -Server $viserv

    if($newscan -eq $false){
        
            get-vm -Server $viserv | Select-Object name | Export-Csv -Path $export  
        
    }

    if($newpso -eq $false){
        $guestvm_import = Import-Csv -Path $export
        $guests = @()
        $loop = $guestvm_import.count
        $count = 0

        foreach($guest in $guestvm_import){

            $vmname = $guest.Name
            $getVMguest = Get-VMGuest -VM $vmname -Server $viserv
            $getVM = Get-VM -Name $vmname -Server $viserv
            $cdrom = $getVM | Get-CDDrive
            $mountISO = "No"
            if($cdrom.IsoPath){
                #$cdrom | Select-Object IsoPath |ft * -AutoSize
                $mountISO = "Yes"
            }
            $all_ipaddr = $getVMguest.IPAddress 
            $getPubIPv4 = "No"
            $getPubIPv6 = "No"
            $getGinIPv4 = "No"
            $getPrivIPv4 = "No"
            $OS = "No"

            if($getVMguest.OSFullName){
                $OS = $getVMguest.OSFullName
            }

            $VmToolVersion = "No"
            if($getVMguest.ToolsVersion){
                $VmToolVersion = $getVMguest.ToolsVersion
            }

            if($all_ipaddr.Count -gt 0){
            
                foreach ($i in $all_ipaddr){
        
                    #Write-Host -ForegroundColor Gray $i
                    switch($i){

                        { $i -match "^164.115.*"} { $getPubIPv4 = $i;}
                        { $i -match "^2401:9d*"}  { $getPubIPv6 = $i;}
                        { $i -match "^10.10.*"}   { $getGinIPv4 = $i;}
                        { $i -match "^10.111.*"}  { $getGinIPv4 = $i;}
                        { $i -match "^192.168.*"} { $getPrivIPv4 = $i;}
                        { $i -match "^172.17.*"}  { $getPrivIPv4 = $i;}
                        { $i -match "^10.3.*"}    { $getPrivIPv4 = $i;}

                    }
               }
            }
           #write-host -ForegroundColor Green $getPubIPv4
           $guests += New-Object PSObject -Property @{
        
                Name = $vmname
                OS = $OS
                VmToolVersion = $VmToolVersion
                Cpu = $getVM.NumCpu
                Ram = $getVM.MemoryGB
                Version = $getVM.Version
                PublicIPv4 = $getPubIPv4
                PublicIPv6 = $getPubIPv6
                GinIPv4 = $getGinIPv4
                PrivIPv4 = $getPrivIPv4
                State = $getVMguest.State
                PowerState = $getVM.PowerState
                MountISO = $mountISO
                ESXi = $getVM.VMHost

        
           }
           $percent = [int]$percent = $count/$loop*100
           $count++
           Write-Progress -Activity "Migration VMNET" -Status "Scanning Now:   $vmname   Total:   $count/$loop  Percent: $percent% " -PercentComplete($count/$loop*100 )

        } # END Foreach
    $guests | Export-Csv -Path $psobject
    }
}

function populateVMreport{

    param(
        
        [parameter(Mandatory=$true)]
        [string]$psobject,

        [parameter(Mandatory=$true)]
        [string]$site,

        [Parameter(Mandatory)][validateSet("vmtool","hwVersion","centreon")]
        [string]$report

    )




    function reportCentreon{
      
        $export_good = "E:\PoCLI\Projects\populateVM\report_getip_"+$site+".csv"
        $export_bad = "E:\PoCLI\Projects\populateVM\report_unknow_"+$site+".csv"
        $attach =  @()
        $attach += $export_good
        $attach += $export_bad
        $running_vm_all = $obj | ? { $_.PowerState -eq "PoweredOn"}
        $running_vm_good = $obj | ? { $_.PowerState -eq "PoweredOn" -and ($_.VMToolVersion) } |Select-Object Name,PublicIPv4,GinIPv4,PrivIPv4 
        $running_vm_good | export-csv -Path $export_good -NoTypeInformation
        $running_vm_bad = $obj | ? { $_.PowerState -eq "PoweredOn" -and $_.VMToolVersion -eq "No" } |Select-Object Name 
        $running_vm_bad | Export-Csv -Path $export_bad -NoTypeInformation

        $mailfrom = "Pocli@cloud.ega.or.th"
        $mailto = "chalermsak.krourwan@ega.or.th"
        $subject = "Export PoweredOn VM at "+$site
        $body = "Info "+$site+" from file CSV attachment"
        $smtpserv = "164.115.3.100"
        Send-MailMessage -From $mailfrom -To $mailto -Subject $subject -Attachments $attach -Body $body  -SmtpServer $smtpserv  -Priority High

    }

    $obj = import-csv -Path $psobject
    switch($report){

        "centreon" { reportCentreon; }
    }
}

$vcenter_server = "10.9.10.100"
$site = "EGA"
$ega_export = "E:\PoCLI\Projects\populateVM\guestvm_"+$site+".csv"
$ega_psobject = "E:\PoCLI\Projects\populateVM\psobject_"+$site+".csv"

$newScan = valiDateFile -file $ega_export -milestone -5 -milestone_scope Day 
$newPSO = valiDateFile -file $ega_psobject -milestone -5 -milestone_scope Day 
populateVM -viserv $vcenter_server -export $ega_export -newscan $newScan -newpso $newPSO -psobject $ega_psobject
populateVMreport -psobject $ega_psobject -report centreon -site $site


$vcenter_server = "10.9.30.100"
$site = "CAT"
$cat_export = "E:\PoCLI\Projects\populateVM\guestvm_"+$site+".csv"
$cat_psobject = "E:\PoCLI\Projects\populateVM\psobject_"+$site+".csv"

$newScan = valiDateFile -file $cat_export -milestone -5 -milestone_scope Day 
$newPSO = valiDateFile -file $cat_psobject -milestone -5 -milestone_scope Day 
populateVM -viserv $vcenter_server -export $cat_export -newscan $newScan -newpso $newPSO -psobject $cat_psobject
populateVMreport -psobject $cat_psobject -report centreon -site $site



$vcenter_server = "10.9.40.100"
$site = "TRUE"
$true_export = "E:\PoCLI\Projects\populateVM\guestvm_"+$site+".csv"
$true_psobject = "E:\PoCLI\Projects\populateVM\psobject_"+$site+".csv"
$newScan = valiDateFile -file $true_export -milestone -5 -milestone_scope Day 
$newPSO = valiDateFile -file $true_psobject -milestone -5 -milestone_scope Day 
populateVM -viserv $vcenter_server -export $true_export -newscan $newScan -newpso $newPSO -psobject $true_psobject
populateVMreport -psobject $true_psobject -report centreon -site $site

