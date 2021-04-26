=D program 1

load A = "A.csv"
load B = "B.csv"

var C = unite A B
var D = select (1, 2) of C

preach D

=D load A = "A.csv"
=D load B = "B.csv"
=D var C = unite A B
=D var D = select all of C where (1 == 5)
=D var E = select (1, 2 nullcase 6, 3 nullcase 7, 4 nullcase 8) of C
=D arrange E asc
=D preach E 