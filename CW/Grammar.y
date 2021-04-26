{
module Grammar where
import Tokens
} 

%name parseCFlat
%tokentype { Token }
%error { parseError }

%token
	load	 { TokenLoad    _  }
	'='	     { TokenAssign  _  }
	'"'	     { TokenTxt     _  } -- How to tell where speech marks start and end.
	'.csv'   { TokenExt     _  } -- csv file extension
	var	     { TokenVar     _  }
	unite    { TokenUnite   _  }
	preach   { TokenPreach  _  }
	select   { TokenSelect  _  }
	all      { TokenAll     _  }
	where    { TokenWhere   _  }
	of       { TokenOf      _  }
	arrange  { TokenArr     _  }
	asc      { TokenAsc     _  }
	desc     { TokenDesc    _  }
	nullCase { TokenNC      _  }
	','      { TokenCom     _  }
	'=='     { TokenEq      _  }
	'>='     { TokenGreatEq _  }
    '<='     { TokenLessEq  _  }
    '>'      { TokenGreat   _  }
    '<'      { TokenLess    _  }
    '!='     { TokenNotEq   _  }
	'('      { TokenLB      _  }
	')'      { TokenRB      _  }
	int      { TokenInt     _ $$  }
	word     { TokenWord    _ $$  }
	
%%

Exp : load word '=' '"' word '.csv' '"' Exp    { TmLoad $2 $5 $8 }
    | var word '=' Exp Exp                     { TmVar $2 $4 $5 }
	| select word                              { Tm1Select $2 }
	| select all of word where '(' Wheres ')'  { Tm2Select $4 $7 }
	| unite word word                          { TmUnite $2 $3 }
	| preach word                              { TmPreach $2 }

Wheres : Wheres ',' Wheres    { Tm1Where $1 $3 }
       | int '==' int         { Tm2Where $1 $3 }
	   | int '>=' int         { Tm3Where $1 $3 }
	   | int '<=' int         { Tm4Where $1 $3 }
	   | int '>' int          { Tm5Where $1 $3 }
	   | int '<' int          { Tm6Where $1 $3 }
	   | int '!=' int         { Tm7Where $1 $3 }

{ 
parseError :: [Token] -> a
parseError [] = error "Parse Error"

data Exp = TmLoad String String Exp
         | TmVar String Exp Exp
		 | Tm1Select String
		 | Tm2Select String Wheres
		 | TmUnite String String
		 | TmPreach String
         deriving Show 

data Wheres = Tm1Where Wheres Wheres
            | Tm2Where Int Int
		    | Tm3Where Int Int
		    | Tm4Where Int Int
		    | Tm5Where Int Int
		    | Tm6Where Int Int
		    | Tm7Where Int Int
		    deriving Show
}