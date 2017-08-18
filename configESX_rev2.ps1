if( ! $(Get-Module -Name VMware.*)){
. "C:\Program Files (x86)\VMware\Infrastructure\PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1"
}


function Get-VMHostDumpCollector {
    
    [CmdletBinding(supportsShouldProcess)]

    Param(
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [PSObject]$x
    )
    
    $getESXCLi = $x | Get-EsxCli
    $getDumpCollector = $getESXCLi.System.Coredump.Network.Get()
    $getDumpCollector
    <#
    $hash = @{
        Enabled = $getDumpCollector.Enabled
        HostVNic = $getDumpCollector.HostVNic
        CoreDumpServ = $getDumpCollector.NetworkServerIP
        CoreDumpPort = $getDumpCollector.NetworkServerPort

    }
    $DumpCollector = New-Object PSObject -Property $hash
    $DumpCollector
    #>
}

function Set-VMHostDumpCollector {
    
    [CmdletBinding(supportsShouldProcess)]

    Param(
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [PSObject]$y
    )
    
    $getESXCLi = $y | Get-EsxCli
    $getESXCLi.System.Coredump.Network.Set($null,"vmk0",$null,"10.9.10.80",6500)
    $getESXCLi.System.Coredump.Network.Set($true)
}

$vmnets = New-Object PSObject -Property @{
    
}

$dc30 = New-Object PSObject -Property @{
    name = "dc-ucs30.cloud.ega.or.th"
    nfs_ip = "192.168.170.130"
    iscsiBootPG2 = "192.168.171.136"
}

$dc29 = New-Object PSObject -Property @{
    name = "dc-ucs29.cloud.ega.or.th"
    nfs_ip = "192.168.170.129"
    vmotion_ip = "192.168.168.129"
    iscsiBootPG2 = "192.168.171.134"
}

$dc28 = New-Object PSObject -Property @{
    name = "dc-ucs28.cloud.ega.or.th"
    nfs_ip = "192.168.170.128"
    vmotion_ip = "192.168.168.128"
    iscsiBootPG2 = "192.168.171.132"
}

$dc27 = New-Object PSObject -Property @{
    name = "dc-ucs27.cloud.ega.or.th"
    nfs_ip = "192.168.170.127"
    vmotion_ip = "192.168.168.127"
    iscsiBootPG2 = "192.168.171.130"
}

$dc26 = New-Object PSObject -Property @{
    name = "dc-ucs26.cloud.ega.or.th"
    nfs_ip = "192.168.170.126"
    vmotion_ip = "192.168.168.126"
    iscsiBootPG2 = "192.168.171.128"
}

$dc25 = New-Object PSObject -Property @{
    name = "dc-ucs25.cloud.ega.or.th"
    nfs_ip = "192.168.170.125"
    vmotion_ip = "192.168.168.125"
    iscsiBootPG2 = "192.168.171.126"
}

$dc24 = New-Object PSObject -Property @{
    name = "dc-ucs24.cloud.ega.or.th"
    nfs_ip = "192.168.170.124"
    vmotion_ip = "192.168.168.124"
    iscsiBootPG2 = "192.168.171.148"
}

$dc23 = New-Object PSObject -Property @{
    name = "dc-ucs23.cloud.ega.or.th"
    nfs_ip = "192.168.170.123"
    vmotion_ip = "192.168.168.123"
    iscsiBootPG2 = "192.168.171.146"
}

$dc22 = New-Object PSObject -Property @{
    name = "dc-ucs22.cloud.ega.or.th"
    nfs_ip = "192.168.170.122"
    vmotion_ip = "192.168.168.122"
    iscsiBootPG2 = "192.168.171.144"
}

$dc21 = New-Object PSObject -Property @{
    name = "dc-ucs21.cloud.ega.or.th"
    nfs_ip = "192.168.170.121"
    vmotion_ip = "192.168.168.121"
    iscsiBootPG2 = "192.168.171.142"
}

$mgt02 = New-Object PSObject -Property @{
    name = "dc-mgt02.cloud.ega.or.th"
    nfs_ip = "192.168.170.92"
    vmotion_ip = "192.168.168.92"
    iscsiBootPG2 = "NONE"
}

$mgt01 = New-Object PSObject -Property @{
    name = "dc-mgt01.cloud.ega.or.th"
    nfs_ip = "192.168.170.91"
    vmotion_ip = "192.168.168.91"
    iscsiBootPG2 = "NONE"
}

