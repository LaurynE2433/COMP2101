function get-mydisks {
get-wmiobject win32_diskdrive | foreach {
new-object -typename psobject -property @{Manufacturer=$_.Manufacturer;Model=$_.Model;
SerialNumber=$_.SerialNumber;FirmwareRevision=$_.FirmwareRevision;Size=($_.size / 1GB).tostring() + " GB"}
}
}