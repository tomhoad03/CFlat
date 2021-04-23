{
module Grammar where
import Tokens
} 

%name parseCFlat
%tokentype { Token }
%error { parseError }

%token
	load	 { TokenLoad   _  }
	'='	     { TokenAssign _  }
	'"'	     { TokenTxt    _  } -- How to tell where speech marks start and end.
	'.csv'   { TokenExt    _  } -- csv file extension
	var	     { TokenVar    _  }
	unite    { TokenUnite  _  }
	preach   { TokenPreach _  }
	select   { TokenSelect _  }
	where    { TokenWhere  _  }
	of       { TokenOf     _  }
	arrange  { TokenArr    _  }
	asc      { TokenAsc    _  }
	desc     { TokenDesc   _  }
	nullCase { TokenNC     _  }
	','      { TokenCom    _  }
	'=='     { TokenEq     _  }
	'('      { TokenLB     _  }
	')'      { TokenRB     _  }
	int      { TokenInt    _ $$  }
	word     { TokenWord   _ $$  }
	
%%

Exp : load word '=' '"' word '.csv' '"' Exp { TmLoad $2 $5 $8 }
    | var word '=' Exp Exp                  { TmVar $2 $4 $5 }
	| select word                           { Tm1Select $2 }
	| select '(' Exps ')' Exp               { Tm2Select $3 $5 } --need to reduce to only 'Of's
	| unite word word                       { TmUnite $2 $3 }
	| preach word                           { TmPreach $2 }
	  
Exps : Exp { [$1] }
     | Exps ',' Exp { $3 : $1 }

{ 
parseError :: [Token] -> a
parseError [] = error "Parse Error" 
data Exp = TmLoad String String Exp
         | TmVar String Exp Exp
		 | Tm1Select String
		 | Tm2Select [Exp] Exp
		 | TmUnite String String
		 | TmPreach String
         deriving Show 
} 