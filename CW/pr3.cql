Load A = "A.csv"
Load B = "B.csv"
Var C = Unite A B)
Var D = Select All Of C Where (1 == 5)
Var E = Select (1, 2 NullCase 6, 3 NullCase 7, 4 NullCase 8) Of C
Arrange E Asc
Preach E