#> sha256:padding/macro
# @within sha256:padding/*
# @internal

$data modify storage sha256: padding.length set from storage sha256:const padding[$(length)]
