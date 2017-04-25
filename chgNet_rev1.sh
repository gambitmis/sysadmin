Add-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue
Connect-VIServer 'xxxxx' -user 'xxxx' -Password 'xxx,' -SaveCredentials | Out-Null

function show-menu
{
    param ( [String]$title = 'My Menu' )
    Clear-Host
    Write-Host "==================== $title ===================="
    Write-Host "1: Press 1 to Migrate DVS to VirtualSwitch (1 VM)"
    Write-Host "2: Press 2 to Migrate VirtualSwitch to DVS (1 VM)"
    Write-Host "3: Press 3 to Migrate DVS to VirtualSwitch (1 HOST)"
    Write-Host "4: Press 4 to Migrate VirtualSwitch to DVS (1 HOST)"
    Write-Host "Q: Press 'Q' to Quit."
}

function vs2dvs
{
    param ( [PSObject]$guest_vm )
    $get_nic = get-vm -Name $guest_vm |Get-NetworkAdapter
    $guest_name = $guest_vm.name.toString()
    #get-vm -name $guest_vm | get-networkadapter
    foreach ($i in $get_nic){ 
        $nic_name = $i.NetworkName.ToString()
        $nic_obj = $i
        switch($nic_name){
            "$vs2032" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds2032" -Confirm:$false; }
            "$vs2033" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds2033" -Confirm:$false; }
            "$vs2035" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds2035" -Confirm:$false; }
            "$vs305" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds305" -Confirm:$false; }
            "$vs2370" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds2370" -Confirm:$false; }
            "$vs2371" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds2371" -Confirm:$false; }
            "$vs2373" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds2373" -Confirm:$false; }
            "$vs1932" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds1932" -Confirm:$false; }
            "$vs1933" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds1933" -Confirm:$false; }
            "$vs1935" { $nic_obj | Set-NetworkAdapter -NetworkName "$vds1935" -Confirm:$false; }
        }
    }

}#end function

function dvs2vs
{
    param ( [PSObject]$guest_vm )
    $get_nic = get-vm -Name $guest_vm |Get-NetworkAdapter
    $guest_name = $guest_vm.name.toString()
    #get-vm -name $guest_vm | get-networkadapter
    foreach ($i in $get_nic){ 
        $nic_name = $i.NetworkName.ToString()
        $nic_obj = $i
        switch($nic_name){
            "$vds2032" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs2032" -Confirm:$false; }
            "$vds2033" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs2033" -Confirm:$false; }
            "$vds2035" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs2035" -Confirm:$false; }
            "$vds305" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs305" -Confirm:$false; }
            "$vds2370" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs2370" -Confirm:$false; }
            "$vds2371" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs2371" -Confirm:$false; }
            "$vds2373" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs2373" -Confirm:$false; }
            "$vds1932" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs1932" -Confirm:$false; }
            "$vds1933" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs1933" -Confirm:$false; }
            "$vds1935" { $nic_obj | Set-NetworkAdapter -NetworkName "$vs1935" -Confirm:$false; }
        }
    }

}#end function


function menu1
{
    cls
    $ans = read-host "Please Insert Guest VM Name"
    $res = get-vm -name $ans -ErrorAction SilentlyContinue
    if($res){
        echo "OK"
        dvs2vs($res)
    }else{
        return "NOT FOUND"
    }
}

function menu2
{
    cls
    $ans = read-host "Please Insert Guest VM Name"
    $res = get-vm -name $ans -ErrorAction SilentlyContinue
    if($res){
        echo "OK"
        vs2dvs($res)
    }else{
        return "NOT FOUND"
    }

}


function menu3
{
    cls
    $ans = read-host "Please Insert Host"
    $res = get-vmhost -name $ans -ErrorAction SilentlyContinue
    $member = $res | Get-vm 
    #$member
    if($res -and $member){
        echo "OK"
        foreach ($j in $member){
            
            #$confirm=read-host "do you want to Skip $j.name Y/N"
            #if($confirm -eq "y"){
            #    echo "SKIP"
            #    continue;
            #}
            dvs2vs($j)
            #echo "Finish"
        }

    }else{
        return "NOT FOUND"
    }
}

function menu4
{
    cls
    $ans = read-host "Please Insert Host"
    $res = get-vmhost -name $ans -ErrorAction SilentlyContinue
    $member = $res | Get-vm 
    #$member
    if($res -and $member){
        echo "OK"
        foreach ($j in $member){
            echo $j.Name
        }

    }else{
        return "NOT FOUND"
    }
}

$a = get-date
$datetime = $a.year.ToString() + "-" + $a.Month.ToString() + "-" + $a.Day.ToString() + "-" + $a.hour.tostring() + ":" + $a.minute.tostring()

$vds2032 = "DC-Public-2032-164.115.32.x"
$vds2033 = "DC-Public-2033-164.115.33.x"
$vds2035 = "DC-Public-2035-164.115.35.x"
$vds305 = "DC-Public-305-164.115.3.x"
$vds2370 = "DC-GIN-2370-10.111.5.x"
$vds2371 = "DC-GIN-2371-10.111.6.x"
$vds2373 = "DC-GIN-2373-10.111.8.x"
$vds1932 = "DC-Private-1932-192.168.32.x"
$vds1933 = "DC-Private-1933-192.168.33.x"
$vds1935 = "DC-Private-1935-192.168.35.x"

$vs2032 = "vsDC-Public-2032-164.115.32.x"
$vs2033 = "vsDC-Public-2033-164.115.33.x"
$vs2035 = "vsDC-Public-2035-164.115.35.x"
$vs305 = "vsDC-Public-305-164.115.3.x"
$vs2370 = "vsDC-GIN-2370-10.111.5.x"
$vs2371 = "vsDC-GIN-2371-10.111.6.x"
$vs2373 = "vsDC-GIN-2373-10.111.8.x"
$vs1932 = "vsDC-Private-1932-192.168.32.x"
$vs1933 = "vsDC-Private-1933-192.168.33.x"
$vs1935 = "vsDC-Private-1935-192.168.35.x"


do {
    show-menu -title "PowerCLI $datetime"
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
        '1' { menu1; }
        '2' { menu2; }
        '3' { menu3; }
        '4' { menu4; }
    }
    pause
}until ($selection -eq 'q')
