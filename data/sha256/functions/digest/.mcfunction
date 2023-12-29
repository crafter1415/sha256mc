#> sha256:digest/
# @input storage sha256: digest.arg0 byte[0..] or null
# @output storage sha256: digest.result byte[32]
# @api
# @user

execute if data storage sha256: digest.arg0[0] run data modify storage sha256: update.arg0 set from storage sha256: digest.arg0
execute if data storage sha256: digest.arg0[0] run function sha256:update/
execute if data storage sha256: digest.arg0[0] run data remove storage sha256: update
function sha256:padding/

data modify storage sha256: digest.bytes set value [B;]
data modify storage sha256: digest.bytes append from storage sha256: h[][]

data modify storage sha256: digest.tmp set value {}
function ints:macro/hex {p_arg0:"storage sha256: h[0]",p_result:"storage sha256: digest.tmp.0"}
function ints:macro/hex {p_arg0:"storage sha256: h[1]",p_result:"storage sha256: digest.tmp.1"}
function ints:macro/hex {p_arg0:"storage sha256: h[2]",p_result:"storage sha256: digest.tmp.2"}
function ints:macro/hex {p_arg0:"storage sha256: h[3]",p_result:"storage sha256: digest.tmp.3"}
function ints:macro/hex {p_arg0:"storage sha256: h[4]",p_result:"storage sha256: digest.tmp.4"}
function ints:macro/hex {p_arg0:"storage sha256: h[5]",p_result:"storage sha256: digest.tmp.5"}
function ints:macro/hex {p_arg0:"storage sha256: h[6]",p_result:"storage sha256: digest.tmp.6"}
function ints:macro/hex {p_arg0:"storage sha256: h[7]",p_result:"storage sha256: digest.tmp.7"}
function sha256:digest/join.macro with storage sha256: digest.tmp
data remove storage sha256: digest.tmp

function sha256:reset/
