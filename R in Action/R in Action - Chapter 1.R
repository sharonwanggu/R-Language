# 打开帮助文档的首页，并查阅其中的“introduction to R”
help.start()
# 安装vcd包
install.packages("vcd")
# 列出此包中可用的函数和数据集
help(package = "vcd")
# 载入vcd，阅读数据集Arthritis
library(vcd)
help("Arthritis")
# 显示数据集Arthritis的内容
Arthritis
# 运行数据集Arthritis的demo
example(Arthritis)