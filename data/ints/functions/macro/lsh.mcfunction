#> ints:macro/lsh
# @input macro p_arg0 *arg0
# @input macro arg1 arg1
# @input macro p_result *result
# @output result *arg0<<arg1

$data modify storage ints: lsh.buf set from $(p_arg0)
$data modify storage ints: lsh.div8 set from storage ints:const div8[$(arg1)]
execute unless data storage ints: lsh{div8:0b} run function ints:loop/lsh
$data modify storage ints: lsh.arg1 set from storage ints:const mod8[$(arg1)]
$execute if data storage ints: lsh{arg1:0b} run data modify $(p_result) set from storage ints: lsh.buf
execute if data storage ints: lsh{arg1:0b} run data remove storage ints: lsh
execute unless data storage ints: lsh run return 1

data modify storage ints: lsh merge value {p_result:"storage ints: lsh.result[0]",result:[B;0b,0b,0b,0b]}
data modify storage ints: lsh.arg0 set from storage ints: lsh.buf[0]
data modify storage ints: lsh.arg2 set from storage ints: lsh.buf[1]
function bytes:macro/lsh_plus with storage ints: lsh
data modify storage ints: lsh.p_result set value "storage ints: lsh.result[1]"
data modify storage ints: lsh.arg0 set from storage ints: lsh.buf[1]
data modify storage ints: lsh.arg2 set from storage ints: lsh.buf[2]
function bytes:macro/lsh_plus with storage ints: lsh
data modify storage ints: lsh.p_result set value "storage ints: lsh.result[2]"
data modify storage ints: lsh.arg0 set from storage ints: lsh.buf[2]
data modify storage ints: lsh.arg2 set from storage ints: lsh.buf[3]
function bytes:macro/lsh_plus with storage ints: lsh
data modify storage ints: lsh.p_result set value "storage ints: lsh.result[3]"
data modify storage ints: lsh.arg0 set from storage ints: lsh.buf[3]
data modify storage ints: lsh.arg2 set value 0b
function bytes:macro/lsh_plus with storage ints: lsh
$data modify $(p_result) set from storage ints: lsh.result
data remove storage ints: lsh
