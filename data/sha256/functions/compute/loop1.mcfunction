#> sha256:compute/loop1
# 可読性はこの世のどこかへ置いてきた
# @within sha256:compute/*
# @internal

# block_begin
## wx = w[i]+w[i+9]
function ints:macro/add {p_arg0:"storage sha256: compute.w[-16]",p_arg1:"storage sha256: compute.w[-7]",p_result:"storage sha256: compute.wx"}
## tmp0 = w[i+1]>>>3
function ints:macro/rsh {p_arg0:"storage sha256: compute.w[-15]",arg1:3,p_result:"storage sha256: compute.tmp0"}
## tmp1 = ror(w[i+1], 7)
function ints:macro/ror {p_arg0:"storage sha256: compute.w[-15]",arg1:7,p_result:"storage sha256: compute.tmp1"}
## tmp0 ^= tmp1
function ints:macro/xor {p_arg0:"storage sha256: compute.tmp0",p_arg1:"storage sha256: compute.tmp1",p_result:"storage sha256: compute.tmp0"}
## tmp1 = ror(w[i+1], 18)
function ints:macro/ror {p_arg0:"storage sha256: compute.w[-15]",arg1:18,p_result:"storage sha256: compute.tmp1"}
## tmp0 ^= tmp1
function ints:macro/xor {p_arg0:"storage sha256: compute.tmp0",p_arg1:"storage sha256: compute.tmp1",p_result:"storage sha256: compute.tmp0"}
## wx += tmp0
function ints:macro/add {p_arg0:"storage sha256: compute.wx",p_arg1:"storage sha256: compute.tmp0",p_result:"storage sha256: compute.wx"}
## tmp0 = w[i+14]>>>10
function ints:macro/rsh {p_arg0:"storage sha256: compute.w[-2]",arg1:10,p_result:"storage sha256: compute.tmp0"}
## tmp1 = ror(w[i+14], 17)
function ints:macro/ror {p_arg0:"storage sha256: compute.w[-2]",arg1:17,p_result:"storage sha256: compute.tmp1"}
## tmp0 ^= tmp1
function ints:macro/xor {p_arg0:"storage sha256: compute.tmp0",p_arg1:"storage sha256: compute.tmp1",p_result:"storage sha256: compute.tmp0"}
## tmp1 = ror(w[i+14], 19)
function ints:macro/ror {p_arg0:"storage sha256: compute.w[-2]",arg1:19,p_result:"storage sha256: compute.tmp1"}
## tmp0 ^= tmp1
function ints:macro/xor {p_arg0:"storage sha256: compute.tmp0",p_arg1:"storage sha256: compute.tmp1",p_result:"storage sha256: compute.tmp0"}
## wx += tmp0
function ints:macro/add {p_arg0:"storage sha256: compute.wx",p_arg1:"storage sha256: compute.tmp0",p_result:"storage sha256: compute.wx"}
# block_end

data modify storage sha256: compute.w append from storage sha256: compute.wx
data remove storage sha256: compute.wx
data remove storage sha256: compute.tmp0
data remove storage sha256: compute.tmp1
execute unless data storage sha256: compute.w[63] run function sha256:compute/loop1
