# Open this file in RStudio.

# 演習2-2：簡単な計算

X = read.csv("enshu2-1-city.csv")  # CSVファイルの読み込み
Temp = X[,2:3]
rownames(Temp) = X[,1]

Temp
rowMeans(Temp)  # 各行の平均
colMeans(Temp)  # 各列の平均
mean(Temp)  # 行列全体の平均を求められるか？
# エラーが出る。これは Temp がデータフレームというクラスになっているため
class(Temp)  # クラスの確認
Z = as.matrix(Temp)  # 行列クラスに変換
class(Z)  # 確認（行列クラス matrix かつ配列クラス array となる）
mean(Z)  # 行列全体の平均

round(rowMeans(Temp), 2)  # 小数第二位に丸める場合

# 参考：LaTeX 用の表を作りたい場合
# 次の行のコメントを外し、xtable というパッケージをインストールします。
# install.packages("xtable")
library(xtable) # パッケージの読み込み
xtable(Temp)
# 出力された結果を latex のソースファイルにコピーすれば表を作れます。
# latex の出力を手軽に確認するには TeXclip
# https://texclip.marutank.net/
# が便利です。

