{
module Tokens where
}

%wrapper "posn"
$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
	$white+  ;
    "=D".*   ;
    load	 { \p s -> TokenLoad p    }
	=	     { \p s -> TokenAssign p  }
	\"	     { \p s -> TokenTxt p     }
    \.csv    { \p s -> TokenExt p     }
	var	     { \p s -> TokenVar p     }
    add      { \p s -> TokenAdd p     }
	unite    { \p s -> TokenUnite p   }
	preach   { \p s -> TokenPreach p  }
	select   { \p s -> TokenSelect p  }
    all      { \p s -> TokenAll p     }
	where    { \p s -> TokenWhere p   }
	of       { \p s -> TokenOf p      }
	arrange  { \p s -> TokenArr p     }
    append   { \p s -> TokenApp p     }
	asc      { \p s -> TokenAsc p     }
	desc     { \p s -> TokenDesc p    }
	nullCase { \p s -> TokenNC p      }
    notNull  { \p s -> TokenNN p      }
    update   { \p s -> TokenUpdate p  }
	delete   { \p s -> TokenDelete p  }
    distinct { \p s -> TokenDist p    }
    top      { \p s -> TokenTop p     }
	\,       { \p s -> TokenCom p     }
	\==      { \p s -> TokenEq p      }
    \>=      { \p s -> TokenGreatEq p }
    \<=      { \p s -> TokenLessEq p  }
    \>       { \p s -> TokenGreat p   }
    \<       { \p s -> TokenLess p    }
    \!=      { \p s -> TokenNotEq p   }
	\(       { \p s -> TokenLB p      }
	\)       { \p s -> TokenRB p      }
	$digit+  { \p s -> TokenInt p (read s)  }
	$alpha [$alpha $digit \_ \’]*   { \p s -> TokenWord p s }

{
data Token =
  TokenLoad AlexPosn        |
  TokenAssign AlexPosn      |
  TokenTxt AlexPosn         |
  TokenExt AlexPosn         |
  TokenVar AlexPosn         |
  TokenAdd AlexPosn         |
  TokenUnite AlexPosn       |
  TokenPreach AlexPosn      |
  TokenSelect AlexPosn      |
  TokenAll AlexPosn         |
  TokenWhere AlexPosn       |
  TokenOf AlexPosn          |
  TokenArr AlexPosn         |
  TokenApp AlexPosn         |
  TokenAsc AlexPosn         |
  TokenDesc AlexPosn        |
  TokenNC AlexPosn          |
  TokenNN AlexPosn          |
  TokenUpdate AlexPosn      |
  TokenDelete AlexPosn      |
  TokenDist AlexPosn        |
  TokenTop AlexPosn         |
  TokenCom AlexPosn         |
  TokenEq AlexPosn          |
  TokenGreatEq AlexPosn     |
  TokenLessEq AlexPosn      |
  TokenGreat AlexPosn       |
  TokenLess AlexPosn        |
  TokenNotEq AlexPosn       |
  TokenLB AlexPosn          |
  TokenRB AlexPosn          |
  TokenInt AlexPosn Int     |
  TokenWord AlexPosn String
  deriving (Eq,Show)

tokenPosn :: Token -> String
tokenPosn (TokenLoad (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAssign  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTxt  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenExt  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAdd  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenUnite  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPreach (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSelect (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAll (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhere (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenArr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenApp (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAsc (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDesc (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNC (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNN (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenUpdate (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDelete (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDist (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTop (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenCom  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreatEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreat  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLess  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNotEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLB  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRB  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt (AlexPn a l c) x) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWord (AlexPn a l c) x) = show(l) ++ ":" ++ show(c)
}
