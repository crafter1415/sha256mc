#> sha256:longs/add.macro
# @input macro p_arg0 *arg0
# @input macro p_arg1 *arg1
# @input macro.p_result *result
# @output result *arg0+*arg1
# @internal

data modify storage sha256: longs.add set value {arg2:0b,p_result:"storage sha256: longs.add.result[-1]",p_carry:"storage sha256: longs.add.arg2",result:[B;0b,0b,0b,0b,0b,0b,0b,0b]}
$data modify storage sha256: longs.add.arg0 set from $(p_arg0)[-1]
$data modify storage sha256: longs.add.arg1 set from $(p_arg1)[-1]
function bytes:macro/add with storage sha256: longs.add
data modify storage sha256: longs.add.p_result set value "storage sha256: longs.add.result[-2]"
$data modify storage sha256: longs.add.arg0 set from $(p_arg0)[-2]
$data modify storage sha256: longs.add.arg1 set from $(p_arg1)[-2]
function bytes:macro/add with storage sha256: longs.add
data modify storage sha256: longs.add.p_result set value "storage sha256: longs.add.result[-3]"
$data modify storage sha256: longs.add.arg0 set from $(p_arg0)[-3]
$data modify storage sha256: longs.add.arg1 set from $(p_arg1)[-3]
function bytes:macro/add with storage sha256: longs.add
data modify storage sha256: longs.add.p_result set value "storage sha256: longs.add.result[-4]"
$data modify storage sha256: longs.add.arg0 set from $(p_arg0)[-4]
$data modify storage sha256: longs.add.arg1 set from $(p_arg1)[-4]
function bytes:macro/add with storage sha256: longs.add
data modify storage sha256: longs.add.p_result set value "storage sha256: longs.add.result[-5]"
$data modify storage sha256: longs.add.arg0 set from $(p_arg0)[-5]
$data modify storage sha256: longs.add.arg1 set from $(p_arg1)[-5]
function bytes:macro/add with storage sha256: longs.add
data modify storage sha256: longs.add.p_result set value "storage sha256: longs.add.result[-6]"
$data modify storage sha256: longs.add.arg0 set from $(p_arg0)[-6]
$data modify storage sha256: longs.add.arg1 set from $(p_arg1)[-6]
function bytes:macro/add with storage sha256: longs.add
data modify storage sha256: longs.add.p_result set value "storage sha256: longs.add.result[-7]"
$data modify storage sha256: longs.add.arg0 set from $(p_arg0)[-7]
$data modify storage sha256: longs.add.arg1 set from $(p_arg1)[-7]
function bytes:macro/add with storage sha256: longs.add
data modify storage sha256: longs.add.p_result set value "storage sha256: longs.add.result[-8]"
$data modify storage sha256: longs.add.arg0 set from $(p_arg0)[-8]
$data modify storage sha256: longs.add.arg1 set from $(p_arg1)[-8]
function bytes:macro/add with storage sha256: longs.add
$data modify $(p_result) set from storage sha256: longs.add.result
data remove storage sha256: longs.add
