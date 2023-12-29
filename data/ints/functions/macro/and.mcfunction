#> ints:macro/and
# @input macro p_arg0 *arg0
# @input macro p_arg1 *arg1
# @input macro.p_result *result
# @output result (*arg0)&(*arg1)

data modify storage ints: and set value {result:[B;0b,0b,0b,0b],p_result:"storage ints: and.result[0]"}
$data modify storage ints: and.arg0 set from $(p_arg0)[0]
$data modify storage ints: and.arg1 set from $(p_arg1)[0]
function bytes:macro/and with storage ints: and
data modify storage ints: and.p_result set value "storage ints: and.result[1]"
$data modify storage ints: and.arg0 set from $(p_arg0)[1]
$data modify storage ints: and.arg1 set from $(p_arg1)[1]
function bytes:macro/and with storage ints: and
data modify storage ints: and.p_result set value "storage ints: and.result[2]"
$data modify storage ints: and.arg0 set from $(p_arg0)[2]
$data modify storage ints: and.arg1 set from $(p_arg1)[2]
function bytes:macro/and with storage ints: and
data modify storage ints: and.p_result set value "storage ints: and.result[3]"
$data modify storage ints: and.arg0 set from $(p_arg0)[3]
$data modify storage ints: and.arg1 set from $(p_arg1)[3]
function bytes:macro/and with storage ints: and
$data modify $(p_result) set from storage ints: and.result
data remove storage ints: and
