#> bytes:macro/rsh
# @input macro arg0 value
# @input macro arg1 shift: must be in range [0,8)
# @input macro p_result out result*
# @output result* (byte)(arg0>>>arg1)
$data modify $(p_result) set from storage bytes:const rsh[$(arg1)][0][$(arg0)]
