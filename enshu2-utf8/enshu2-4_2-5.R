# Open this file in RStudio.

# 演習2-4：条件抽出
# 演習2-5：割合の計算、偏差の計算

X = read.csv("enshu2-3-daily.csv")  # CSVファイルの読み込み
X[,1] = as.Date(X[,1])  # 日付を Date オブジェクトにする

X[,2] >= 30  # 真夏日だったら TRUE、そうでなければ FALSE（論理値オブジェクト）
ifelse(X[,2] >= 30, 1, 0)  # 真夏日だったら1、そうでないとき0
mean(ifelse(X[,2] >= 30, 1, 0))  # 真夏日の割合
mean(X[,2] >= 30)  # こう書くことも可（論理値はTRUEが1、FALSEが0として扱われる）

X[X[,2]>=30, 1]  # 真夏日の日付を抽出

xbar = mean(X[,2])  # 日最高気温の月平均
X[,2] - xbar  # 偏差
mean(X[,2] - xbar)  # 偏差の平均は0（丸め誤差に注意）
