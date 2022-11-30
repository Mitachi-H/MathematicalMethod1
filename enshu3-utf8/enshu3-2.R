# Open this file in RStudio.

# 演習3-2：推測統計の基礎

set.seed(20221109)  # 乱数の初期化（結果の再現性が保証される）

n = 100
x1 = runif(n) # 区間[0,1]上の一様分布にしたがう乱数を100個生成
head(x1) # 最初の数個
hist(x1) # ヒストグラム
mean(x1) # 平均値

# もう１回
x2 = runif(n)
hist(x2) # 毎回結果が変わる
mean(x2)

### 標本平均の分布を調べる
LOOP = 1000  # 実験回数
result = numeric(LOOP)  # 結果を格納するための配列
for(i in 1:LOOP){
  x = runif(100)
  result[i] = mean(x)
}
hist(result) # 標本平均の分布（ヒストグラム）
sd(result) # 標本平均の標準偏差（標準誤差という）

sd(x1)/sqrt(n) # 実は１回の実験で標準誤差は推定できる

sqrt(1/12)/sqrt(n) # 一様分布の場合の理論値


### 実際のデータに適用
(y1 = iris[iris[,5]=="setosa",1])  # アヤメデータ、setosa の第１変数（がくの長さ）
mean(y1) # 標本平均
sd(y1) # 標準偏差
sd(y1)/sqrt(length(y1)) # 標本平均の標準誤差


# おわり

