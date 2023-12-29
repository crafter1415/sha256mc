#> sha256:update/
# @input storage sha256: update.arg0 byte[1..]
# @api
# @user

execute unless data storage sha256: update.arg0[0] run return 0

execute unless data storage sha256: unfinished run data modify storage sha256: unfinished set value [B;]
data modify storage sha256: update.divided set value []
data modify storage sha256: update.divided append from storage sha256: unfinished

execute store result storage sha256: update.index int -1 run data get storage sha256: update.arg0
function sha256:update/loop0.macro with storage sha256: update

data modify storage sha256: unfinished set value [B;]
execute unless data storage sha256: update.divided[-1][63] run data modify storage sha256: unfinished set from storage sha256: update.divided[-1]
execute unless data storage sha256: update.divided[-1][63] run data remove storage sha256: update.divided[-1]

execute store result storage sha256: update.index int -1 run data get storage sha256: update.divided
execute if data storage sha256: update.divided[0] run function sha256:update/loop1.macro with storage sha256: update
data remove storage sha256: compute
data remove storage sha256: update.divided

execute unless data storage sha256: length run data modify storage sha256: length set value [B;0b,0b,0b,0b,0b,0b,0b,0b]
execute store result storage sha256: i2b.arg0 int 1 run data get storage sha256: update.arg0
function sha256:i2b/
data modify storage sha256: update.tmp0 set value [B;0b,0b,0b,0b]
data modify storage sha256: update.tmp0 append from storage sha256: i2b.result[]
function sha256:longs/add.macro {p_arg0:"storage sha256: length",p_arg1:"storage sha256: update.tmp0",p_result:"storage sha256: length"}
data remove storage sha256: i2b
data remove storage sha256: update.tmp0
data remove storage sha256: longs

