load A = "P.csv"
load B = "Q.csv"
load C = "R.csv"
load D = "S.csv"
load E = "T.csv"

var F = unite A B
var G = unite F C
var H = unite G D
var I = unite H E

var J = arrange I asc

preach J
