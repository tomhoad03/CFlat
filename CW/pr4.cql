load A = "A.csv"
var C = select (1, 2) of A where (2 == notNull)
var C = arrange C asc
preach C