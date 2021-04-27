=D program 2

load A = "C.csv"

var B = select (3, 1) of A where (1 == 2)
 
var C = arrange B desc 1

preach C