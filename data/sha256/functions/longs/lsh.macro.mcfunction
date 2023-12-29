#> sha256:longs/lsh.macro
# @input macro p_arg0 *arg0
# @input macro arg1 arg1
# @input macro p_result *result
# @output result *arg0<<arg1
# @internal

$data modify storage sha256: longs.lsh.buf set from $(p_arg0)
$data modify storage sha256: longs.lsh.div8 set from storage sha256:const div8[$(arg1)]
execute unless data storage sha256: longs.lsh{div8:0b} run function sha256:longs/lsh_.macro
$data modify storage sha256: longs.lsh.arg1 set from storage sha256:const mod8[$(arg1)]
$execute if data storage sha256: longs.lsh{arg1:0b} run data modify $(p_result) set from storage sha256: longs.lsh.buf
execute if data storage sha256: longs.lsh{arg1:0b} run data remove storage sha256: longs.lsh
execute unless data storage sha256: longs.lsh run return 1

# コピー済なので置き換え可能
data modify storage sha256: longs.lsh merge value {p_result:"storage sha256: longs.lsh.result[0]",result:[B;0b,0b,0b,0b,0b,0b,0b,0b]}
data modify storage sha256: longs.lsh.arg0 set from storage sha256: longs.lsh.buf[0]
data modify storage sha256: longs.lsh.arg2 set from storage sha256: longs.lsh.buf[1]
function bytes:macro/lsh_plus with storage sha256: longs.lsh
data modify storage sha256: longs.lsh.p_result set value "storage sha256: longs.lsh.result[1]"
data modify storage sha256: longs.lsh.arg0 set from storage sha256: longs.lsh.buf[1]
data modify storage sha256: longs.lsh.arg2 set from storage sha256: longs.lsh.buf[2]
function bytes:macro/lsh_plus with storage sha256: longs.lsh
data modify storage sha256: longs.lsh.p_result set value "storage sha256: longs.lsh.result[2]"
data modify storage sha256: longs.lsh.arg0 set from storage sha256: longs.lsh.buf[2]
data modify storage sha256: longs.lsh.arg2 set from storage sha256: longs.lsh.buf[3]
function bytes:macro/lsh_plus with storage sha256: longs.lsh
data modify storage sha256: longs.lsh.p_result set value "storage sha256: longs.lsh.result[3]"
data modify storage sha256: longs.lsh.arg0 set from storage sha256: longs.lsh.buf[3]
data modify storage sha256: longs.lsh.arg2 set from storage sha256: longs.lsh.buf[4]
function bytes:macro/lsh_plus with storage sha256: longs.lsh
data modify storage sha256: longs.lsh.p_result set value "storage sha256: longs.lsh.result[4]"
data modify storage sha256: longs.lsh.arg0 set from storage sha256: longs.lsh.buf[4]
data modify storage sha256: longs.lsh.arg2 set from storage sha256: longs.lsh.buf[5]
function bytes:macro/lsh_plus with storage sha256: longs.lsh
data modify storage sha256: longs.lsh.p_result set value "storage sha256: longs.lsh.result[5]"
data modify storage sha256: longs.lsh.arg0 set from storage sha256: longs.lsh.buf[5]
data modify storage sha256: longs.lsh.arg2 set from storage sha256: longs.lsh.buf[6]
function bytes:macro/lsh_plus with storage sha256: longs.lsh
data modify storage sha256: longs.lsh.p_result set value "storage sha256: longs.lsh.result[6]"
data modify storage sha256: longs.lsh.arg0 set from storage sha256: longs.lsh.buf[6]
data modify storage sha256: longs.lsh.arg2 set from storage sha256: longs.lsh.buf[7]
function bytes:macro/lsh_plus with storage sha256: longs.lsh
data modify storage sha256: longs.lsh.p_result set value "storage sha256: longs.lsh.result[7]"
data modify storage sha256: longs.lsh.arg0 set from storage sha256: longs.lsh.buf[7]
data modify storage sha256: longs.lsh.arg2 set value 0b
function bytes:macro/lsh_plus with storage sha256: longs.lsh
$data modify $(p_result) set from storage sha256: longs.lsh.result
data remove storage sha256: longs.lsh
