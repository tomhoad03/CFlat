load A = "A.csv"

var B = select (1, 2) of A where (2 == notNull)

var C = arrange B asc 1

preach C