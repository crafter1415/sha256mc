#> ints:macro/rsh
# @input macro p_arg0 *arg0
# @input macro arg1 arg1
# @input macro p_result *result
# @output result *arg0>>>arg1

$data modify storage ints: rsh.buf set from $(p_arg0)
$data modify storage ints: rsh.div8 set from storage ints:const div8[$(arg1)]
execute unless data storage ints: rsh{div8:0b} run function ints:loop/rsh
$data modify storage ints: rsh.arg1 set from storage ints:const mod8[$(arg1)]
$execute if data storage ints: rsh{arg1:0b} run data modify $(p_result) set from storage ints: rsh.buf
execute if data storage ints: rsh{arg1:0b} run data remove storage ints: rsh
execute unless data storage ints: rsh run return 1

data modify storage ints: rsh merge value {p_result:"storage ints: rsh.result[0]",result:[B;0b,0b,0b,0b]}
data modify storage ints: rsh.arg0 set from storage ints: rsh.buf[0]
data modify storage ints: rsh.arg2 set value 0b
function bytes:macro/rsh_plus with storage ints: rsh
data modify storage ints: rsh.p_result set value "storage ints: rsh.result[1]"
data modify storage ints: rsh.arg0 set from storage ints: rsh.buf[1]
data modify storage ints: rsh.arg2 set from storage ints: rsh.buf[0]
function bytes:macro/rsh_plus with storage ints: rsh
data modify storage ints: rsh.p_result set value "storage ints: rsh.result[2]"
data modify storage ints: rsh.arg0 set from storage ints: rsh.buf[2]
data modify storage ints: rsh.arg2 set from storage ints: rsh.buf[1]
function bytes:macro/rsh_plus with storage ints: rsh
data modify storage ints: rsh.p_result set value "storage ints: rsh.result[3]"
data modify storage ints: rsh.arg0 set from storage ints: rsh.buf[3]
data modify storage ints: rsh.arg2 set from storage ints: rsh.buf[2]
function bytes:macro/rsh_plus with storage ints: rsh
$data modify $(p_result) set from storage ints: rsh.result
data remove storage ints: rsh
