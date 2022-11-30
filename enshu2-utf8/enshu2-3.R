# Open this file in RStudio.

# 演習2-3：日付オブジェクトの扱い

X = read.csv("enshu2-3-daily.csv")  # CSVファイルの読み込み
str(X)  # オブジェクトXの構造

X[,1] = as.Date(X[,1])  # 1列目を Date オブジェクトにする
class(X[,1])  # 確認

plot(X, type="l")  # プロットすると横軸が日付になる
weekdays(X[,1])  # 曜日
