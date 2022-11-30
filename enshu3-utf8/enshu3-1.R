# This file is written in UTF-8.
# Open this file in RStudio.

# 演習3-1：記述統計

### Run を押して実行し、R console に結果が出力されることを確認してください。

X = iris  # iris は R にあらかじめ用意されている Fisher のアヤメデータ

head(X)  # 最初の数行
summary(X)  # 要約統計量

# 各変数の意味
#  Sepal.Length: がくの長さ
#  Sepal.Width: がくの幅
#  Petal.Length: 花びらの長さ
#  Petal.Width: 花びらの幅
#  Species: アヤメの種類（setosa, versicolor, virginica）

sapply(X, class)  # 各変数のクラス。
                  # 第5変数は factor クラスとなっている。
                  # factor クラスは文字列クラスと似ているが異なる。
                  # 詳細はこのファイルの末尾を参照。

sd(X[,1])/mean(X[,1])  # 第１変数の変動係数
sd(X[,2])/mean(X[,2])  # 第２変数の変動係数
sd(X[,3])/mean(X[,3])  # 第３変数の変動係数
sd(X[,4])/mean(X[,4])  # 第４変数の変動係数

cov(X[,1:4])  # 共分散
cor(X[,1:4])  # 相関係数


### 箱ひげ図、ヒストグラム、散布図、円グラフ、棒グラフ
# 参考サイト
# https://www.math.chuo-u.ac.jp/~sakaori/R/correlation.html

boxplot(X[,1])  # 箱ひげ図（復習）
quantile(X[,1])  # 箱ひげ図は五数要約をもとにプロットされている（図と比較せよ）
boxplot(X[,1] ~ X[,5])  # 種類別にプロット
boxplot(Sepal.Length ~ Species, data=X)  # 種類別にプロット（別の書き方）

hist(X[,1])  # ヒストグラム（復習）
plot(X[,1:2])  # 散布図（復習）
plot(X[,1:2], col=X[,5]) # 種類別に色分け

pie(table(X[,5]))  # 円グラフ
barplot(table(X[,5]))  # 棒グラフ


### クロス集計表（2つの質的変数の要約）
# 参考サイト
# https://www.math.chuo-u.ac.jp/~sakaori/R/categorical.html

y = ifelse(X[,2] > median(X[,2]), "wide", "narrow") # がくの幅が中央値より大きいか否か
head(y) # 最初の数個
(cross = table(Wide=y, Species=X[,5])) # クロス集計表
# 参考：代入と同時に console で出力したい場合はこのように ( ) をつけるとよい

pie(cross[,1]) # 種類を setosa に限ったときの、wide と narrow の割合
barplot(cross[,1])  # 棒グラフ

barplot(cross) # 種類別に積み上げ棒グラフで表示
barplot(cross, beside=TRUE) # 積み上げない棒グラフ
barplot(cross, horiz=TRUE) # 水平方向にプロットする場合
barplot(cross, horiz=TRUE, legend.text=c("narrow","wide")) # 凡例を記す

(cross1 = prop.table(cross, 2)) # 割合に直す。1は行ごと、2は列ごと。
barplot(cross1, horiz=TRUE, legend.text=c("narrow","wide")) # 帯グラフ
# この例ではもともと各種の個体が50個ずつなのでグラフの見た目は同じ。
# 横軸の目盛りだけ変わっている。


### 散布図行列

pairs(X[,1:4]) # 対散布図（散布図行列）
pairs(X[,1:4], col=X[,5]) # 種類別に色分け


### 折れ線グラフ
hw = c(321, 303, 305, 302) # 過去4回の宿題提出者数
plot(hw)  # そのままプロットすると折れ線にはならず、ドットプロットとなる
plot(hw, type="l")  # 折れ線グラフ ("l"はlineの意味)
plot(hw, type="b")  # 折れ線＋ドット ("b"はbothの意味)
plot(hw, type="b", ylim=c(0, 400)) # y軸の範囲を変えると印象がだいぶ変わる。

# 東京における１月から１０月までの日最高気温および日最低気温の月平均
# https://www.data.jma.go.jp/obd/stats/etrn/
max_temp = c(9.4, 10.5, 16.6, 20.2, 23.5, 27.6, 31.7, 32.0, 28.8, 21.5)
min_temp = c(1.1, 1.1, 6.1, 11.1, 14.8, 19.6, 24.4, 24.3, 21.1, 13.8)
temp = cbind(max_temp, min_temp) # ベクトルを２列並べて行列にする。
matplot(1:10, temp, type="b")

plot(sunspots)  # 各月の太陽の黒点の数(1749-1983)。?sunspots で説明が読める。
class(sunspots)  # sunspots は時系列クラス(ts)のオブジェクト。詳細は略す。


### ヒートマップ
# 前回用いた気象データを R ファイルにしたものを読み込む
source("enshu2-7-weather.R")
weather  # 変数 weather が読み込まれたことの確認
# 参考：自分でこのようなファイルを作る場合は dump(weather, "enshu2-7-weather.R")

(idx = sapply(weather, is.numeric))  # 量的変数か否か
w_num = weather[,idx]  # 量的変数のみ取り出す
cor(w_num)  # 相関行列
heatmap(cor(w_num), symm = TRUE)  # 相関行列のヒートマップ（自動的に並べ替えられる）
heatmap(cor(w_num), Rowv=NA, symm = TRUE)  # 並べ替えたくない場合


### 補足：factor クラスについて ###
s = c("apple", "orange", "banana", "banana")  # 文字列のベクトル
f = as.factor(s)  # factor クラスに変換
summary(f)
summary(s)
v = c(128, 198, 250, 148)  # 数値ベクトル（果物の値段のイメージ）
plot(v ~ f)  # factor クラスは質的変数として扱われる
# plot(v ~ s)  # これはエラーとなる。

# おわり

