=D program 3

load A = "D.csv"
load B = "E.csv"

var C = unite A B

var D = select all of C where (1 == 5)
var E = select (1, 2, 3, 4) of D

arrange E asc

preach E

=D var E = select (1, 2 nullcase 6, 3 nullcase 7, 4 nullcase 8) of C