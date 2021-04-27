=D program 5

load A = "G.csv"

var B = select (1) of A 

=D Append takes two arguments, the first is the string to append to, the second is the value to append

var C = append B "0"

var D = arrange C asc 1

preach D