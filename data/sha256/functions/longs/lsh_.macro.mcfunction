#> sha256:longs/lsh_.macro
# @within
#   sha256:longs/lsh.macro
#   sha256:longs/lsh_.macro

data remove storage sha256: longs.lsh.buf[0]
data modify storage sha256: longs.lsh.buf append value 0b
execute store result storage sha256: longs.lsh.div8 byte 0.999 run data get storage sha256: longs.lsh.div8
execute unless data storage sha256: longs.lsh{div8:0b} run function sha256:longs/lsh_.macro
