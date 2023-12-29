#> ints:macro/or
# @input macro p_arg0 *arg0
# @input macro p_arg1 *arg1
# @input macro.p_result *result
# @output result (*arg0)|(*arg1)

data modify storage ints: or set value {p_result:"storage ints: or.result[0]",result:[B;0b,0b,0b,0b]}
$data modify storage ints: or.arg0 set from $(p_arg0)[0]
$data modify storage ints: or.arg1 set from $(p_arg1)[0]
function bytes:macro/or with storage ints: or
data modify storage ints: or.p_result set value "storage ints: or.result[1]"
$data modify storage ints: or.arg0 set from $(p_arg0)[1]
$data modify storage ints: or.arg1 set from $(p_arg1)[1]
function bytes:macro/or with storage ints: or
data modify storage ints: or.p_result set value "storage ints: or.result[2]"
$data modify storage ints: or.arg0 set from $(p_arg0)[2]
$data modify storage ints: or.arg1 set from $(p_arg1)[2]
function bytes:macro/or with storage ints: or
data modify storage ints: or.p_result set value "storage ints: or.result[3]"
$data modify storage ints: or.arg0 set from $(p_arg0)[3]
$data modify storage ints: or.arg1 set from $(p_arg1)[3]
function bytes:macro/or with storage ints: or
$data modify $(p_result) set from storage ints: or.result
data remove storage ints: or
