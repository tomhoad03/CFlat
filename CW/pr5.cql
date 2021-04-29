=D program 5

load A = "A.csv"

var B = select (1) of A 

var C = append B "0"
var D = append C B

var E = arrange D asc

preach E