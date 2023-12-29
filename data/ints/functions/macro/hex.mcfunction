#> ints:macro/hex
# @input macro p_arg0 *arg0
# @input macro.p_result *result
# @output result hex value that represents *arg0


data modify storage ints: hex set value {p_result:"storage ints: hex.0",result:"",0:"",1:"",2:"",3:""}
$data modify storage ints: hex.arg0 set from $(p_arg0)[0]
function bytes:macro/hex with storage ints: hex
data modify storage ints: hex.p_result set value "storage ints: hex.1"
$data modify storage ints: hex.arg0 set from $(p_arg0)[1]
function bytes:macro/hex with storage ints: hex
data modify storage ints: hex.p_result set value "storage ints: hex.2"
$data modify storage ints: hex.arg0 set from $(p_arg0)[2]
function bytes:macro/hex with storage ints: hex
data modify storage ints: hex.p_result set value "storage ints: hex.3"
$data modify storage ints: hex.arg0 set from $(p_arg0)[3]
function bytes:macro/hex with storage ints: hex
function ints:loop/hexjoin with storage ints: hex
$data modify $(p_result) set from storage ints: hex.result
data remove storage ints: hex
