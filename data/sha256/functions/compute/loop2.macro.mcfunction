#> sha256:compute/loop2.macro
# 可読性？知らねえよそんなん、気合で読め！
# @within sha256:compute/*
# @internal

# block_begin

## tmp1

#### tmp1 = h+k[i]
$function ints:macro/add {p_arg0:"storage sha256: compute.var[7]",p_arg1:"storage sha256:const k[$(index)]",p_result:"storage sha256: compute.tmp1"}
#### tmp1 += w[i]
$function ints:macro/add {p_arg0:"storage sha256: compute.tmp1",p_arg1:"storage sha256: compute.w[$(index)]",p_result:"storage sha256: compute.tmp1"}

### sig1
#### buf0 = ror(e, 6)
function ints:macro/ror {p_arg0:"storage sha256: compute.var[4]",arg1:6,p_result:"storage sha256: compute.buf0"}
#### buf1 = ror(e, 11)
function ints:macro/ror {p_arg0:"storage sha256: compute.var[4]",arg1:11,p_result:"storage sha256: compute.buf1"}
#### buf0 ^= buf1
function ints:macro/xor {p_arg0:"storage sha256: compute.buf0",p_arg1:"storage sha256: compute.buf1",p_result:"storage sha256: compute.buf0"}
#### buf1 = ror(e, 25)
function ints:macro/ror {p_arg0:"storage sha256: compute.var[4]",arg1:25,p_result:"storage sha256: compute.buf1"}
#### buf0 ^= buf1
function ints:macro/xor {p_arg0:"storage sha256: compute.buf0",p_arg1:"storage sha256: compute.buf1",p_result:"storage sha256: compute.buf0"}
#### tmp1 += buf0
function ints:macro/add {p_arg0:"storage sha256: compute.tmp1",p_arg1:"storage sha256: compute.buf0",p_result:"storage sha256: compute.tmp1"}

### choice
#### buf0 = e&f
function ints:macro/and {p_arg0:"storage sha256: compute.var[4]",p_arg1:"storage sha256: compute.var[5]",p_result:"storage sha256: compute.buf0"}
#### buf1 = ~e
function ints:macro/not {p_arg0:"storage sha256: compute.var[4]",p_result:"storage sha256: compute.buf1"}
#### buf1 &= g
function ints:macro/and {p_arg0:"storage sha256: compute.buf1",p_arg1:"storage sha256: compute.var[6]",p_result:"storage sha256: compute.buf1"}
#### buf0 ^= buf1
function ints:macro/xor {p_arg0:"storage sha256: compute.buf0",p_arg1:"storage sha256: compute.buf1",p_result:"storage sha256: compute.buf0"}
#### tmp1 += buf0
function ints:macro/add {p_arg0:"storage sha256: compute.tmp1",p_arg1:"storage sha256: compute.buf0",p_result:"storage sha256: compute.tmp1"}

## tmp2

### sig0
#### buf0 = ror(a, 2)
function ints:macro/ror {p_arg0:"storage sha256: compute.var[0]",arg1:2,p_result:"storage sha256: compute.buf0"}
#### buf1 = ror(a, 13)
function ints:macro/ror {p_arg0:"storage sha256: compute.var[0]",arg1:13,p_result:"storage sha256: compute.buf1"}
#### buf0 ^= buf1
function ints:macro/xor {p_arg0:"storage sha256: compute.buf0",p_arg1:"storage sha256: compute.buf1",p_result:"storage sha256: compute.buf0"}
#### buf1 = ror(a, 22)
function ints:macro/ror {p_arg0:"storage sha256: compute.var[0]",arg1:22,p_result:"storage sha256: compute.buf1"}
#### buf0 ^= buf1
function ints:macro/xor {p_arg0:"storage sha256: compute.buf0",p_arg1:"storage sha256: compute.buf1",p_result:"storage sha256: compute.buf0"}
#### tmp2 = buf0
data modify storage sha256: compute.tmp2 set from storage sha256: compute.buf0

### maj
#### buf0 = a&b
function ints:macro/and {p_arg0:"storage sha256: compute.var[0]",p_arg1:"storage sha256: compute.var[1]",p_result:"storage sha256: compute.buf0"}
#### buf1 = a&c
function ints:macro/and {p_arg0:"storage sha256: compute.var[0]",p_arg1:"storage sha256: compute.var[2]",p_result:"storage sha256: compute.buf1"}
#### buf0 ^= buf1
function ints:macro/xor {p_arg0:"storage sha256: compute.buf0",p_arg1:"storage sha256: compute.buf1",p_result:"storage sha256: compute.buf0"}
#### buf1 = b&c
function ints:macro/and {p_arg0:"storage sha256: compute.var[1]",p_arg1:"storage sha256: compute.var[2]",p_result:"storage sha256: compute.buf1"}
#### buf0 ^= buf1
function ints:macro/xor {p_arg0:"storage sha256: compute.buf0",p_arg1:"storage sha256: compute.buf1",p_result:"storage sha256: compute.buf0"}
#### tmp2 += buf0
function ints:macro/add {p_arg0:"storage sha256: compute.tmp2",p_arg1:"storage sha256: compute.buf0",p_result:"storage sha256: compute.tmp2"}


## Update

### d += tmp1
function ints:macro/add {p_arg0:"storage sha256: compute.var[3]",p_arg1:"storage sha256: compute.tmp1",p_result:"storage sha256: compute.var[3]"}

### h=g,g=f,f=e,e=d,d=c,c=b,b=a,a=0
data modify storage sha256: compute.var prepend value [B;0b,0b,0b,0b]
data remove storage sha256: compute.var[8]

### a = tmp1+tmp2
function ints:macro/add {p_arg0:"storage sha256: compute.tmp1",p_arg1:"storage sha256: compute.tmp2",p_result:"storage sha256: compute.var[0]"}

# block_end
data remove storage sha256: compute.tmp1
data remove storage sha256: compute.tmp2
data remove storage sha256: compute.buf0
data remove storage sha256: compute.buf1
execute store result storage sha256: compute.index int 0.9999999999 run data get storage sha256: compute.index
execute unless data storage sha256: compute{index:0} run function sha256:compute/loop2.macro with storage sha256: compute
