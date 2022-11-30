# Open this file in RStudio.

# 演習2-7：データの抽出、並べ替え

X = read.csv("enshu2-7-weather.csv")  # CSVファイルの読み込み

X  # 全部出力してみる
head(X)  # 最初の数行のみ出力

str(X)  # データの構造
names(X)  # X の変数名
X[,2]  # 2列目
X$press_local  # $の後に変数名を書いて指定することもできる

# 抽出
Y = X[X$max_temp >= 30,]  # 真夏日のみ抽出
Y  # 確認
Z = Y[order(Y$min_temp, decreasing=TRUE), ]  # 最低気温の順番にする
Z  # 確認

# 実は View(X) で開くウインドウにフィルター機能がついている。
# "filter"をクリックし、max_temp を 30-38 に制限、min_temp を降順にすればよい。
View(X)

