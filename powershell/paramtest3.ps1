param ( [switch]$System, 
        [switch]$Disks,
        [switch]$Network
)



$System -eq $false -and $Disks -eq $false -and $Network
    WMI-Objects.ps1
    ""
"### NETWORK ###"
get-ciminstance win32_networkadapterconfiguration |
where-object IPEnabled -eq True |
format-table Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder 
""
"### DISKS ###"
(get-wmiobject win32_diskdrive | foreach {
new-object -typename psobject -property @{Manufacturer=$_.Manufacturer;Model=$_.Model;
SerialNumber=$_.SerialNumber;FirmwareRevision=$_.FirmwareRevision;Size=($_.size / 1GB).tostring() + " GB"}
})
""