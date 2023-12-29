#> sha256:reset/hard
# 全モジュールのハードリセット及び定数の再初期化
# @public
# @user

data remove storage sha256: length
data remove storage sha256: unfinished
data remove storage sha256: h

data remove storage sha256: compute
data remove storage sha256: digest
data remove storage sha256: i2b
data remove storage sha256: padding
data remove storage sha256: update
data remove storage sha256: longs

function sha256:init_
