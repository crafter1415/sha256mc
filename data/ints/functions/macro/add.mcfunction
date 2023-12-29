#> ints:macro/add
# @input macro p_arg0 *arg0
# @input macro p_arg1 *arg1
# @input macro.p_result *result
# @output result *arg0+*arg1

data modify storage ints: add set value {arg2:0b,p_result:"storage ints: add.result[-1]",p_carry:"storage ints: add.arg2",result:[B;0b,0b,0b,0b]}
$data modify storage ints: add.arg0 set from $(p_arg0)[-1]
$data modify storage ints: add.arg1 set from $(p_arg1)[-1]
function bytes:macro/add with storage ints: add
data modify storage ints: add.p_result set value "storage ints: add.result[-2]"
$data modify storage ints: add.arg0 set from $(p_arg0)[-2]
$data modify storage ints: add.arg1 set from $(p_arg1)[-2]
function bytes:macro/add with storage ints: add
data modify storage ints: add.p_result set value "storage ints: add.result[-3]"
$data modify storage ints: add.arg0 set from $(p_arg0)[-3]
$data modify storage ints: add.arg1 set from $(p_arg1)[-3]
function bytes:macro/add with storage ints: add
data modify storage ints: add.p_result set value "storage ints: add.result[-4]"
$data modify storage ints: add.arg0 set from $(p_arg0)[-4]
$data modify storage ints: add.arg1 set from $(p_arg1)[-4]
function bytes:macro/add with storage ints: add
$data modify $(p_result) set from storage ints: add.result
data remove storage ints: add
