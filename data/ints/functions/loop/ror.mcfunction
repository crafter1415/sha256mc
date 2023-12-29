#> ints:loop/ror
# @within
#   ints:loop/ror
#   ints:macro/ror

data modify storage ints: ror.buf prepend from storage ints: ror.buf[-1]
data remove storage ints: ror.buf[-1]
execute store result storage ints: ror.div8 byte 0.999 run data get storage ints: ror.div8
execute unless data storage ints: ror{div8:0b} run function ints:loop/ror
