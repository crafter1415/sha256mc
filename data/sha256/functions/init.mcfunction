#> sha256:init
# init と init_ はプログラムにより機械的に生成され、 serialVersionUID はストレージ構造から自動的に算出されます。
# (具体的には、「ストレージ構造の文字列表現のSHA-256をlong型にxorで畳み込む」という実装が取られています。)
execute unless data storage sha256:const {serialVersionUID:-4560968998197001954L} run function sha256:init_
