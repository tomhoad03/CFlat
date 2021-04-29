=D program 2

load A = "A.csv"

var B = select (3, 1) of A where (1 == 2)
 
var C = arrange B asc

preach C