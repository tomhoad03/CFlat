load A = "R.csv"

var B = unite A A

var C = unite B A

var D = select (1, 6) of C where (2 == 3, 4 == 5)

var E = select distinct (1,2) of D

var F = arrange E asc

preach F