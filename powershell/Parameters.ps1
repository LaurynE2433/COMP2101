""

"### Operating System ###"
$OS=get-wmiobject -class win32_operatingsystem | 
    Format-List @{N='Operating System'; E={$_.Caption}},
                @{N='Version'; E={$_.Version}}
($OS | Out-String).trim()
""

"### CPU ###"
$CPU=get-wmiobject -class win32_processor | 
    Format-List @{N='Vendor and Model'; E={$_.Name}},
                @{N='Clock Speed'; E={$_.MaxClockSpeed}},
                @{N='Number Of Cores'; E={$_.NumberOfCores}},
                @{N='L1 Cache Size'; E={if ($_.L1CacheSize) {$_.L1CacheSize} else {"N/A"}}},
                @{N='L2 Cache Size'; E={if ($_.L2CacheSize) {$_.L2CacheSize} else {"N/A"}}},
                @{N='L3 Cache Size'; E={if ($_.L3CacheSize) {$_.L3CacheSize} else {"N/A"}}}
($CPU | Out-String).Trim()
""

"### VIDEO ###"
$GPU=get-wmiobject -class win32_videocontroller | 
    Format-List @{N='Vendor'; E={$_.AdapterCompatibility}},
                @{N='Model'; E={$_.VideoProcessor}},
                #found how to get resolution but not how to remove all colours
                @{N='Resolution'; E={$_.VideoModeDescription}}
($GPU | Out-String).trim()
""

"### RAM ###"
$totalcapacity = 0
$RAM=get-wmiobject -class win32_physicalmemory |
    foreach {
	    new-object -TypeName psobject -Property @{
		    Manufacturer = $_.manufacturer
		    "Speed(MHz)" = $_.speed
		    "Size(GB)" = $_.capacity/1gb
		    Bank = $_.banklabel
		    Slot = $_.devicelocator
	    }
	    $totalcapacity += $_.capacity/1gb
    } | 
    Format-Table -AutoSize Manufacturer,
                           "Size(GB)",
                           "Speed(MHz)",
                           Bank,
                           Slot
($RAM | Out-String).Trim()
"Total RAM: ${totalcapacity}GB"
""