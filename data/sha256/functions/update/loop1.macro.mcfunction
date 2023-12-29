#> sha256:update/loop1.macro
# 高負荷により注意
# @within sha256:update/*
# @internal

$data modify storage sha256: compute.arg0 set from storage sha256: update.divided[$(index)]
function sha256:compute/
execute store result storage sha256: update.index int 0.9999999999 run data get storage sha256: update.index
execute unless data storage sha256: update{index:0} run function sha256:update/loop0.macro with storage sha256: update
