=D program 4

load A = "F.csv"

var C = select (1, 2) of A where (2 == notnull)

arrange C asc

preach C