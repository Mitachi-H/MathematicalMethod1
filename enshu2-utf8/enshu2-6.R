# Open this file in RStudio.

# 演習2-6：箱ひげ図、ヒストグラム、散布図

X = read.csv("enshu2-6-daily2.csv")  # CSVファイルの読み込み
X[,1] = as.Date(X[,1])  # 日付を Date オブジェクトにする

# 箱ひげ図を描く
boxplot(X[,2])  # 第2変数（最高気温）のヒストグラム
boxplot(X[,2], ylim=c(25,40))  # y軸の範囲を変更
boxplot(X[,2], horizontal=TRUE)  # 横向きに描く場合
boxplot(X[,2], ylim=c(25,40), ylab="Temperature")  # ラベルを付ける

boxplot(X[,3], ylab="Humidity")

# ヒストグラムを描く
hist(X[,2])
hist(X[,2], breaks=seq(25,40,2.5))  # 階級を指定。seq は等間隔の数列を作る関数
hist(X[,2], breaks=seq(25,40,2.5), xlab="Temparature", main=NULL)  # ラベルをつける

hist(X[,3], xlab="Humidity", main=NULL)

# 参考：滑らかな密度を描きたい場合
plot(density(X[,2]))  # density はカーネル密度推定（この授業では扱わない）

# 散布図を描く
plot(X[,2:3])  # 第2変数と第3変数のプロット

par(pty="s")  # 作図領域を正方形にしたい場合
plot(X[,2:3])
plot(X[,2:3], xlim=c(25,40), ylim=c(60,100))  # 範囲の変更
plot(X[,2:3], xlim=c(25,40), ylim=c(60,100), pch=2)  # プロット点の変更

points(X[X[,2]>=30,2:3], pch=2, col="red")  # 真夏日だけ赤で重ね描き

