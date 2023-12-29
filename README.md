
# SHA-256 MC Implementation

MinecraftにおけるSHA-256ハッシュ関数の実装

> [!Caution]  
> 絶対にストレージ `bytes:const` に対する `get` 操作を**行わないでください**！！  
> ストレージ容量が非常に大きいため<ins>実行するだけでフリーズ</ins>してしまう恐れがあります。  
> **DO NOT** run the `get` operation on storage `bytes:const`!!!  
> Since the storage capacity is very large, there is risk that <ins>will freeze</ins> just by executing it.

## 使用例

基本的にはJava8のMessageDigestインスタンスと同様に利用できます。
```mcfunction
# "Hello, world!!"
data modify storage sha256: update.arg0 set value [B;72b,101b,108b,108b,111b,44b,32b,119b,111b,114b,108b,100b,33b,33b]
function sha256:update/
function sha256:digest/
tellraw @s {"storage":"sha256:","nbt":"digest.result"}
# -> 11806c2441295ea697ea96ee4247c0f9c71ee7638863cb8e29cd941a488fcb5a
```
```mcfunction
# "Sample Text"
data modify storage sha256: digest.arg0 set value [B;83b,97b,109b,112b,108b,101b,32b,84b,101b,120b,116b]
function sha256:digest/
tellraw @s {"storage":"sha256:","nbt":"digest.result"}
# -> 35ae8855db112a234a69ef68cf7372357124b18be029efcf4345c2bf1da7b7b5
```
```mcfunction
# "There's really no hard limit to how long these achievement names can be and to be quite honest I'm rather curious to see how far we can go.\nAdolphus W. Green (1844–1917) started as the Principal of the Groton School in 1864. By 1865, he became second assistant librarian at the New York Mercantile Library; from 1867 to 1869, he was promoted to full librarian. From 1869 to 1873, he worked for Evarts, Southmayd & Choate, a law firm co-founded by William M. Evarts, Charles Ferdinand Southmayd and Joseph Hodges Choate. He was admitted to the New York State Bar Association in 1873.\nAnyway, how's your day been?"
# :D
data modify storage sha256: update.arg0 set value [B;84b,104b,101b,114b,101b,39b,115b,32b,114b,101b,97b,108b,108b,121b,32b,110b,111b,32b,104b,97b,114b,100b,32b,108b,105b,109b,105b,116b,32b,116b,111b,32b,104b,111b,119b,32b,108b,111b,110b,103b,32b,116b,104b,101b,115b,101b,32b,97b,99b,104b,105b,101b,118b,101b,109b,101b,110b,116b,32b,110b,97b,109b,101b,115b,32b,99b,97b,110b,32b,98b,101b,32b,97b,110b,100b,32b,116b,111b,32b,98b,101b,32b,113b,117b,105b,116b,101b,32b,104b,111b,110b,101b,115b,116b,32b,73b,39b,109b,32b,114b,97b,116b,104b,101b,114b,32b,99b,117b,114b,105b,111b,117b,115b,32b,116b,111b,32b,115b,101b,101b,32b,104b,111b,119b,32b,102b,97b,114b,32b,119b,101b,32b,99b,97b,110b,32b,103b,111b,46b,13b]
function sha256:update/
data modify storage sha256: update.arg0 set value [B;10b,65b,100b,111b,108b,112b,104b,117b,115b,32b,87b,46b,32b,71b,114b,101b,101b,110b,32b,40b,49b,56b,52b,52b,226b,128b,147b,49b,57b,49b,55b,41b,32b,115b,116b,97b,114b,116b,101b,100b,32b,97b,115b,32b,116b,104b,101b,32b,80b,114b,105b,110b,99b,105b,112b,97b,108b,32b,111b,102b,32b,116b,104b,101b,32b,71b,114b,111b,116b,111b,110b,32b,83b,99b,104b,111b,111b,108b,32b,105b,110b,32b,49b,56b,54b,52b,46b,32b,66b,121b,32b,49b,56b,54b,53b,44b,32b,104b,101b,32b,98b,101b,99b,97b,109b,101b,32b,115b,101b,99b,111b,110b,100b,32b,97b,115b,115b,105b,115b,116b,97b,110b,116b,32b,108b,105b,98b,114b,97b,114b,105b,97b,110b,32b,97b,116b,32b,116b,104b,101b,32b,78b,101b,119b,32b,89b,111b,114b,107b,32b,77b,101b,114b,99b,97b,110b,116b,105b,108b,101b,32b,76b,105b,98b,114b,97b,114b,121b,59b,32b,102b,114b,111b,109b,32b,49b,56b,54b,55b,32b,116b,111b,32b,49b,56b,54b,57b,44b,32b,104b,101b,32b,119b,97b,115b,32b,112b,114b,111b,109b,111b,116b,101b,100b,32b,116b,111b,32b,102b,117b,108b,108b,32b,108b,105b,98b,114b,97b,114b,105b,97b,110b,46b,32b,70b,114b,111b,109b,32b,49b,56b,54b,57b,32b,116b,111b,32b,49b,56b,55b,51b,44b,32b,104b,101b,32b,119b,111b,114b,107b,101b,100b,32b,102b,111b,114b,32b,69b,118b,97b,114b,116b,115b,44b,32b,83b,111b,117b,116b,104b,109b,97b,121b,100b,32b,38b,32b,67b,104b,111b,97b,116b,101b,44b,32b,97b,32b,108b,97b,119b,32b,102b,105b,114b,109b,32b,99b,111b,45b,102b,111b,117b,110b,100b,101b,100b,32b,98b,121b,32b,87b,105b,108b,108b,105b,97b,109b,32b,77b,46b,32b,69b,118b,97b,114b,116b,115b,44b,32b,67b,104b,97b,114b,108b,101b,115b,32b,70b,101b,114b,100b,105b,110b,97b,110b,100b,32b,83b,111b,117b,116b,104b,109b,97b,121b,100b,32b,97b,110b,100b,32b,74b,111b,115b,101b,112b,104b,32b,72b,111b,100b,103b,101b,115b,32b,67b,104b,111b,97b,116b,101b,46b,32b,72b,101b,32b,119b,97b,115b,32b,97b,100b,109b,105b,116b,116b,101b,100b,32b,116b,111b,32b,116b,104b,101b,32b,78b,101b,119b,32b,89b,111b,114b,107b,32b,83b,116b,97b,116b,101b,32b,66b,97b,114b,32b,65b,115b,115b,111b,99b,105b,97b,116b,105b,111b,110b,32b,105b,110b,32b,49b,56b,55b,51b,46b,13b]
function sha256:update/
data modify storage sha256: digest.arg0 set value [B;10b,65b,110b,121b,119b,97b,121b,44b,32b,104b,111b,119b,39b,115b,32b,121b,111b,117b,114b,32b,100b,97b,121b,32b,98b,101b,101b,110b,63b]
function sha256:digest/
tellraw @s {"storage":"sha256:","nbt":"digest.result"}
# -> 1237227f2bd6fab3663f73c21def0f7c9506076cc65d053cce71a88796815e32

# Btw I picked hash result from free web tools so I didn't even execute those XD
```

## ユーザーの使用を想定した関数一覧

### sha256:update/

ハッシュ値を与えられたバイト配列で更新します。  
引数としてストレージ `sha256: update.arg0` にバイト配列を与える必要があります。

### sha256:digest/

パディング等の処理を行った後に、ハッシュ計算を完了させます。  
ストレージ `sha256: digest.arg0` を指定すると、指定された値で `sha256:update/` が呼び出されたのちにパディングが行われます。

### sha256:reset/

計算中のハッシュを破棄し、新規ハッシュの計算を始めます。  
`sha256:digest/` を実行すると自動で呼び出されます。

### sha256:reset/hard

データパックによって生成される全ストレージを初期化します。

## 補足

ハッシュ値の更新の際には7万以上のコマンドが実行されます。使用する前に `maxCommandChainLength` を引き上げるなどの対処を行ってください。
また、ハッシュの更新には平均150ms程度の時間がかかります。digest関数の多用はサーバー負荷の原因となりますため、お避け下さい。
