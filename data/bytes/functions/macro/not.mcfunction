#> bytes:macro/not
# @input macro arg0
# @input macro p_result out result*
# @output result* (byte)~arg0
$data modify $(p_result) set from storage bytes:const not[$(arg0)]
