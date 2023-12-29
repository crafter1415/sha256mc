#> ints:macro/xor
# @input macro p_arg0 *arg0
# @input macro p_arg1 *arg1
# @input macro.p_result *result
# @output result (*arg0)^(*arg1)

data modify storage ints: xor set value {p_result:"storage ints: xor.result[0]",result:[B;0b,0b,0b,0b]}
$data modify storage ints: xor.arg0 set from $(p_arg0)[0]
$data modify storage ints: xor.arg1 set from $(p_arg1)[0]
function bytes:macro/xor with storage ints: xor
data modify storage ints: xor.p_result set value "storage ints: xor.result[1]"
$data modify storage ints: xor.arg0 set from $(p_arg0)[1]
$data modify storage ints: xor.arg1 set from $(p_arg1)[1]
function bytes:macro/xor with storage ints: xor
data modify storage ints: xor.p_result set value "storage ints: xor.result[2]"
$data modify storage ints: xor.arg0 set from $(p_arg0)[2]
$data modify storage ints: xor.arg1 set from $(p_arg1)[2]
function bytes:macro/xor with storage ints: xor
data modify storage ints: xor.p_result set value "storage ints: xor.result[3]"
$data modify storage ints: xor.arg0 set from $(p_arg0)[3]
$data modify storage ints: xor.arg1 set from $(p_arg1)[3]
function bytes:macro/xor with storage ints: xor
$data modify $(p_result) set from storage ints: xor.result
data remove storage ints: xor
