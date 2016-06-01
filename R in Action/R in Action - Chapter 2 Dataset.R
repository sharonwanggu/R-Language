# 数据结构
# -------------------------------------------------------------------------------------------- #
# 1. 向量（vector）
# 向量是一个一维数组，用于存储数值型、字符型或逻辑型数据
# 执行组合功能的函数c()可用来创建向量
numerical <- c(11, 13, 15, 17) # 数值型向量
string <- c("peter", "marry", "tom", "jack") # 字符型向量
logical <- c(TRUE, FALSE, FALSE, TRUE) # 逻辑型向量
# 单个向量中的数据必须拥有相同的类型

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

# -------------------------------------------------------------------------------------------- #
# 2. 矩阵（matrix）
# 矩阵是一个二维数组，但是每个元素的类型都必须一致
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

# -------------------------------------------------------------------------------------------- #
# 3. 数组（array）
# 数组与矩阵相似，但是维度可以大于2
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

# -------------------------------------------------------------------------------------------- #
# 4. 数据框（data frame）
# 类似于矩阵，但是不同的列可以包含不同的数据类型（数值型，字符型等）
# 每一列的数据类型必须一致
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
temp

# -------------------------------------------------------------------------------------------- #
# 5. 因子（factor）
# 变量可归结为名义型、有序型、连续型
# 名义型是没有顺序之分的，比如糖尿病diabetes的Type1和Type2
# 有序型表示一种顺序关系，而非数量关系，比如病情status（poor，improved，excellent）
# 连续型可呈现为某个范围内的任意值，并同时表示了顺序和数量，比如年龄age，可以取21～76.3之间的任意值

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

# -------------------------------------------------------------------------------------------- #
# 6. 列表（list）
# 列表是一些对象的有序集合，允许整合若干（可以并无关联）个对象到单个列表对象名下
# 比如列表可以包含若干向量、矩阵、数据框、或者其他的列表
# 
# 使用list()创建列表对象
# list1 <- list(object1, object2, ......)
list1 <- list(matrix(1:6, nrow = 2), c(1, 2, 3), "peter")
# 给每一个对象命名
# myList <- list(name1 = object1, name2 = object2, ......)
myList <- list(num = numerical, char = string, log = logical, mat = myMatrix, dataFrame = patientData, li = list1)

# 获取list中的对象（有名字 $num）
myList[1] # 利用下标
myList["mat"] # 利用名字

# 获取list中的对象（没有名字）
myList[[1]]
myList[["mat"]]

