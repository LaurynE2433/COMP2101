Param ([Parameter(Mandatory=$true,
                  position=1,
                  ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true)]$ObjectName)

"Object name was '$ObjectName'"
$objTypeName = $ObjectName.gettype().name
"$ObjectName type is $Objtypename object"