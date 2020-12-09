write-output "Hardware Description"
get-wmiobject win32_diskdrive | foreach {
new-object -typename psobject -property @{Manufacturer=$_.Manufacturer;Model=$_.Model;
SerialNumber=$_.SerialNumber;FirmwareRevision=$_.FirmwareRevision;Size=($_.size / 1GB).tostring() + " GB"}
}
write-output "Operating System"
get-wmiobject -class win32_operatingsystem |
Format-list   @{Label="Operating System Name "; Expression={$_.name}},
@{Label="Version"; Expression={$_.version}}

write-output "Processor Info"
get-wmiobject -class win32_processor |Where-Object MaxClockSpeed -ne $null |
foreach {
 new-object -TypeName psobject -Property @{
 "Speed(GHz)" = $_.MaxClockSpeed
 "Number of Core" = $_.NumberOfCores
 "L1 CahcheSize(MB)" = $_.L1CacheSize/1kb
 "L2 CacheSize(MB)" = $_.L2CacheSize/1kb
 "L3 CacheSize(MB)" = $_.L3CacheSize/1kb
 }
} |
Format-list  "Speed(GHz)","Number of Core","L2 CacheSize(MB)","L3 CacheSize(MB)"

write-output "Memory"
$totalmemory = 0
get-wmiobject -class win32_physicalmemory |
foreach {
 new-object -TypeName psobject -Property @{
 "Vendor" = $_.manufacturer
 "Description" = $_.Description
 "Speed(MHz)" = $_.ConfiguredClockSpeed
 "Size(MB)" = $_.capacity/1mb
 "Bank" = $_.banklabel
 "Slot" = $_.devicelocator
 }
 $totalmemory += $_.capacity/1mb
} |
Format-Table -AutoSize "Vendor","Description", "Size(MB)", "Speed(MHz)", "Bank", "Slot"
"Total RAM: ${totalmemory}MB "

write-output "Disk Info"
$disks=Get-WmiObject -class  win32_logicaldisk |  where-object size -gt 0 

$diskConfig=foreach ($disk in $disks) {
$part = $disk.GetRelated('win32_diskpartition')
$drive = $part.GetRelated('win32_diskdrive')
    
     new-object -TypeName psobject -Property @{
     "Vendor" = $drive.manufacturer
     "model" = $drive.model
     "Size(GB)"=$drive.size/1gb -as [int]
     "Free space(GB)"=$disk.freespace/1gb -as [int] 
     "% Free"=100*$disk.freespace/$drive.size  -as [int]

}
} 
$diskConfig|Format-Table -AutoSize "Vendor","model","Size(GB)","Free space(GB)","% Free"

write-output "Video Card"
get-wmiobject -class win32_videocontroller |
Format-list   @{Label="Vendor"; Expression={$_.AdapterCompatibility}},
@{Label="Description"; Expression={$_.Description}},
@{Label="Current Screen Resolution(Pixels)"; Expression={$_.CurrentHorizontalResolution*$_.CurrentVerticalResolution }}