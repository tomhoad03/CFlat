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
	add      { TokenAdd     _  }
	unite    { TokenUnite   _  }
	preach   { TokenPreach  _  }
	select   { TokenSelect  _  }
	all      { TokenAll     _  }
	where    { TokenWhere   _  }
	of       { TokenOf      _  }
	arrange  { TokenArr     _  }
    append   { TokenApp     _  }
	asc      { TokenAsc     _  }
	desc     { TokenDesc    _  }
	nullCase { TokenNC      _  }
    notNull  { TokenNN      _  }
	update   { TokenUpdate  _  }
    delete   { TokenDelete  _  }
    distinct { TokenDist    _  }
    top      { TokenTop     _  }
	','      { TokenCom     _  }
	'=='     { TokenEq      _  }
	'>='     { TokenGreatEq _  }
    '<='     { TokenLessEq  _  }
    '>'      { TokenGreat   _  }
    '<'      { TokenLess    _  }
    '!='     { TokenNotEq   _  }
	'('      { TokenLB      _  }
	')'      { TokenRB      _  }
	int      { TokenInt     _ $$ }
	word     { TokenWord    _ $$ }

%%

Exp : load word '=' '"' word '.csv' '"' Exp            { TmLoad $2 $5 $8 }
    | var word '=' Exp Exp                             { TmVar $2 $4 $5 }
	| word add word                                    { Tm1Add $1 $3 }
	| word add '(' Words ')'                           { Tm2Add $1 $4 }
	| select all of word                               { Tm1Select $4 }
	| select '(' Cols ')' of word                      { Tm2Select $3 $6 }
	| select all of word where '(' Wheres ')'          { Tm3Select $4 $7 }
	| select '(' Cols ')' of word where '(' Wheres ')' { Tm4Select $3 $6 $9 }
    | select distinct '(' Cols ')' of word             { Tm5Select $4 $7 }
    | select top int of word                           { Tm6Select $3 $5 }	
	| unite word word                                  { TmUnite $2 $3 }
    | arrange word asc int                             { TmArr1 $2 $4 }
    | arrange word desc int                            { TmArr2 $2 $4 }
    | append word word                                 { TmApp1 $2 $3 }
    | append word '"' word '"'                         { TmApp2 $2 $4 }
	| append word '"' int '"'                          { TmApp3 $2 $4 }
	| append word '"' int word '"'                     { TmApp4 $2 $4 $5 }
	| preach word                                      { TmPreach $2 }
	| update word '(' Sets ')' where '(' Wheres ')'    { TmUpdate $2 $4 $8 }
    | delete of word where '(' Wheres ')'              { TmDelete $3 $6 }

Sets : Set ',' Sets             { Tm1Sets $1 $3 }
     | Set                      { Tm2Sets $1 }
     
Set  : int '=' '"' word '"'     { TmSet1 $1 $4 }
     | int '=' int              { TmSet2 $1 $3 }
	 | int '=' '"' int word '"' { TmSet3 $1 $4 $5 }

Cols : Col ',' Cols             { Tm1Cols $1 $3 }
     | Col                      { Tm2Cols $1 }

Col  : int nullCase int         { TmNullCol $1 $3 }
     | int                      { TmCol $1 } 

Wheres : Where ',' Wheres       { Tm1Wheres $1 $3 }
       | Where                  { Tm2Wheres $1 }

Where  : int '==' int           { Tm2Where $1 $3 }
	   | int '>=' int           { Tm3Where $1 $3 }
	   | int '<=' int           { Tm4Where $1 $3 }
	   | int '>' int            { Tm5Where $1 $3 }
	   | int '<' int            { Tm6Where $1 $3 }
	   | int '!=' int           { Tm7Where $1 $3 }
       | int '==' notNull       { Tm8Where $1 }

Words : word ',' Words { TmWords $1 $3 }
      | word           { TmWord $1 }

{
parseError :: [Token] -> a
parseError [] = error "Parse Error"
parseError (t : ts) = error ("Parse error at " ++ (tokenPosn t) ++ show t)

data Exp = TmLoad String String Exp
         | TmVar String Exp Exp
		 | Tm1Add String String
		 | Tm2Add String Words
		 | Tm1Select String
		 | Tm2Select Cols String
		 | Tm3Select String Wheres
		 | Tm4Select Cols String Wheres
         | Tm5Select Cols String
         | Tm6Select Int String
		 | TmUnite String String
         | TmArr1 String Int
         | TmArr2 String Int
         | TmApp1 String String
         | TmApp2 String String
		 | TmApp3 String Int
		 | TmApp4 String Int String
		 | TmPreach String
		 | TmUpdate String Sets Wheres
         | TmDelete String Wheres
         deriving Show

data Sets = Tm1Sets Set Sets
          | Tm2Sets Set
          deriving Show
          
data Set  = TmSet1 Int String
          | TmSet2 Int Int
          | TmSet3 Int Int String
		  deriving Show

data Cols = Tm1Cols Col Cols
          | Tm2Cols Col
          deriving Show

data Col  = TmNullCol Int Int
          | TmCol Int
		  deriving Show

data Wheres = Tm1Wheres Where Wheres
            | Tm2Wheres Where
            deriving Show

data Where  = Tm2Where Int Int
		    | Tm3Where Int Int
		    | Tm4Where Int Int
		    | Tm5Where Int Int
		    | Tm6Where Int Int
		    | Tm7Where Int Int
            | Tm8Where Int
            deriving Show

data Words = TmWords String Words
           | TmWord String
		   deriving Show
}
