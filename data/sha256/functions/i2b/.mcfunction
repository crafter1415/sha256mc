#> sha256:i2b/
# @input storage sha256: i2b.arg0 IntTag
# @output storage sha256: i2b.result ByteArrayTag : byte[4]
# @internal

data modify storage sha256: i2b.result set value [B;0b,0b,0b,0b]
data modify storage sha256: i2b.index set value 3
data modify storage sha256: i2b.0 set value 0

scoreboard objectives add sha256 dummy 
execute store result score #value sha256 run data get storage sha256: i2b.arg0

scoreboard players set #256 sha256 256

function sha256:i2b/loop.macro with storage sha256: i2b

scoreboard players reset #256 sha256
scoreboard players reset #mod sha256
scoreboard players reset #value sha256

scoreboard objectives remove sha256

data remove storage sha256: i2b.index
data remove storage sha256: i2b.0
