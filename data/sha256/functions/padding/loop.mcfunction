#> sha256:padding/loop
# @within sha256:padding/*
# @internal

data modify storage sha256: update.arg0 append value 0b
execute store result storage sha256: padding.length byte 0.9999999999 run data get storage sha256: padding.length
execute unless data storage sha256: padding{length:0b} run function sha256:padding/loop
