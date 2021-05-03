load A = "F.csv"
load B = "G.csv"

var C = unite A B

var D = select (1, 6) of C where (2 == 4, 3 == 5, 2 == notNull, 3 == notNull)

preach D