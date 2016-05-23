# Lattice Plotting System

# -------------------------------------------------------------------------------------------- #
# 加载lattice package
library(lattice)

# xyplot()
# 查看Temp和Ozone之间的关系
xyplot(Temp ~ Ozone, data = airquality)

# 查看在不同的Month下，Temp和Ozone之间的关系
# 将Month转化分factor分类变量
airquality$Month <- factor(airquality$Month)
# layout, 已知数据集的Month为5个月份，所以所以设置布局为5列1行
xyplot(Temp ~ Ozone | Month, data = airquality, layout = c(5, 1))

# 证明lattice函数会返回一个类对象
# 如果将其存在一个变量中
# 画板不会有图表打印
# 需要手动调用print()打印
# 如果不将其存在一个变量中
# 则会自动调用print()打印图表
q <- xyplot(Temp ~ Ozone, data = airquality)
print(q)

# panel()
# 设置种子点
# 设置种子点的意义在于每次产生的随机数是一样的
# 比如在某个程序中运用到了随机数，并得出了一个结果
# 但是你觉得这个结果和预期的不太一致
# 因此你想找别人帮你检查哪里出现了问题
# 如果没有设置种子点
# 别人无法和你生成一模一样的随机数
# 无法验证你在哪一步出现了错误
set.seed(1)
x <- rnorm(100)
# 0和1各占50个
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group1", "Group2"))
xyplot(y ~ x | f, layout = c(2, 1))

 # 自定义面板风格
xyplot(y ~ x | f, panel = function(x, y) {
  # 调用默认的panel.xyplot(x, y)
  panel.xyplot(x, y)
  # 在x轴和y轴的均值处，画一条虚线
  panel.abline(v = mean(x), h = mean(y), lty = 2)
  # 添加拟合x和y的回归线
  panel.lmline(x, y, col = "red")
})


