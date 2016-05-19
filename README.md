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
## 1.完整的数据分析流程
    1.1 定义探究问题
    1.2 第一理想的数据集
    1.3 确定能够获取的数据
    1.4 获取数据
    1.5 整理数据
    1.6 探索性分析（数据可视化）
    1.7 统计分析／建模（机器学习）
    1.8 解析／交流结果（数据可视化）
    1.9 挑战结果（有没有其他的可能性？）
    2.0 书写报告（Reproducible原则）

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
