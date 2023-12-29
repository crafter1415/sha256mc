#> ints:loop/rsh
# @within
#   ints:loop/rsh
#   ints:macro/rsh

data remove storage ints: rsh.buf[-1]
data modify storage ints: rsh.buf prepend value 0b
execute store result storage ints: rsh.div8 byte 0.999 run data get storage ints: rsh.div8
execute unless data storage ints: rsh{div8:0b} run function ints:loop/rsh
