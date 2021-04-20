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
	'.csv'   { TokenCsv    _  } -- csv file extension
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

Exp : int                               { TmInt $1 }
    | word                              { TmWord $1 }
	| load word '=' '"' word '.csv' '"' { TmLoad $2 $5 }
    | var word '=' Exp                  { TmVar $2 $4 }
	| select '(' Exps ')'               { TmSelect $3 } --need to reduce to only 'Of's
	  
Exps : Exp { [$1] }
     | Exps ',' Exp { $3 : $1 }

{ 
parseError :: [Token] -> a
parseError [] = error "Parse Error" 
data Exp = TmInt Int
         | TmWord String
		 | TmLoad String String
         | TmVar String Exp
		 | TmSelect [Exp]
         deriving Show 
} 