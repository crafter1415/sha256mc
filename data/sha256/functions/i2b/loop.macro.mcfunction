#> sha256:i2b/loop.macro
# @within
#   sha256:i2b/*

scoreboard players operation #mod sha256 = #value sha256
scoreboard players operation #mod sha256 %= #256 sha256
execute if score #mod sha256 matches 128.. run scoreboard players remove #mod sha256 256
$execute store result storage sha256: i2b.result[$(index)] byte 1 run scoreboard players get #mod sha256
scoreboard players operation #value sha256 /= #256 sha256

execute store result storage sha256: i2b.index int 0.9999999999 run data get storage sha256: i2b.index
$execute unless data storage sha256: i2b{0:$(index)} run function sha256:i2b/loop.macro with storage sha256: i2b
