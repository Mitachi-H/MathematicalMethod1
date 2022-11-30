# Open this file in RStudio.

# 演習3-3：ブートストラップ法

set.seed(20221109)  # 乱数の初期化（結果の再現性が保証される）

### 実際のデータに適用
(y1 = iris[iris[,5]=="setosa",1])  # アヤメデータ、setosa の第１変数（がくの長さ）
mean(y1) # 標本平均
sd(y1)/sqrt(length(y1)) # 標本平均の標準誤差

# 標本平均の標準誤差をブートストラップ法で求める
library(boot) # ブートストラップ法のライブラリを読み込む
mean(y1)
stat = function(x, w) mean(x[w])  # x は元データ、w は抽出されたデータ番号を表す。
boot(y1, stat, 1000)  # ブートストラップ法。std.err の欄が標準誤差。

# 中央値の標準誤差をブートストラップ法で求める
median(y1)  # 中央値
stat = function(x, w) median(x[w])
boot(y1, stat, 1000)

# がくの長さとがくの幅の相関係数の標準誤差をブートストラップ法で求める
cor(iris[,1], iris[,2])  # 相関係数
stat = function(x, w) cor(x[w,1], x[w,2])
boot(iris[,1:2], stat, 1000)

# おわり

