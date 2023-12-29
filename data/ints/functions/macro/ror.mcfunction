#> ints:macro/ror
# @input macro p_arg0 *arg0
# @input macro arg1 arg1 rotate: should be in range [0,32)
# @input macro.p_result *result
# @output result (*arg0<<arg1)|(*arg0>>>(32-arg1))

# rsh->lsh->or でも可能だが計算量が3倍になるのでrsh_plusをうまい事使って一回で終わらせる

$data modify storage ints: ror.buf set from $(p_arg0)
$data modify storage ints: ror.div8 set from storage ints:const div8[$(arg1)]
execute unless data storage ints: ror{div8:0b} run function ints:loop/ror
$data modify storage ints: ror.arg1 set from storage ints:const mod8[$(arg1)]
$execute if data storage ints: ror{arg1:0b} run data modify $(p_result) set from storage ints: ror.buf
execute if data storage ints: ror{arg1:0b} run data remove storage ints: ror
execute unless data storage ints: ror run return 1

data modify storage ints: ror merge value {p_result:"storage ints: ror.result[0]",result:[B;0b,0b,0b,0b]}
data modify storage ints: ror.arg0 set from storage ints: ror.buf[0]
data modify storage ints: ror.arg2 set from storage ints: ror.buf[3]
function bytes:macro/rsh_plus with storage ints: ror
data modify storage ints: ror.p_result set value "storage ints: ror.result[1]"
data modify storage ints: ror.arg0 set from storage ints: ror.buf[1]
data modify storage ints: ror.arg2 set from storage ints: ror.buf[0]
function bytes:macro/rsh_plus with storage ints: ror
data modify storage ints: ror.p_result set value "storage ints: ror.result[2]"
data modify storage ints: ror.arg0 set from storage ints: ror.buf[2]
data modify storage ints: ror.arg2 set from storage ints: ror.buf[1]
function bytes:macro/rsh_plus with storage ints: ror
data modify storage ints: ror.p_result set value "storage ints: ror.result[3]"
data modify storage ints: ror.arg0 set from storage ints: ror.buf[3]
data modify storage ints: ror.arg2 set from storage ints: ror.buf[2]
function bytes:macro/rsh_plus with storage ints: ror
$data modify $(p_result) set from storage ints: ror.result
data remove storage ints: ror
