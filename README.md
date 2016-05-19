# R Tutor
## 1.下载R：
    https://cran.r-project.org
## 2.下载IDE RStudio：
    https://www.rstudio.com/products/rstudio/download/
## 3.下载R packages：  
    https://cran.r-project.org
## 4.可直接在RStudio中安装package：  
    4.1 如果package是在cran上，则在console中输入install.packages("package name")命令，注意保留引号  
    4.2 如果package是在github上，则在console中输入install_github("package name")命令
  
# R Data Analysis
## 1.数据分析流程
    1.1 定义探究问题
    1.2 第一理想的数据集
    1.3 确定能够获取的数据
    1.4 获取数据
    1.5 整理数据
    1.6 探索性分析（数据可视化）
    1.7 统计分析／建模（机器学习）
    1.8 解析／交流结果（数据可视化）
    1.9 挑战结果（有没有其他的可能性？）
    1.10 书写报告（Reproducible原则）

## 2.数据基础
    观测（observation）、变量（variable）、数据矩阵（data matrix）
    数据矩阵的每一行：一次观测
    数据矩阵的每一列：一个变量
    
    2.1 变量类型：
      2.1.1 数值（quantitative） 可以进行加减乘除求平均等运算
        • 连续 可在给定区间取任意数值（1-10的范围内，可以取1、1.1、1.2...无限个数字）
        • 离散 在给定的数值集合内取值（1-10的范围内，只能取1、2、3、4到10这10个数字）
      2.1.2分类 （qualitative） 取值空间有限，不能进行运算
        • 无序：不可比较 （苹果、香蕉、梨）
        • 有序：顺序有意义 （大一、大二、大三）
        
    2.2 变量间的关系（对应不同的可视化方法和统计分析方法）
        • 两个数值变量
        • 两个分类变量
        • 一个数值变量，一个分类变量
        
    2.3 数值变量的特征和可视化
        2.3.1 数据集中趋势的测量（measures of center）
            － 均值（mean）、中位数字（median）、众数（mode）
                        1 9 2 8 3 9 4 5 7 6
            • 均值＝（1+9+2+8+3+9+4+5+7+6）／10 ＝ 5.4
            • 中位数＝排序后位于正中间的一个数 或 位于正中间的两个数的均值＝5.5
            • 众数＝出现次数最多的数＝9
        2.3.2 数据分散趋势的测量（）
            － 值域（range：max－min）、方差（variance）、标准差（standard variance）、四分位距（interquartile range）
                        1 9 2 8 3 9 4 5 7 6
            • 值域＝最大值－最小值＝8
            • 方差＝（（每个数－平均值）的平方，相加）／个数减1＝8.27
            • 标准差＝方差开方＝2.88
            • 四分位距
        2.3.3 稳健统计量（robust statistics）
            • 是：中位数、四分位差（受极端值影响小）
            • 否：均值、标准差、值域（受极端值影响大）
        2.3.4 一个变量的可视化
            • 柱状图（histogram）
            • 点图（dot plot）（分布）
            • 箱图（box plot）（中位数、分位点、极端值）
        2.3.5 两个变量的关系
            • 散点图（scatter plot）：方向、形状、强度、极端值
            
    2.4 分类变量的特征和可视化
        2.4.1 一个分类变量的可视化
            • 频率表（frequency table）
            • 条形图（bar plot）
        2.4.2 两个分类变量的关系
            • 关联表（contingency table）
            • 相对频率表（relative frequencies）
            • 分段条形图、相对频率分段条形图
            • 马赛克图（mosaic plot）
        2.4.3 一个分类、一个数值变量的关系
            • 并排箱图（side-by-side box plot）

## 3.R的三大绘图系统
        3.1 基本绘图系统（Base Plotting System）
            3.1.1 绘图函数（graphics包）
                plot
                    plot()
                    plot(x轴的变量, y轴的变量, ...)
                    重要参数：
                    xlab（x轴的labl）
                    ylab（y轴的label）
                    main（视图的title）
                    lwd（线的宽度）
                    lty（线的类型：实线、虚线...）
                    pch（点的类型：实心、空心、三角...）
                    col（颜色）
                    ?par
                    
                    par() 用于设置全局参数（作用于R中的所有plot绘图）
                    bg（背景颜色）
                    mar（图表距离画板的边距）
                    las（文字的排版：横排、竖排）
                    mfrow（把当前画板分成几行几列，并且按照行的方式填充）
                    mfcol（把当前画板分成几行几列，并且按照列的方式填充）
                    这些参数可以在每次plot前修改
                hist（柱状图）
                boxplot（箱图）
                points（点图）
                lines（线图）
                text（在图表指定位置添加文字）
                title（给图表命名）
                axis（添加坐标轴）
            －调用函数会启用一个图形设备（如果没有正在运行的图形设备），并在设备上绘图
            
        3.2 Lattice绘图系统（Lattice Plotting System）
        
        3.3 ggplot2绘图系统（ggplot2 Plotting System）
