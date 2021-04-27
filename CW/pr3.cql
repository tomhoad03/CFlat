=D program 3

load A = "P.csv"
load B = "Q.csv"

var C = unite A B

var D = select all of C where (1 == 5)
var E = select (1, 2, 3, 4) of D

var F = arrange E asc

preach F

=D var E = select (1, 2 nullcase 6, 3 nullcase 7, 4 nullcase 8) of D