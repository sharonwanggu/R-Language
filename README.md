# R Tutor  
## 0.R Resources  
0.1 [R](https://cran.r-project.org)  
0.2 [IDE RStudio](https://www.rstudio.com/products/rstudio/download/)   
0.3 [Introduction to R 中文版（R导论）](https://cran.r-project.org/doc/contrib/Ding-R-intro_cn.pdf)  
0.4 [来自Google的R语言编码风格指南](https://github.com/samtse18/R-Language/blob/master/resources/pdf/来自%20Google的R语言编码风格指南.pdf)  
0.5 [R数据的导入和导出 version 2.2.1 （中文版）](https://github.com/samtse18/R-Language/blob/master/resources/pdf/R数据的导入和导出（Chinese）.pdf) / [R数据的导入和导出 version 3.3.0 （英文版）](https://cran.r-project.org/doc/manuals/R-data.pdf)

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

数据集例子  

|  病人编号（PatientId）  |  入院时间（AdmDate）  |  年龄（Age）  |  糖尿病类型（Diabetes）  |  病情（Status）  |  
|  :-----------           |  :----------          |  :----------  |  :----------             |  :----------     |  
|  1001                   |  10/10/2016           |  21           |  Type1                   |  Poor            |  
|  1002                   |  10/11/2016           |  32           |  Type2                   |  Excellent       |  
|  1003                   |  10/12/2016           |  43           |  Type1                   |  Ailing          |  
|  1004                   |  10/13/2016           |  54           |  Type1                   |  Improved        |  
|  1005                   |  10/14/2016           |  65           |  Type2                   |  Poor            |

**2.1 数据结构**  
  - 向量（vector）  
    - 向量是一个一维数组，用于存储数值型、字符型或逻辑型数据  
    - 单个向量中的数据必须拥有相同的类型  
    - 执行组合功能的函数c()可用来创建向量  
``` R
    numerical <- c(1001, 1002, 1003, 1004, 1005) # 数值型向量
    string <- c("Poor", "Excellent", "Ailing", "Improved") # 字符型向量
    logical <- c(TRUE, FALSE, FALSE, TRUE) # 逻辑型向量

    # 访问向量中的元素
    # R中下标从1开始
    numerical[2]
    numerical[c(1, 3)]
    numerical[c(1:4)]

    # 标量
    # 只含有一个元素的向量，用于保存常量
    n <- 3
    s <- "String"
    l <- TRUE
```  
  - 矩阵（matrix）
    - 矩阵是一个二维数组，但是每个元素的类型都必须一致
``` R
    cells <- c(1:4) # data
    number_of_rows <- 2 
    number_of_columns <- 2 
    logical_value <- TRUE # 根据行填充（默认是FALSE）
    char_vector_rownames <- c("row 1", "row 2") # 每行的labels
    char_vector_colnames <- c("col 1", "col 2") # 每列的labels
    # 通过函数matrix()创建矩阵
    myMatrix <- matrix(cells, 
                       nrow = number_of_rows, 
                       ncol = number_of_columns, 
                       byrow = logical_value, 
                       dimnames = list(char_vector_rownames, char_vector_colnames))
    # 矩阵下标的使用
    myMatrix <- matrix(1:10, nrow = 2)
    myMatrix[2,] # 第2行的所有元素
    myMatrix[,1] # 第1列的所有元素
    myMatrix[1,3] # 第1行的第3个
    myMatrix[c(1,2), 2] # 第2列的第1，2个
```  
  - 数组（array）  
    - 数组与矩阵相似，但是维度可以大于2
``` R
    cells <- 1:24
    # 4行3列2组
    dimensions <- c(4, 3, 2)
    # 行的labels
    dim1 <- c("row 1", "row 2", "row 3", "row 4")
    # 列的lables
    dim2 <- c("col 1", "col 2", "col 3")
    # 组的labels
    dim3 <- c("Section 1", "Section 2")
    dimnames <- list(dim1, dim2, dim3)
    # 数组通过array()创建
    myArray <- array(cells, dimensions, dimnames)
    # 数组下标的使用
    myArray[1,1,1]
```
  - 数据框（data frame）  
    - 类似于矩阵，但是不同的列可以包含不同的数据类型（数值型，字符型等）  
    - 每一列的数据类型必须一致   
``` R
    patientID <- c(1001, 1002, 1003, 1004)
    age <- c(21, 32, 43, 54)
    diabetes <- c("Type1", "Type2", "Type1", "Type1")
    status <- c("Poor", "Improved", "Excellent", "Poor")
    # 利用data.frame()创建数据框
    patientData <- data.frame(patientID, age, diabetes, status)
    # 实例标志符（行的名称）
    patientData <- data.frame(patientID, age, diabetes, status, row.names = patientID)
    str(patientData)

    # 获取数据框中的元素
    patientData[1:2] # 返回前2列的数据
    patientData[1,] 
    patientData[c("patientID", "status")] # 直接指定列名
    patientData$age # dataFrame$colName $符号，用于选取给定数据框中的某个特定变量
    # 生成age和status的关系列表
    table(patientData$age, patientData$status)

    # attach()和detach()
    # attach()可以将数据框添加到R搜索路径中
    attach(airquality)
    plot(Temp, Ozone)
    plot(Month, Temp) 
    # detach()将数据框从搜索路径中移除，但其并不会对数据框本身作处理
    detach()
    # 但是当全局中有一个和数据集同样变量名的对象时，全局对象取得优先权
    Month <- c(5, 6, 7)
    attach(airquality)
    plot(Month, Temp) 
    detach()

    # with()
    # 无需担心变量名有冲突
    with(airquality, plot(Month, Wind))
    # 多条语句，使用{}
    with(airquality, {
      summary(airquality)
      plot(Month, Ozone)
    })
    # 赋值仅在函数的括号内有效
    with(airquality, {
      month <- airquality$Month
    })
    month # Error: object 'month' not found
    # 使用<<-赋值，可以在全局中使用
    with(airquality, {
      temp <<- airquality$Temp
    })
```
  - 因子（factor）   
    - 变量可归结为名义型、有序型、连续型   
    - 名义型是没有顺序之分的，比如糖尿病diabetes的Type1和Type2   
    - 有序型表示一种顺序关系，而非数量关系，比如病情status（poor，improved，excellent）   
    - 连续型可呈现为某个范围内的任意值，并同时表示了顺序和数量，比如年龄age，可以取21～76.3之间的任意值   
``` R
    patientID <- c(1001, 1002, 1003, 1004, 1005)
    age <- c(21, 32, 43, 54, 65)
    # 类别（名义型）变量和有序类别（有序型）变量称为因子（factor）
    diabetes <- c("Type1", "Type2", "Type1", "Type1", "Type2")
    diabetes <- factor(diabetes)
    # 因子的水平默认依字母顺序创建
    status <- c("Ailing", "Excellent", "Improved", "Poor", "Excellent")
    # 表示有序型变量，需要指定参数ordered = TRUE
    status <- factor(status, ordered = TRUE) # 返回的顺序为Ailing < Excellent < Improved < Poor，不合理
    # 通过指定参数levels覆盖默认的排序
    status <- factor(status, ordered = TRUE, levels = c("Ailing", "Poor", "Improved", "Excellent"))
    # factor()以一个integer向量的形式存储类别值
    class(unclass(status))
    patientData <- data.frame(patientID, age, diabetes, status, row.names = patientID)
    str(patientData)
    summary(patientData)
```

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
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/R-hist.png)
      - boxplot()（箱图）  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/R-boxplot.png)
      - points()（点图）  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/R-points.png)
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
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/RColorBrewer-Sequential.png)
      - diverging：两级取值颜色比较明显，适合呈现处于极端的数据  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/RColorBrewer-Diverging.png)
      - qualitative：于前两类调色板对比，不存在特别淡的颜色，颜色之间的对比较鲜明，适合呈现分类变量之间的差异和对比
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/RColorBrewer-Qualitative.png)
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
    ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/R-Plotting-Prin1.png)
    - 凸显机制（因果／机制／解释）  
    ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/R-Plotting-Prin2.png)
    - 凸显多元性（>2个变量、逃离扁平）  
    ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/R-Plotting-Prin3.png)
    - 整合证据  
      - 整合文字、数字、图、表等  
      - 用多种方式显示数据的特征  
      - 不要让工具主宰分析  
    - 使用适当的图标、尺度等  
      - 完备性、一图胜前言  
      ![alt tag](https://github.com/samtse18/R-Language/blob/master/resources/plotting%20image/R-Plotting-Prin5.png)
    - 内容是王道  
      - 研究问题的重要性 > 作图漂亮  
  - 获取帮助  
    - 如何问问题  
      - 操作系统、版本、哪一步产生错误、预期是什么、得到的结果是什么、其他有用的信息  
    - Google  
