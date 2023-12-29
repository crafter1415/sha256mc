#> bytes:init
# init と init_ はプログラムにより機械的に生成され、 serialVersionUID はストレージ構造から自動的に算出されます。
# (具体的には、「ストレージ構造の文字列表現のSHA-256をlong型にxorで畳み込む」という実装が取られています。)

# 言い忘れてたけど、init_は**絶対**開かないでね。開いてフリーズしたとか言われても責任負えないから。
execute unless data storage bytes:const {serialVersionUID:8311936134517257795L} run function bytes:init_
