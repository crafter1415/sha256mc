#> sha256:compute/
# @input storage sha256: compute.arg0 byte[64]
# @writes storage sha256: h
# @internal

execute unless data storage sha256: h run data modify storage sha256: h set from storage sha256:const h

data modify storage sha256: compute.w set value [[B;]]
data modify storage sha256: compute.index set value -64
function sha256:compute/loop0.macro with storage sha256: compute

function sha256:compute/loop1

data modify storage sha256: compute.var set from storage sha256: h
data modify storage sha256: compute.index set value -64

function sha256:compute/loop2.macro with storage sha256: compute

function ints:macro/add {p_arg0:"storage sha256: h[0]",p_arg1:"storage sha256: compute.var[0]",p_result:"storage sha256: h[0]"}
function ints:macro/add {p_arg0:"storage sha256: h[1]",p_arg1:"storage sha256: compute.var[1]",p_result:"storage sha256: h[1]"}
function ints:macro/add {p_arg0:"storage sha256: h[2]",p_arg1:"storage sha256: compute.var[2]",p_result:"storage sha256: h[2]"}
function ints:macro/add {p_arg0:"storage sha256: h[3]",p_arg1:"storage sha256: compute.var[3]",p_result:"storage sha256: h[3]"}
function ints:macro/add {p_arg0:"storage sha256: h[4]",p_arg1:"storage sha256: compute.var[4]",p_result:"storage sha256: h[4]"}
function ints:macro/add {p_arg0:"storage sha256: h[5]",p_arg1:"storage sha256: compute.var[5]",p_result:"storage sha256: h[5]"}
function ints:macro/add {p_arg0:"storage sha256: h[6]",p_arg1:"storage sha256: compute.var[6]",p_result:"storage sha256: h[6]"}
function ints:macro/add {p_arg0:"storage sha256: h[7]",p_arg1:"storage sha256: compute.var[7]",p_result:"storage sha256: h[7]"}

data remove storage sha256: compute.index
data remove storage sha256: compute.w
data remove storage sha256: compute.var
