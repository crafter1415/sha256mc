#> bytes:macro/hex
# @input macro arg0
# @input macro arg1
# @input macro p_result result*
# @output result* 2 digits lowercased hex string represents arg0
$data modify $(p_result) set from storage bytes:const hex[$(arg0)]
