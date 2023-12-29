#> bytes:macro/add
# @input macro arg0
# @input macro arg1
# @input macro arg2 carry or 0
# @input macro p_result out *result
# @input macro p_carry out *carry
# @output result (byte)(arg0+arg1)
# @output carry 0xff<arg0+arg1
$data modify $(p_result) set from storage bytes:const add.value[$(arg2)][$(arg0)][$(arg1)]
$data modify $(p_carry) set from storage bytes:const add.carry[$(arg2)][$(arg0)][$(arg1)]
