#> bytes:macro/uhex
# @input macro arg0
# @input macro p_result out result*
# @output result* 2 digits uppercased hex string represents arg0
$data modify $(p_result) set from storage bytes:const HEX[$(arg0)]
