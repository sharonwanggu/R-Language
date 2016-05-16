# command + shift + c 多行注释
# control + L 清空控制台

# -------------------------------------------------------------------------------------------- #
# 5种基本对象类型
# numeric
n <- 4.1
class(n)

# integer
i <- 4L
class(i)

# complex
com <- 3 - 5 / 2i
class(com)

# character
c <- "character" 
class(c)

# logical
t <- TRUE
class(t)

# 数据结构
# -------------------------------------------------------------------------------------------- #
# 向量 vector
# 初始化一个没有元素的空向量
# vector(mode = 元素类型, length = 元素个数)
v <- vector("numeric", 13)
class(v)
v1 <- vector("character", 13)
class(v1)

# 初始化一个包涵数字1到13的向量
v2 <- 1:13
class(v2)

# 利用c()函数创建向量，括号内输入想要的元素
v3 <- c("s", "a", "m", "t", "s", "e")
class(v3)

# 包涵不同数据类型的向量
# R会默认转换为character字符类型
v4 <- c(TRUE, "chloe", "22")
class(v4)

# 强制转换向量内数据的类型
v5 <- c("c", "h", "l", "o", "e")
# 强制转换为numeric类型
as.numeric(v5) 
class(v5)
# 当出现值缺失时，会出现以下警告 
# Warning message:
# NAs introduced by coercion 
# 因为R不知道如何用数字表示c，所以会使用缺失值NA代替

# 为向量中的每一个元素添加名称
v6 <- 1:5
names(v6) <- c("c", "h", "l", "o", "e")

# -------------------------------------------------------------------------------------------- #
# 矩阵
# 矩阵的创建方法一 date: 1~10  row: 2 col: 5
m <- matrix(1:10, nrow = 2, ncol = 5)

# 矩阵的创建方法二
# 初始化一个向量m1
m1 <- 11:20
# dim函数的作用是给向量m1设置维度(dimension)
dim(m1) <- c(2, 5)

# 合并矩阵(被合并的矩阵行数和列数必须相等)
# 合并行
rbind(m, m1)
# 合并列
cbind(m, m1)

# 数组 array
# 初始化一个包涵数字1～24，4行，6列的数组
arr <- array(1:24, dim = c(4,6))
# 初始化一个包涵数字1～24，4组，每一组4行，3列的数组
strings <- c("c", "h", "l", "o", "e")
arr1 <- array(strings, dim = c(5,3,4))

# -------------------------------------------------------------------------------------------- #
# 列表 list 可以包涵不同数据类型的数据
# 利用list()函数创建列表
l <- list(13, "chloe", TRUE, 37L, 3 - 2i + 2)
class(l)

# 给列表的元素命名
l2 <- list(a = 1, b = 2, c = 3)

# 包涵向量的列表
l3 <- list(c(1,2,3), c(4,5,6))
# index查询
l3[2]

# 利用列表给矩阵命名
v6 <- c("a", "b", "c", "d", "e", "f", "g", "h")
m2 <- matrix(v6, nrow = 2, ncol = 4)
# 每一行为1++, 每一列为1++
dimnames(m2) <- list(1:2, 1:4)

# -------------------------------------------------------------------------------------------- #
# 因子 factor （整数向量＋标签）有点像OC里面的NSEnum枚举
# 创建factor
f <- factor(c("female", "male", "female", "female", "male"))
# 设置levels
f1 <- factor(c("female", "male", "female", "female", "male"), levels = c("male", "female"))
# 当前的因子的整体了解
table(f1)

class(f1)
unclass(f)
unclass(f1)
class(unclass(f1))

# -------------------------------------------------------------------------------------------- #
# 缺失值 missing value 类似OC的NULL
# NA/NaN: NaN属于NA（NaN是NA的子集）， NA不属于NaN（NA是NaN的超集）
# NaN一般表示integer的缺失值，而NA可表示的缺失值类型更广泛
n <- c(1, NA, 2, NA, 3)
# 判断是否含有NA的缺失值
is.na(n)
# 判断是否含有NaN的缺失值
is.nan(n)

n2 <- c(1, NaN, 2, NaN, 3)
# 两者输出的判断结果一致
# 表明NA含有NaN，但是NaN并不含有NA
is.na(n2)
is.nan(n2)

# -------------------------------------------------------------------------------------------- #
# 数据框 data frame 区别于矩阵的是每个元素可以为不同类型
# 初始化数据框
df <- data.frame(id = c(1001, 1002, 1003, 1004), name = c("lucy", "peter", "sam", "jack"), exam = c(TRUE, FALSE, TRUE, TRUE))

# 查看数据框的行和列
nrow(df)
ncol(df)

# 创建数据类型都为integer的数据框
df2 <- data.frame(id = c(2001, 2002, 2003, 2004), score = c(98, 99, 97, 100)) 
# 该数据框由于数据类型一致，所以和矩阵类似
data.matrix(df2)

# -------------------------------------------------------------------------------------------- #
# date and time
# date
# 获取当前时间（星期几，月，日，时：分：秒 年），数据类型为character
d <- date()
# 获取当前时间（年－月－日），数据类型为Date
sd <- Sys.Date()

# 将任意character保存为Date类型
# 个是必须为(YYYY-BB-dd)
d2 <- as.Date("2016-05-15")

# 获取当前日期是周几
weekdays(d2)
# 获取当前日期是几月
months(d2)
# 获取当前日期是第几季度
quarters(d2)
# 获取当前日期距离1970年01月01日的天数
julian(d2)

# 日期的简单运算
d3 <- as.Date("2016-07-22")
# 得到一个character类型的时间差（Time difference of xx days）
d3 - d2
# 利用强制转换，转为只有时间差的integer （xx）
as.integer(d2 - d3)

# time
# POSIXct: 整数，常用于存入数据框
# POSIXlt: 列表，包含星期、年、月、日等信息
# 获取当前系统时间，为POSIXct类型
ct <- Sys.time()
# 转换为POSIXlt类型
lt <- as.POSIXlt(ct)

# 查看POSIXlt保存了哪些时间信息
# 去除类型，打印名字
# "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"   "isdst"  "zone"   "gmtoff"
names(unclass(lt))
# 根据name，可以获取具体的时间数据
mday <- lt$mday
wday <- lt$wday
yday <- lt$yday
isdst <- lt$isdst
zone <- lt$zone
gmtoff <- lt$gmtoff

# ���不定格式的character类型日期，转换为Date
d4 <- "July 22 2016 - 12:18:01"
# %B表示month，%d表示日期，%Y表示年，%H表示小时，%M表示分钟，%S表示秒
# 格式必须一致
strptime(d4, "%B %d %Y - %H:%M:%S ")
  
  





