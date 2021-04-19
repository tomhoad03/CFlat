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

Exp : int { TmInt $1 }
      var word { TmVar $2 }
	  select '(' Exps ')' { TmSelect $3 } --need to reduce to only 'Of's
	  
Exps : Exp { [$1] }
     | Exps ',' Exp { $3 : $1 }