# R语言绘图之颜色

# -------------------------------------------------------------------------------------------- #
# colorRamp()
# red和blue分别代表两个极端的颜色
pal <- colorRamp(c("red", "blue"))
pal(0) # red
pal(1) # blue
# 输入0～1之间的数字，可以获取[red, blue]区间内的颜色
pal(0.5)
# 获取一系列的颜色
# 获取10个在[red, blue]区间内的颜色
pal(seq(0, 1, len = 10))

# colorRampPalette()
# colorRampPalette()保存的是颜色的16进制
crPal <- colorRampPalette(c("red", "green"))
crPal(1) # 返回red #FF0000
crPal(2) # 返回2个颜色 red和green
crPal(10) # 返回10个处于[red, green]区间内的颜色

library(RColorBrewer)
# 查看调色板的信息
# maxcolors：当前调色板最多可使用颜色的种类
# category：三类调色板中的哪一类
# colorbind：对色盲人士是否友好
brewer.pal.info

# colorRampPalette于RColorBrewer的结合使用
# 从“Greens”调色板中获取三个颜色
cols <- brewer.pal(3, "Greens")
pal <- colorRampPalette(cols)
# 以pal的3个颜色为端点
# 获取包括这3个颜色的20中颜色绘制图表
image(volcano, col = pal(20))
