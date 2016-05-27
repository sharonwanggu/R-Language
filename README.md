# R Tutor  
## 0.R Resources  
0.1 [R](https://cran.r-project.org)  
0.2 [IDE RStudio](https://www.rstudio.com/products/rstudio/download/)   
0.3 [Introduction to R 中文版（R导论）](https://cran.r-project.org/doc/contrib/Ding-R-intro_cn.pdf)  
0.4 [来自Google的R语言编码风格指南](https://github.com/samtse18/R-Language/blob/master/resources/来自%20Google的R语言编码风格指南.pdf)  
0.5 [R数据的导入和导出 version 2.2.1 （中文版）](http://mcm.dept.ccut.edu.cn/u_newsfiles/1283049677/20120320/20120320065633313331.pdf) / [R数据的导入和导出 version 3.3.0 （英文版）](https://cran.r-project.org/doc/manuals/R-data.pdf)

## 1.在RStudio中操作package:
1.1 package在cran上：install.packages("package name")，注意保留引号  
1.2 package在github上：install_github("package name")  
1.3 更新package：update.packages()  
1.4 查看已安装package的描述：installed.packages()  
  
# R Data Analysis
## 0.数据分析流程
0.1 定义探究问题  
0.2 第一理想的数据集  
0.3 确定能够获取的数据  
0.4 获取数据  
0.5 整理数据  
0.6 探索性分析（数据可视化）  
0.7 统计分析／建模（机器学习）  
0.8 解析／交流结果（数据可视化）  
0.9 挑战结果（有没有其他的可能性？）  
0.10 书写报告（Reproducible原则）

## 2.数据基础  
**2.0 数据集的概念**  
数据集通常是由数据构成的一个矩形数组，不同行业对行／列的名称不同

|           行业           |        行          |        列        |
| :-----------             | :----------        | :----------      |
| 统计学家                 | 观测（observation）| 变量（variable） |  
| 数据库分析师             | 记录（record）     | 字段（field）    | 
| 数据挖掘／机器学习研究者 | 示例（example）    | 属性（attribute）| 

**2.1 变量类型：**  
  - 数值（quantitative） 可以进行加减乘除求平均等运算  
      - 连续 可在给定区间取任意数值（1-10的范围内，可以取1、1.1、1.2...无限个数字）  
      - 离散 在给定的数值集合内取值（1-10的范围内，只能取1、2、3、4到10这10个数字）  
  - 分类 （qualitative） 取值空间有限，不能进行运算  
      - 无序：不可比较 （苹果、香蕉、梨）  
      - 有序：顺序有意义 （大一、大二、大三）  

**2.2 变量间的关系（对应不同的可视化方法和统计分析方法）**  
  - 两个数值变量  
  - 两个分类变量  
  - 一个数值变量，一个分类变量  

**2.3 数值变量的特征和可视化**（🌰：1、9、2、8、3、9、4、5、7、6）  
  - 数据集中趋势的测量（measures of center）   
      - 均值（mean）、中位数字（median）、众数（mode）  
          - 均值 ＝（1+9+2+8+3+9+4+5+7+6）／10 ＝ 5.4  
          - 中位数 ＝ 排序后位于正中间的一个数 或 位于正中间的两个数的均值 ＝ 5.5  
          - 众数 ＝ 出现次数最多的数＝9  
  - 数据离散趋势的测量（）  
      - 值域（range：max－min）、方差（variance）、标准差（standard variance）、四分位距（interquartile range）  
          - 值域 ＝ 最大值－最小值 ＝ 8  
          - 方差  
          - 标准差 ＝ 方差开方 ＝ 2.88  
          - 四分位距  
  - 稳健统计量（robust statistics）  
      - 是：中位数、四分位差（受极端值影响小）  
      - 否：均值、标准差、值域（受极端值影响大）  
  - 一个变量的可视化  
      - 柱状图（histogram）  
      - 点图（dot plot）（分布）  
      - 箱图（box plot）（中位数、分位点、极端值）  
  - 两个变量的关系  
      - 散点图（scatter plot）：方向、形状、强度、极端值  

**2.4 分类变量的特征和可视化**  
  - 一个分类变量的可视化  
      - 频率表（frequency table）  
      - 条形图（bar plot）  
  - 两个分类变量的关系  
      - 关联表（contingency table）  
      - 相对频率表（relative frequencies）  
      - 分段条形图、相对频率分段条形图  
      - 马赛克图（mosaic plot）  
  - 一个分类、一个数值变量的关系  
      - 并排箱图（side-by-side box plot）

## 3.R的绘图系统  
**3.0 基本绘图系统（Base Plotting System）**  
  - 绘图函数（graphics包）  
      - plot()  
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
      - par() 用于设置全局参数（作用于R中的所有plot绘图） 
          bg（背景颜色）  
          mar（图表距离画板的边距）  
          las（文字的排版：横排、竖排）  
          mfrow（把当前画板分成几行几列，并且按照行的方式填充）  
          mfcol（把当前画板分成几行几列，并且按照列的方式填充）  
          这些参数可以在每次plot前修改  
      - hist()（柱状图）  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/R-hist.png)
      - boxplot()（箱图）  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/R-boxplot.png)
      - points()（点图）  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/R-points.png)
      - lines()（线图）  
      - text()（在图表指定位置添加文字）  
      - title()（给图表命名）  
      - axis()（添加坐标轴）  
      - 调用函数会启用一个图形设备（如果没有正在运行的图形设备），并在设备上绘图  

**3.1 Lattice绘图系统（Lattice Plotting System）**  
  - 绘图函数  
      - lattice包  
          - xyplot()，适合画散点图  
              xyplot(因变量y ~ 自变量x | 分类变量f * g, 数据集)  
          - bwplot()   
          - histogram() 柱状图  
          - stripplot()  
          - dotplot() 点图  
          - splom()   
          - levelplot()  
          - contourplot()  
          - panel()，用于控制每个面板内的绘图  
      - grid包  
          - 实现了独立于base的绘图系统 
          - lattice包基于grid创建的，很少直接从grid包调用函数  
  - Lattice于Base的重要区别  
      - Base绘图函数直接在图形设备上绘图  
      - Lattice绘图函数返回trellis类对象  
      - 打印函数真正执行了在设备上绘图  
      - 命令执行时，trellis类对象会被自动打印，所以看起来就像是lattice函数直接完成了绘图  

**3.2 ggplot2绘图系统（ggplot2 Plotting System）**  
  - 层（Layer）  

| Layer                       | Description                                                                      |
| :-----------                | :----------                                                                      |
| Data（数据层）              | 需要分析的数据集（data frame）                                                   |  
| Aesthetics（美学属性层）    | x-axis／y-axis／color／fill／size／labels／alpha／shape／liner width／liner type |  
| Geometries（几何课题层）    | point／line／histogram／bar／boxplot                                             |  
| Facets（绘图面板）          | columns／rows（绘图画板分为多少行，多少列）                                      |  
| Statistics（统计层）        | binning／smoothing／descriptive／inferential                                     |  
| Coordinates（坐标系）       |cartesian／fixed／polar／limits                                                   |  
| Themes（主题）              |non-data ink                                                                      | 
  - 绘图函数  
      - qplot()  
          - 类似于Base系统的plot()，参数包含aesthetics／geom／facet...  
          - 隐藏了绘图实现的细节（灵活性欠佳）  
      - ggplot()  
          - 是核心，可以实现qplot()无法实现的功能  
          - 调用ggplot()本身并不能实现绘图，要在其基础上添加层（如gem_point()）才可以

**3.3 R语言绘图之颜色**  
  - grDevices包  
    - colorRamp() & colorRampPalette()  
    - 颜色的名字可使用colors()获取
  - RColorBrewer包  
    - 三类调色板  
      - sequential：从一个极端到另一个极端慢慢过渡，适合呈现顺序数据  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/RColorBrewer-Sequential.png)
      - diverging：两级取值颜色比较明显，适合呈现处于极端的数据  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/RColorBrewer-Diverging.png)
      - qualitative：于前两类调色板对比，不存在特别淡的颜色，颜色之间的对比较鲜明，适合呈现分类变量之间的差异和对比
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/RColorBrewer-Qualitative.png)
    - 调色板信息可与colorRamp／colorRampPalette结合使用  

