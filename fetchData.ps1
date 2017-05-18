Add-PsSnapin VMware.* -ea "SilentlyContinue"
#$passwd =  Get-Credential | Export-Clixml -Path F:\passwd.xml 
$mypasswd = import-clixml -Path "F:\passwd.xml"
$conn = Connect-VIServer -Server 10.9.10.100 -Credential $mypasswd

$path_vmInCluster= "F:\PoCLI\vmInCluster.csv"


# Export get-cluster
#$cmd_getCluster = Get-Cluster | Select-Object Name,VsanEnabled,HAEnabled,DrsEnabled,EVCMode
#$cmd_getCluster = Get-Cluster | Select-Object Name 
#$cmd_getCluster | Export-Csv -Path $workspace"getCluster.csv" 
# Export get-vmhost
#$cmd_getESXi = Get-VMHost | Select-Object Name,Parent | Sort-Object Name
#$cmd_getESXi = Get-VMHost | Select-Object Name,Version,connectionState,PowerState,Manufacturer,Model,Numcpu,MemoryTotalGB,ProcessorType,HyperthreadingActive,MaxEVCMode | Sort-Object Name
#$cmd_getESXi | Export-Csv -Path $workspace"getESXi.csv"
# Import getCluster
#$getCluster = Import-Csv $workspace"getCluster.csv"
#$getCluster
# Import getESXi
#$getESXi = Import-Csv $workspace"getESXi.csv" | Where-Object { $_.Name -like "dc-ucs*"}
#$getESXi

function getVmInCluster {

    param ( [String]$cluster_name )
    $cmd_vmInCluster = Get-Cluster -Name $cluster_name | get-vm | Select-Object Name,Host | export-csv -Path $path_vmInCluster

}

#getVmInCluster("EGA G-Cloud")
$ESXIs = import-csv -Path $path_vmInCluster
$ESXIs | Group-Object Host | Export-Clixml F:\PoCLI\test.xml -Depth 1