$dc20 = New-Object PSObject -Property @{
    name = "dc-ucs20.cloud.ega.or.th"
    nfs_ip = "192.168.170.120"
    vmotion_ip = "192.168.168.120"
    iscsiBootPG2 = "NONE"
}

$dc19 = New-Object PSObject -Property @{
    name = "dc-ucs19.cloud.ega.or.th"
    nfs_ip = "192.168.170.119"
    vmotion_ip = "192.168.168.119"
    iscsiBootPG2 = "NONE"
}


$dc18 = New-Object PSObject -Property @{
    name = "dc-ucs18.cloud.ega.or.th"
    nfs_ip = "192.168.170.118"
    vmotion_ip = "192.168.168.118"
    iscsiBootPG2 = "NONE"
}

$dc17 = New-Object PSObject -Property @{
    name = "dc-ucs17.cloud.ega.or.th"
    nfs_ip = "192.168.170.117"
    vmotion_ip = "192.168.168.117"
    iscsiBootPG2 = "NONE"
}

$dc16 = New-Object PSObject -Property @{
    name = "dc-ucs16.cloud.ega.or.th"
    nfs_ip = "192.168.170.116"
    vmotion_ip = "192.168.168.116"
    iscsiBootPG2 = "192.168.171.124"
}

$dc15 = New-Object PSObject -Property @{
    name = "dc-ucs15.cloud.ega.or.th"
    nfs_ip = "192.168.170.115"
    vmotion_ip = "192.168.168.115"
    iscsiBootPG2 = "192.168.171.122"
}

$dc14 = New-Object PSObject -Property @{
    name = "dc-ucs14.cloud.ega.or.th"
    nfs_ip = "192.168.170.114"
    vmotion_ip = "192.168.168.114"
    iscsiBootPG2 = "192.168.171.120"
}

$dc13 = New-Object PSObject -Property @{
    name = "dc-ucs13.cloud.ega.or.th"
    nfs_ip = "192.168.170.113"
    vmotion_ip = "192.168.168.113"
    iscsiBootPG2 = "192.168.171.118"
}

$dc12 = New-Object PSObject -Property @{
    name = "dc-ucs12.cloud.ega.or.th"
    nfs_ip = "192.168.170.112"
    vmotion_ip = "192.168.168.112"
    iscsiBootPG2 = "192.168.171.116"
}


$dc11 = New-Object PSObject -Property @{
    name = "dc-ucs11.cloud.ega.or.th"
    nfs_ip = "192.168.170.111"
    vmotion_ip = "192.168.168.111"
    iscsiBootPG2 = "192.168.171.114"
}

$dc10 = New-Object PSObject -Property @{
    name = "dc-ucs10.cloud.ega.or.th"
    nfs_ip = "192.168.170.110"
    vmotion_ip = "192.168.168.110"
    iscsiBootPG2 = "192.168.171.112"
}

$dc09 = New-Object PSObject -Property @{
    name = "dc-ucs09.cloud.ega.or.th"
    nfs_ip = "192.168.170.109"
    vmotion_ip = "192.168.168.109"
    iscsiBootPG2 = "192.168.171.110"
}


$dc08 = New-Object PSObject -Property @{
    name = "dc-ucs08.cloud.ega.or.th"
    nfs_ip = "192.168.170.108"
    vmotion_ip = "192.168.168.108"
    iscsiBootPG2 = "NONE"
}

$dc07 = New-Object PSObject -Property @{
    name = "dc-ucs07.cloud.ega.or.th"
    nfs_ip = "192.168.170.107"
    vmotion_ip = "192.168.168.107"
    iscsiBootPG2 = "NONE"
}

$dc06 = New-Object PSObject -Property @{
    name = "dc-ucs06.cloud.ega.or.th"
    nfs_ip = "192.168.170.106"
    vmotion_ip = "192.168.168.106"
    iscsiBootPG2 = "NONE"
}

$dc05 = New-Object PSObject -Property @{
    name = "dc-ucs05.cloud.ega.or.th"
    nfs_ip = "192.168.170.105"
    vmotion_ip = "192.168.168.105"
    iscsiBootPG2 = "NONE"
}

$dc04 = New-Object PSObject -Property @{
    name = "dc-ucs04.cloud.ega.or.th"
    nfs_ip = "192.168.170.104"
    vmotion_ip = "192.168.168.104"
    iscsiBootPG2 = "NONE"
}

