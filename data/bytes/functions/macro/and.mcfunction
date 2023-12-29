#> bytes:macro/and
# @input macro arg0
# @input macro arg1
# @input macro p_result out *result
# @output result (byte)(arg0&arg1)
$data modify $(p_result) set from storage bytes:const and[$(arg0)][$(arg1)]
