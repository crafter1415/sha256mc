#> sha256:compute/loop0.macro
# @within sha256:compute/*
# @internal

execute if data storage sha256: compute.w[-1][3] run data modify storage sha256: compute.w append value [B;]
$data modify storage sha256: compute.w[-1] append from storage sha256: compute.arg0[$(index)]
execute store result storage sha256: compute.index int 0.9999999999 run data get storage sha256: compute.index
execute unless data storage sha256: compute{index:0} run function sha256:compute/loop0.macro with storage sha256: compute
