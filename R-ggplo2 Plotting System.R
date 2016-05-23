# ggplot2绘图系统（ggplot2 Plotting System）

# 在console安装ggplot2包 install.packages("ggplot2")
# 加载ggplot2
library(ggplot2)

# -------------------------------------------------------------------------------------------- #
# qplot()
# qplot(x, y, data, color ＝ 每个颜色代表一个月份)
qplot(Wind, Temp, data = airquality, color = Month)
# 点的固定颜色设置为绿色
qplot(Wind, Temp, data = airquality, color = I("Green"))
# 不同的月份用不同的形状表示
qplot(Wind, Temp, data = airquality, shape = Month)
# 不同的月份用不同的大小表示
qplot(Wind, Temp, data = airquality, size = Month)
# 设置x轴、y轴的label，图表的标题
qplot(Wind, Temp, data = airquality, color = Month, xlab = "Wind (mph)", ylab = "Temp (ºF)", main = "Wind VS Temp")

# 只传入x轴的数据，默认返回一个柱状图
qplot(Wind, data = airquality)
# 不同的颜色表示每月的风度
qplot(Wind, data = airquality, fill = Month)
# 绘制出频率分布的轮廓线（密度函数）
qplot(Wind, data = airquality, geom = "density", color = Month)
# 只传入y轴的数据，也是返回一个散点图
# 但是x轴表示的是数据出现的顺序
qplot(y = Wind, data = airquality)

# geom
# smooth返回一条回归线(使用默认的回归方法)，执行区间
qplot(Wind, Temp, data = airquality, color = Month, geom = c("point", "smooth"))

# facets
# 根据Month，绘制1行5列的图表
qplot(Wind, Temp, data = airquality, facets = .~ Month)
# 根据Month，绘制5行1列的图表
qplot(Wind, Temp, data = airquality, facets = Month ~.)

# -------------------------------------------------------------------------------------------- #
# ggplot()
# ggplot(data, aes(x, y))
ggplot(airquality, aes(Wind, Temp))

# 必须设置三个基本层：数据层，美学层，几何课题层
# 才会绘制
ggplot(airquality, aes(Wind, Temp)) + 
  geom_point(color = "steelBlue", alpha = 0.4, size = 2)
# 更具某一分类变量设置颜色
# 需要在美学层aes()中设置
ggplot(airquality, aes(Wind, Temp)) + 
  geom_point(aes(color = factor(Month)), alpha = 0.4, size = 2)
# or
ggplot(airquality, aes(Wind, Temp, color = factor(Month))) + 
  geom_point(alpha = 0.4, size = 2)

# 添加统计信息层
# 两者效果一致
ggplot(airquality, aes(Wind, Temp)) + geom_point() + geom_smooth()
# 指定回归统计方法为lm，se = FALSE 关闭执行区间
ggplot(airquality, aes(Wind, Temp, color = factor(Month))) + 
  stat_smooth(method = "lm", se = FALSE)
# group = 1 所有数据拟合
ggplot(airquality, aes(Wind, Temp, color = factor(Month), group = 1)) + 
  geom_point() + 
  stat_smooth(method = "lm", se = FALSE)
# 在stat_smooth()中添加group
ggplot(airquality, aes(Wind, Temp, color = factor(Month))) + 
  geom_point() + 
  stat_smooth(method = "lm", se = FALSE, aes(group = 1))
# 好处是可以在此基础上再添加一层统计各月份的统计层
ggplot(airquality, aes(Wind, Temp, color = factor(Month))) + 
  geom_point() + 
  stat_smooth(method = "lm", se = FALSE, aes(group = 1)) + 
  stat_smooth(method = "lm", se = FALSE)

# 自定义不同颜色代表的月份
library(RColorBrewer)
# 查看所有的调色板
display.brewer.all()
# 从名为“Spectral”的调色板中
# 获取5种颜色，分别对应5个月份
# black对应统计所有月份的回归线的颜色
myColors <- c(brewer.pal(5, "Spectral"), "black")
# 自定义颜色函数
# color = "All"，设置图表标志（All等于黑色的线，代表所有月份的统计回归线）
# scale_color_manual()，自定义颜色函数 
ggplot(airquality, aes(Wind, Temp, color = factor(Month))) + 
  geom_point() + 
  stat_smooth(method = "lm", se = FALSE, aes(group = 1, color = "All")) + 
  stat_smooth(method = "lm", se = FALSE) +
  scale_color_manual("Month", values = myColors)

# 不同月份显示在不同的面板中
ggplot(airquality, aes(Wind, Temp, color = factor(Month))) + 
  geom_point() + 
  stat_smooth(method = "lm", se = FALSE) +
  scale_color_manual("Month", values = myColors) +
  facet_grid(.~ Month)

# 改变主题
ggplot(airquality, aes(Wind, Temp, color = factor(Month))) + 
  geom_point() + 
  stat_smooth(method = "lm", se = FALSE) +
  scale_color_manual("Month", values = myColors) +
  facet_grid(.~ Month) +
  theme_dark()







