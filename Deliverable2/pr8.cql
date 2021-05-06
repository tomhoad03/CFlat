load A = "P.csv"
load B = "Q.csv"

var C = unite A B

var D = select (5 nullCase 1, 6 nullCase 2, 7 nullCase 3, 8) of C where (4 == 8)

var E = arrange D asc

preach E