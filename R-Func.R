# 重要函数的使用

# -------------------------------------------------------------------------------------------- #
# 处理循环
# lapply() 
# lapply(列表list, 处理数据的函数Func, ...)
# 可以循环处理列表list的每一个元素
# 总是返回一个列表list
# str()，以简洁的方法在console中显示R的object或func
str(lapply)

l <- list(a = 1:10, b = c(3, 5, 7, 9, 11))
# 求平均值
lapply(l, mean)

# 如果lapply()传入的第一个参数不是list
# lapply()会自动将其转换为list
v <- 1:6
# runif()，在0～1中随机选取一个数字
lapply(v, runif)
# min和max作用于runif函数，给runif设定一个取值为0～10的范围
lapply(v, runif, min = 0, max = 10)

# 构造自己的函数
l2 <- list(a = matrix(1:6, nrow = 2, ncol = 3), b = matrix(1:10, nrow = 5, ncol = 2))
# function(参数) 方法
# 该函数为获取该列表中每1个矩阵中的第1行的数据
lapply(l2, function(m) m[1, ])
# sapply()，与lapply()基本一致，但是返回的结果会简化(在能简化的情况下)
sapply(l2, mean)

# apply()
# apply(数组,维度,函数/函数名)
m <- matrix(1:16, nrow = 4, ncol = 4)
# 矩阵有两个维度，第1个维度为行，第2个维度为列
apply(m, 1, mean) # 每一行的平均值
apply(m, 2, mean) # 每一列的平均值
apply(m, 1, sum) # 每一行的和
apply(m, 2, sum) # 每一列的和
# 对每一行每一列求平均mean，和sum更简洁的方法
rowSums(m)
rowMeans(m)
colSums(m)
colMeans(m)

m2 <- matrix(1:20, nrow = 4, ncol = 5)
# quantile()，求数据的百分位点
# probs，对quantile的限定，求的是0.25, 0.5,0.75的百分位点
apply(m2, 1, quantile, probs = c(0.25, 0.5, 0.75))

# 创建一个5行4列3组的array
arr <- array(1:60, c(4, 5, 3))
apply(arr, c(1, 2), sum) # 取第1维度，和第2维度，构成1个4行，5列的矩阵（对应的位置相加，类似矩阵乘）
apply(arr, c(1, 3), sum) # 取第1维度，和第3维度，构成1个4行，3列的矩阵（每一行相加）
apply(arr, c(2, 3), sum) # 取第2维度，和第3维度，构成1个5行，3列的矩阵（每一列相加）

# mapply
# lapply的多元版本
# mapply(函数/函数名,数据,函数相关的参数)
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep, 1:4, 4:1)

# 构造自己的函数
# n: 从正太分布的数据种随机抽取的个数
# mean: 随机分布的总体的均值
# std: 随机分布对应的标准差
s <- function(n, mean, std) {
  rnorm(n ,mean, std)
}

# 调用函数
# 从均值为0，标准差为1的正太分布数据中随机抽取4个数据
s(4, 0, 1)
# function, n, mean, std
mapply(s, 1:3, 3:1, 2)
list(s(1,3,2), s(2,2,2), s(3,1,2))

# tapply
# 对向量的子集进行操作
# tapply(向量，因子／因子列表，函数／函数名)
# 初始化一个向量
x <- c(rnorm(5), runif(5), rnorm(5, 1))
# 初始化一个因子
# gl()第1个参数为有多少个水平，第2个参数为每个水平下有多少个元素
f <- gl(3, 5)
# 向量x按照因子f的水平进行分组，对每一组求均值
tapply(x, f, mean)
# simplify ＝ FALSE，获取没有简化的列表格式的数据
tapply(x, f, mean, simplify = FALSE)

# split
# 根据因子或因子列表将向量或其他对象分组
# 通常与lapply一起使用
# split(向量／列表／数据框，因子／因子列表)
# 获取内置的airquality数据集
# 根据airquality中的因子月份Month进行分组
air <- split(airquality, airquality$Month)
# 利用table()函数查看总共有多少组
table(airquality$Month)
# 获取每个月"Ozone", "Temp", "Wind"的均值
lapply(air, function(df) colMeans(df[, c("Ozone", "Temp", "Wind")]))
# sappl()函数获取每个月"Ozone", "Temp", "Wind"的均值的简化视图
# 参数na.rm = TRUE，处理数据中的缺失值
# 如果没有处理缺失值
# 数据会显示NA
sapply(air, function(df) colMeans(df[, c("Ozone", "Temp", "Wind")], na.rm = TRUE))

# -------------------------------------------------------------------------------------------- #
# 处理排序
# sort()
# 对向量进行排序，返回排好序的内容
# order()
# 返回排好序的内容的下标index，可以利用多个排序标准进行排序
df <- data.frame(v1 = 11:15, v2 = c(10, 34, 12, 17, 21), v3 = c(13, 15, 14, 31, 20), v4 = c(13, 13, 13, 14, 14))
# 使用sort()排序，默认是升序排序
sortedV2 <- sort(df$v2)
# 替换排好序的行
df$v2 <- sortedV2
# 降序排序
sort(df$v2, decreasing = TRUE)
# 使用order()排序
order(df$v2)
df[order(df$v2), ]
# 对整个数据框进行排序
sapply(df, function(df) sort(df))

# -------------------------------------------------------------------------------------------- #
# 总结数据信息
# head(): 显示前10条信息
head(airquality, 10)

# tail(): 显示后13条信息
tail(airquality, 13)

# summary(): 返回数据集中每一个变量的
# Min（最小值）、1st Qu（25%分位点）、Median（中位数）、Mean（均值）、3rd Qu（75%分位点）、Max（最大值）、NA's（有无缺失值，有多少个）
summary(airquality)

# str(): 返回数据集的类型、有多少条纪录、有多少个变量、变量的类型、每个变量的有多少个元素
str(airquality)

# table(): 统计数据集中每个变量所有元素出现的次数
table(airquality$Month)
table(airquality$Temp)
# 如果有NA，统计NA
table(airquality$Ozone, useNA = "ifany")
# 对多个变量的总结
# 返回：当前月份，温度出现的次数
table(airquality$Month, airquality$Temp)

# any(): 可以判断有无缺失值
# 返回TRUE：则必定有一个或以上的缺失值
# 返回FALSE：则没有缺失值
any(is.na(airquality$Ozon)) # TRUE
any(is.na(airquality$Temp)) # FALSE

# sum(): 可以统计有多少个缺失值
# 返回：缺失值的个数
sum(is.na(airquality$Ozone))

# all(): 遍历所有的元素，判断()内的条件语句
# 判断月份是否都小于12
# 返回logical
all(airquality$Month < 12)
all(airquality$Temp < 89)

#
titanic <- as.data.frame(Titanic)
head(titanic)
# 查看维度
dim(titanic)
# 交叉表
# 计算Sex和Age交叉的Freq
tabX <- xtabs(Freq ~ Sex + Age, data = titanic)
# 扁平化的表，返回的数据和xtabs相同
ftable(tabX)

# 获取数据及集的大小
object.size(airquality) # 默认返回bytes单位
print(object.size(titanic), units = "Kb")