**3.4 R支持的图形设备**  
  - 什么是图形设备  
    - 屏幕设备（探索性分析常用）：电脑屏幕  
      - windows() on Windows  
      - quartz() on Mac  
      - xll() on Unix or Linux  
    - 文件设备（打印／文章用图常用）  
      - 向量格式（vector format）：PDF，适于存储线条图  
      - 位图（bitmap format）：PNG／JPEG／TIFF／BMP，适于呈现大量数据  
    - grDevices包  
      - 包含了实现各种图形设备的代码  
      - ?Devices：查看可用的各种图形设备  
  - 生成图形的两种途径  
    - 调用绘图函数（默认使用屏幕）-> 屏幕设备显示图形 -> 进一步修饰图形  
    - 明确指定图形设备 -> 调用绘图函数（如果制定的是文件设备则无法在屏幕上看到图形）-> 进一步修饰图形 -> 关闭图形设备dev.off()  
    ``` R
    # 将图画到设备中
    # 制定图形设备pdf()
    # pdf(file =  保存的文件名)
    pdf(file = "myfig.pdf")
    # 绘制图表
    with(airquality, plot(Wind, Temp, main = "Wind and Temp in NYC"))
    # 关闭设备
    dev.off
    # 获取保存的文件路径
    getwd()
    ```
    - 可同时打开多个设备，但一次只能在一个设备上绘图    
    - dev.cur() 获取但前活跃的设备  
    - dev.set() 将设备指定为活跃的设备  
  - 拷贝图形  
    - 多个设备之间的互相拷贝：dev.copy  
    ``` R
    # 将当前屏幕设备上的图
    # copy到png格式的文件中
    with(airquality, plot(Wind, Temp, main = "Wind and Temp in NYC"))
    # dev.copy(图片格式，文件名)
    dev.copy(png, file = "myCopy.png")
    # 关闭设备
    dev.off()
    ```
      - 拷贝到PDF文件：dev.copy2pdf()  
      - 注意：拷贝的结果可能于原图有出入，因为其拷贝过程并不是一一对应的过程  
  - 绘图前请思考
    - 在哪儿绘图（屏幕？文件？）
    - 如何使用图（屏幕呈现？网页呈现？文章用图？）
    - 用于绘图的数据量的大小（向量格式 vs. 位图 ）
    - 是否需要动态调整图的大小（向量格式 vs. 位图 ）
    - 用哪个绘图系统（Base／Lattice／ggplot2 ？）一般三者不混用

**3.5 探索性数据分析**  
  - 目的  
    - 了解数据特征、找到数据中的模式、形成分析策略  
    - 图与数字互相验证、帮助发现错误、用于交流结果  
  - 特点  
    - 快速、通常呈现在屏幕设备  
    - 不需要过分注重图是否漂亮  
  - 分析性作图的六大原则  
    - 凸显比较（谁和谁比）  
    ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/R-Plotting-Prin1.png)
    - 凸显机制（因果／机制／解释）  
    ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/R-Plotting-Prin2.png)
    - 凸显多元性（>2个变量、逃离扁平）  
    ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/R-Plotting-Prin3.png)
    - 整合证据  
      - 整合文字、数字、图、表等  
      - 用多种方式显示数据的特征  
      - 不要让工具主宰分析  
    - 使用适当的图标、尺度等  
      - 完备性、一图胜前言  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/R-Plotting-Prin5.png)
    - 内容是王道  
      - 研究问题的重要性 > 作图漂亮  
  - 获取帮助  
    - 如何问问题  
      - 操作系统、版本、哪一步产生错误、预期是什么、得到的结果是什么、其他有用的信息  
    - Google  
