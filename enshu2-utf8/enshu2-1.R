# Open this file in RStudio.

# 演習2-1：データの読み込み

X = read.csv("enshu2-1-city.csv")  # CSVファイルの読み込み
X  # 結果の出力

X[,1]  # 1列目を抽出
X[1,]  # 1行目を抽出

Temp = X[,2:3]  # 2列目と3列目を抽出し、オブジェクトTempにする
rownames(Temp) = X[,1]  # 行の名前を変える
Temp
