=D Comment Test

load A = "A.csv"
load B = "B.csv"

var C = unite A B where (1 of A != 1 of B)

preach C