$dc03 = New-Object PSObject -Property @{
    name = "dc-ucs03.cloud.ega.or.th"
    nfs_ip = "192.168.170.103"
    vmotion_ip = "192.168.168.103"
    iscsiBootPG2 = "NONE"
}

$dc02 = New-Object PSObject -Property @{
    name = "dc-ucs02.cloud.ega.or.th"
    nfs_ip = "192.168.170.102"
    vmotion_ip = "192.168.168.102"
    iscsiBootPG2 = "NONE"
}

$dc01 = New-Object PSObject -Property @{
    name = "dc-ucs01.cloud.ega.or.th"
    nfs_ip = "192.168.170.101"
    vmotion_ip = "192.168.168.101"
    iscsiBootPG2 = "NONE"
}

$mypasswd = Import-Clixml -Path "E:\PoCLI\passwd.xml"
#$username = $mypasswd.username | out-string
$conn = Connect-VIServer -Server xxxxxxx -Credential $mypasswd


$vmhosts = @(
    $dc08
)


$ADCredential = Import-Clixml -Path "E:\pocli\projects\confESXi\ADPasswd.xml"

foreach($i in $vmhosts){
    
    $esx = Get-VMHost -name $i.name
    
    $esx | Add-VMHostNtpServer -NtpServer time.ega.or.th,time1.nimt.or.th
	$esx | Get-VMHostFirewallException | where { $_.Name -eq "NTP Client"} | Set-VMHostFirewallException -Enabled:$true
	$esx | Get-VMHostService | ? {$_.Key -eq "ntpd"} | start-VMHostService
    $esx | Get-VMHostService | ? {$_.Key -eq "ntpd"} | Set-VMHostService -Policy "automatic"
    
    $esx | Set-VMhostDumpCollector
    $esx | Get-AdvancedSetting -Name "NFS.MaxVolumes" | Set-AdvancedSetting -Value 32 -Confirm:$false 
    $esx | Set-VMHostSysLogServer -SysLogServer "udp://192.168.100.2:514" 
    $esx | Get-VMHostAuthentication | Set-VMHostAuthentication -JoinDomain -Domain "cloud.ega.or.th" -Credential $ADCredential -Confirm:$false
    
    # Make vSwich0(management) have FT,vMotion 
    #$esx | Get-VMHostNetworkAdapter -Name vmk0 | Set-VMHostNetworkAdapter -VMotionEnabled $true -FaultToleranceLoggingEnabled $true -Confirm:$false
    $esx | Get-VMHostNetworkAdapter -Name vmk0 | Set-VMHostNetworkAdapter -FaultToleranceLoggingEnabled $true -Confirm:$false
    # Create vmnet on Management
    $esx | Get-VirtualSwitch -Name vSwitch0 | New-VirtualPortGroup -Name "Management Network-1091" -VLanId 1091
    $esx | Get-VirtualSwitch -Name vSwitch0 | New-VirtualPortGroup -Name "Management Network-109" -VLanId 109
    $esx | Get-VirtualSwitch -Name vSwitch0 | New-VirtualPortGroup -Name "Management Network-103" -VLanId 103
    $esx | Get-VirtualSwitch -Name vSwitch0 | New-VirtualPortGroup -Name "10.3.1.x" -VLanId 103
    $esx | Get-VirtualSwitch -Name vSwitch0 | New-VirtualPortGroup -Name "172.17.18.x" -VLanId 18
    $esx | Get-VirtualSwitch -Name vSwitch0 | New-VirtualPortGroup -Name "Management Network-18" -VLanId 18 
    
    if($i.iscsiBootPG2 -ne "NONE"){
        $esx | Get-VirtualSwitch -Name iScsiBootvSwitch | Set-VirtualSwitch -Mtu 9000 -Nic vmnic10,vmnic11 -Confirm:$false
        #$esx | Get-VMHostNetworkAdapter -PortGroup iScsiBootPG | Set-VMHostNetworkAdapter -Mtu 9000 -Confirm:$false
        $esx | Get-VMHostNetworkAdapter -Name vmk1 | Set-VMHostNetworkAdapter -Mtu 9000 -Confirm:$false
        $esx | New-VMHostNetworkAdapter -PortGroup "iScsiBootPG2" -VirtualSwitch iScsiBootvSwitch -IP $i.iscsiBootPG2 -SubnetMask 255.255.255.0 -mtu 9000 -Confirm:$false
        $esx | Get-VirtualPortGroup -name iSCSIBootPG | Get-NicTeamingPolicy | Set-NicTeamingPolicy -MakeNicActive vmnic10 -MakeNicUnused vmnic11
        $esx | Get-VirtualPortGroup -name iSCSIBootPG2 | Get-NicTeamingPolicy | Set-NicTeamingPolicy -MakeNicActive vmnic11 -MakeNicUnused vmnic10
    }
    
    # Make new switch for NFS 
    $esx | New-VirtualSwitch -Name NAS-vSwitch -Nic vmnic2,vmnic3 -Mtu 9000
    $esx | New-VMHostNetworkAdapter -PortGroup "NAS-ESXi" -VirtualSwitch NAS-vSwitch -IP $i.nfs_ip -SubnetMask 255.255.255.0 -mtu 9000
    $esx | Get-VirtualPortGroup -Name "NAS-ESXi" |Set-VirtualPortGroup -VLanId 170
    $esx | New-VMHostNetworkAdapter -PortGroup "vMotion" -VirtualSwitch NAS-vSwitch -IP $i.vmotion_ip -SubnetMask 255.255.255.0 -mtu 1500
    $esx | Get-VirtualPortGroup -Name "vMotion" |Set-VirtualPortGroup -VLanId 168
    $esx | Get-VMHostNetworkAdapter -Name vmk4 | Set-VMHostNetworkAdapter -VMotionEnabled $true -Confirm:$false
    $esx | Get-VirtualSwitch -Name NAS-vSwitch | New-VirtualPortGroup -Name "NAS-GuestVM" -VLanId 170
    # Add Datastore 
    $esx | New-Datastore -Name DC-FAS8040-01 -Path "/NFS0_vol" -NfsHost 192.168.170.11
    $esx | New-Datastore -Name DC-FAS8040-02 -Path "/NFS1_vol" -NfsHost 192.168.170.12
    $esx | New-Datastore -Name DC-FAS8040-03 -Path "/NFS3_vol" -NfsHost 192.168.170.12
    $esx | New-Datastore -Name DC-FAS8040-04 -Path "/NFS4_vol" -NfsHost 192.168.170.11
    $esx | New-Datastore -Name DC-FAS8040-05 -Path "/NFS5_vol" -NfsHost 192.168.170.11
    $esx | New-Datastore -Name DC-FAS8040-06 -Path "/NFS6_vol" -NfsHost 192.168.170.12
    $esx | New-Datastore -Name DC-FAS8040-07 -Path "/NFS7_vol" -NfsHost 192.168.170.11
    $esx | New-Datastore -Name DC-FAS8040-08 -Path "/NFS8_vol/" -NfsHost 192.168.170.11
    $esx | New-Datastore -Name DC-FAS8040-09 -Path "/NFS9_vol" -NfsHost 192.168.170.12
    $esx | New-Datastore -Name DC-FAS8040-10 -Path "/NFS10_vol" -NfsHost 192.168.170.12
    $esx | New-Datastore -Name DC-FAS8040-11 -Path "/NFS11" -NfsHost 192.168.170.11
    $esx | New-Datastore -Name DC-FAS8040-12 -Path "/NFS12" -NfsHost 192.168.170.12
    $esx | New-Datastore -Name DC-FAS8040-13 -Path "/NFS13" -NfsHost 192.168.170.11

    #$esx | New-Datastore -Name FAS8040_MAIL_01 -Path "/MAIL_01" -NfsHost 192.168.170.12
    #$esx | New-Datastore -Name FAS8040_MAIL_02 -Path "/MAIL_02" -NfsHost 192.168.170.11

    $esx | New-Datastore -Name DC-FAS8040-MGT01 -Path "/MGT01" -NfsHost 192.168.170.11
    $esx | New-Datastore -Name DC-FAS8040-MGT02 -Path "/MGT02" -NfsHost 192.168.170.12
    $esx | New-Datastore -Name DC-FAS8040-MGT03 -Path "/MGT03" -NfsHost 192.168.170.11

    $esx | New-Datastore -Name DC-FAS8040-SSD -Path "/NFS_SSD/" -NfsHost 192.168.170.12

    $esx | New-Datastore -Name DR-NFS-SRM01 -Path "/NFS_SRM01" -NfsHost 192.168.170.11
    $esx | New-Datastore -Name NFS_SRM02_MIRROR2 -Path "/NFS_SRM02" -NfsHost 192.168.170.12

    $esx | New-Datastore -Name VeeamRepo01 -Path "/VeeamRepo01" -NfsHost 192.168.170.21
    
    $esx | New-Datastore -Name NetappSG -Path "/NetappSG" -NfsHost 192.168.170.21

    $esx | New-Datastore -Name PowerOff -Path "/PowerOff" -NfsHost 192.168.170.22

    $esx | New-Datastore -Name SARABAN_SRM -Path "/SARABAN_SRM" -NfsHost 192.168.170.12
    
    $esx | New-VirtualSwitch -Name Prod-vSwitch -Nic vmnic8,vmnic9 -Mtu 1500
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2300-10.10.44.x" -VLanId 2300
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2317-10.111.17.x" -VLanId 2317
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2336-10.111.36.x" -VLanId 2336
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2337-10.111.37.x" -VLanId 2337
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2338-10.111.38.x" -VLanId 2338
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2339-10.111.39.x" -VLanId 2339
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2370-10.111.5.x" -VLanId 2370
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2371-10.111.6.x" -VLanId 2371
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2372-10.111.7.x" -VLanId 2372
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2373-10.111.8.x" -VLanId 2373
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2473-10.111.8.x-ByPass" -VLanId 2473
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2500-123.242.131.192/128" -VLanId 2500
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2350-10.111.50.x" -VLanId 2350
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2351-10.111.51.x" -VLanId 2351
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2352-10.111.52.x" -VLanId 2352
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2353-10.111.53.x" -VLanId 2353
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2354-10.111.54.x" -VLanId 2354
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2355-10.111.55.x" -VLanId 2355
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2356-10.111.56.x" -VLanId 2356
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2357-10.111.57.x" -VLanId 2357
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2358-10.111.58.x" -VLanId 2358
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-GIN-2359-10.111.59.x" -VLanId 2359
                               
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-17-172.17.17.x" -VLanId 17
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1917-192.168.17.x" -VLanId 1917
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1932-192.168.32.x" -VLanId 1932
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1933-192.168.33.x" -VLanId 1933
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1934-192.168.34.x" -VLanId 1934
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1935-192.168.35.x" -VLanId 1935
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1936-192.168.36.x" -VLanId 1936
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1937-192.168.37.x" -VLanId 1937
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1938-192.168.38.x" -VLanId 1938
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1939-192.168.39.x" -VLanId 1939
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1950-192.168.50.x" -VLanId 1950
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1951-192.168.51.x" -VLanId 1951
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1952-192.168.52.x" -VLanId 1952
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1953-192.168.53.x" -VLanId 1953
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1954-192.168.54.x" -VLanId 1954
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1955-192.168.55.x" -VLanId 1955
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1956-192.168.56.x" -VLanId 1956
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1957-192.168.57.x" -VLanId 1957
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1958-192.168.58.x" -VLanId 1958
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Private-1959-192.168.59.x" -VLanId 1959
                               
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2017-164.115.17.x" -VLanId 2017
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2032-164.115.32.x" -VLanId 2032
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2033-164.115.33.x" -VLanId 2033
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2034-164.115.34.x" -VLanId 2034
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2035-164.115.35.x" -VLanId 2035
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2036-164.115.36.x" -VLanId 2036
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2037-164.115.37.x" -VLanId 2037
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2038-164.115.38.x" -VLanId 2038
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2039-164.115.39.x" -VLanId 2039
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-301-164.115.5.x" -VLanId 301
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-302-164.115.4.x" -VLanId 302
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-304-164.115.2.x" -VLanId 304
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-305-164.115.3.x" -VLanId 305
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-649-164.115.9.x" -VLanId 649
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2050-164.115.50.x" -VLanId 2050
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2051-164.115.51.x" -VLanId 2051
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2052-164.115.52.x" -VLanId 2052
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2053-164.115.53.x" -VLanId 2053
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2054-164.115.54.x" -VLanId 2054
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2055-164.115.55.x" -VLanId 2055
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2056-164.115.56.x" -VLanId 2056
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2057-164.115.57.x" -VLanId 2057
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2058-164.115.58.x" -VLanId 2058
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Public-2059-164.115.59.x" -VLanId 2059

    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-ALL" -VLanId 4095
    
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-OTV-176-192.168.176.x" -VLanId 176
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-OTV-177-192.168.177.x" -VLanId 177
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-OTV-178-192.168.178.x" -VLanId 178
    $esx | Get-VirtualSwitch -Name Prod-vSwitch | New-VirtualPortGroup -Name "vsDC-Legacy-302-192.168.8.x" -VLanId 302
    
}


Disconnect-VIServer -Server * -Force -Confirm:$false
