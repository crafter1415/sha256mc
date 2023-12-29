#> sha256:update/loop0.macro
# @within sha256:update/*
# @internal

$data modify storage sha256: update.divided[-1] append from storage sha256: update.arg0[$(index)]
execute if data storage sha256: update.divided[-1][63] run data modify storage sha256: update.divided append value [B;]
execute store result storage sha256: update.index int 0.9999999999 run data get storage sha256: update.index
execute unless data storage sha256: update{index:0} run function sha256:update/loop0.macro with storage sha256: update
