#> sha256:padding/
# @internal

execute store result storage sha256: padding.length byte 1 run data get storage sha256: length[-1]
function sha256:padding/macro with storage sha256: padding
data modify storage sha256: update.arg0 set value [B;-128b]
execute unless data storage sha256: padding{length:0b} run function sha256:padding/loop
function sha256:longs/lsh.macro {p_arg0:"storage sha256: length",arg1:3,p_result:"storage sha256: padding.length"}
data modify storage sha256: update.arg0 append from storage sha256: padding.length[]
function sha256:update/
data remove storage sha256: padding
data remove storage sha256: update
