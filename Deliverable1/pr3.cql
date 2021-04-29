=D program 3

load A = "P.csv"
load B = "Q.csv"

var C = unite A B

var D = select all of C where (1 == 5)
var E = select (1, 2 nullCase 6, 3 nullCase 7, 4 nullCase 8) of D

var F = arrange E asc 1

preach F