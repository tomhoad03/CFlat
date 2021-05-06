load A = "S.csv"
load B = "T.csv"

var C = unite A B

var D = select (3,4) of C where (1 == 2, 5 == 6)

var E = arrange D asc

preach E