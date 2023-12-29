#> bytes:macro/lsh_plus
# @input macro arg0 target
# @input macro arg1 shift: must be in range [0,8)
# @input macro arg2 value on right
# @input macro p_result out result*
# @output result* (byte)(arg0<<arg1)
$data modify $(p_result) set from storage bytes:const lsh[$(arg1)][$(arg2)][$(arg0)]
