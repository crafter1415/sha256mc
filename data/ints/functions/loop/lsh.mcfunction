#> ints:loop/lsh
# @within
#   ints:loop/lsh
#   ints:macro/lsh

data remove storage ints: lsh.buf[0]
data modify storage ints: lsh.buf append value 0b
execute store result storage ints: lsh.div8 byte 0.999 run data get storage ints: lsh.div8
execute unless data storage ints: lsh{div8:0b} run function ints:loop/lsh
