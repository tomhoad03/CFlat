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

Exp : load word '=' '"' word '.csv' '"' Exp { TmLoad $2 $5 $8 }
    | var word '=' Exp Exp                  { TmVar $2 $4 $5 }
	| select word                           { Tm1Select $2 }
	| select '(' Ofs ')' Exp                { Tm2Select $3 $5 } --need to reduce to only 'Of's
	| unite word word                       { Tm1Unite $2 $3 }
	| unite word word where '(' Ofs ')'     { Tm2Unite $2 $3 $6 }
	| preach word                           { TmPreach $2 }
	  
Exps : Exp { [$1] }
     | Exps ',' Exp { $3 : $1 }

Ofs : Ofs ',' Ofs                  { Tm1Of $1 $3 }
    | int of word '==' int of word { Tm2Of $1 $3 $5 $7 }
	| int of word '>=' int of word { Tm3Of $1 $3 $5 $7 }
	| int of word '<=' int of word { Tm4Of $1 $3 $5 $7 }
	| int of word '>' int of word  { Tm5Of $1 $3 $5 $7 }
	| int of word '<' int of word  { Tm6Of $1 $3 $5 $7 }
	| int of word '!=' int of word { Tm7Of $1 $3 $5 $7 }

{ 
parseError :: [Token] -> a
parseError [] = error "Parse Error"

data Exp = TmLoad String String Exp
         | TmVar String Exp Exp
		 | Tm1Select String
		 | Tm2Select Ofs Exp
		 | Tm1Unite String String
		 | Tm2Unite String String Ofs
		 | TmPreach String
         deriving Show 

data Ofs = Tm1Of Ofs Ofs
         | Tm2Of Int String Int String
		 | Tm3Of Int String Int String
		 | Tm4Of Int String Int String
		 | Tm5Of Int String Int String
		 | Tm6Of Int String Int String
		 | Tm7Of Int String Int String
		 deriving Show
}