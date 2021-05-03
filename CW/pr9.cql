load A = "A.csv"

var B = unite A A

var D = select (1,2,3,4) of B where (2 == 3, 1 != 4)

var E = unite D A

var F = select (1, 6) of E where (4 == 5, 3 != 6)

var G = select distinct (1,2) of F

var H = arrange G asc

preach H