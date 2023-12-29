#> ints:macro/not
# @input macro p_arg0 *arg0
# @input macro.p_result *result
# @output result ~(*arg0)

data modify storage ints: not set value {p_result:"storage ints: not.result[0]",result:[B;0b,0b,0b,0b]}
$data modify storage ints: not.arg0 set from $(p_arg0)[0]
function bytes:macro/not with storage ints: not
data modify storage ints: not.p_result set value "storage ints: not.result[1]"
$data modify storage ints: not.arg0 set from $(p_arg0)[1]
function bytes:macro/not with storage ints: not
data modify storage ints: not.p_result set value "storage ints: not.result[2]"
$data modify storage ints: not.arg0 set from $(p_arg0)[2]
function bytes:macro/not with storage ints: not
data modify storage ints: not.p_result set value "storage ints: not.result[3]"
$data modify storage ints: not.arg0 set from $(p_arg0)[3]
function bytes:macro/not with storage ints: not
$data modify $(p_result) set from storage ints: not.result
data remove storage ints: not
