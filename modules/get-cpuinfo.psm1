$model = (get-ciminstance cim_processor).Name
$manufacturer = (get-ciminstance cim_processor).Manufacturer
$speed = (get-ciminstance cim_processor).MaxClockSpeed
$speed_now = (get-ciminstance cim_processor).CurrentClockSpeed
$cores = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
write-output ""
write-output "Your CPU is an $model made by $manufacturer.
The current speed is $speed_now
Its max speed is $speed.
The number of cores is $cores"
