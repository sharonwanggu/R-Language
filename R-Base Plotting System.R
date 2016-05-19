# 基本绘图系统（Base Plotting System）

# -------------------------------------------------------------------------------------------- #
# 柱状图 hist
# 查看风速的hist
# xlab = x轴坐标的label
hist(airquality$Wind, xlab = "Wind")

# -------------------------------------------------------------------------------------------- #
# 箱图 boxplot
# ylab = y轴坐标的label
boxplot(airquality$Wind, xlab = "Wind", ylab = "Speed (mph)")
# 利用箱图表示一个数值变量，一个分类边变量
# 看不同月份（分类变量）的风速（数值变量）
boxplot(Wind~Month, airquality, xlab = "Wind", ylab = "Speed (mph)")

# -------------------------------------------------------------------------------------------- #
# 利用plot()画散点图
plot(airquality$Wind, airquality$Temp)

# -------------------------------------------------------------------------------------------- #
# with()
# plot()在函数with()内，他的数据集是airquality
# 因此知道Wind、Temp是数据集airquality的两个变量
# 参数main = 设置视图的标题
# with()函数会根据plot()里面的参数自动设置x，y轴的label
with(airquality, plot(Wind, Temp, main = "Wind and Temp in NYC"))
# title()：设置视图的标题
title(main = "Wind and Temp in NYC")

# 按月份画点
# 参数type = "n"，只绘出x，y轴坐标信息
with(airquality, plot(Wind, Temp, main = "Wind and Temp in NYC", type = "n"))
# 绘出9月份的温度和风速的散点图
# 执行此行代码时，要先执行第32行代码，绘制出空白视图
# 否则会报 
# Error in plot.xy(xy.coords(x, y), type = type, ...) :plot.new has not been called yet 错误
with(subset(airquality, Month == 9), points(Wind, Temp, col = "red"))
with(subset(airquality, Month == 5), points(Wind, Temp, col = "blue"))
# 绘制多个月份的数据
# %in% 变量的取值在该变量的取值范围内，将其统一获取出来
with(subset(airquality, Month %in% c(6, 7, 8)), points(Wind, Temp, col = "green"))
# 添加回归线，拟合当前的数据
# 拟合模型
# lm()：用于拟合线性模型的函数
# lm(因变量y ~ 自变量x, 数据集)
fit <- lm(Temp ~ Wind, airquality)
# abline()：将获取到的回归线添加到视图中 
# lwd = 线的宽度
abline(fit, lwd = 2)
# 添加图例说明信息
# legend()：添加图例说明信息
# legend(位置, 保持圆点的颜色一致，颜色，图例说明)
legend("topright", pch = 1, col = c("red", "blue", "green"), legend = c("Sep", 'May', "Other"))

# -------------------------------------------------------------------------------------------- #
# 全局参数 par()
par("bg") # background color defalut is white
par("col") # default is black
par("mar") # bottom, left, top, right
par("mfrow") # default is 1row 1col 
par("mfcol") # default is 1row 1col

# 设置画板为1行2列
par(mfrow = c(1, 1))
hist(airquality$Temp)
hist(airquality$Wind)
# 若想恢复原来的1行1列
# 要在画图前设置全局参数
par(mfrow = c(1, 1))
boxplot(airquality$Ozone)

