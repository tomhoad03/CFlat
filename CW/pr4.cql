=D program 4

load A = "A.csv"

var B = select (1, 2) of A where (2 == notNull)

var C = arrange B asc

preach C