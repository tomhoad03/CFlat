{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
    let { TokenLet _ } 
    in  { TokenIn _ } 
    int { TokenInt _ $$ } 
    var { TokenVar _ $$ } 
    '=' { TokenEq _ } 
    '+' { TokenPlus _ } 
    '-' { TokenMinus _ } 
    '*' { TokenTimes _ } 
    '/' { TokenDiv _ } 
    '^' { TokenExp _ }
    '(' { TokenLParen _ } 
    ')' { TokenRParen _ } 

%right in 
%left '+' '-' 
%left '*' '/'
%left '^' 
%left NEG 
%% 
Exp : let var '=' Exp in Exp { Let $2 $4 $6 } 
    | Exp '+' Exp            { Plus $1 $3 } 
    | Exp '-' Exp            { Minus $1 $3 } 
    | Exp '*' Exp            { Times $1 $3 } 
    | Exp '/' Exp            { Div $1 $3 } 
    | Exp '^' Exp            { Expo $1 $3 }
    | '(' Exp ')'            { $2 } 
    | '-' Exp %prec NEG      { Negate $2 } 
    | int                    { Int $1 } 
    | var                    { Var $1 } 
    
{ 
parseError :: [Token] -> a
parseError _ = error "Parse Error" 
parseError (x : xs) = error ("Parse error at line:column " ++ (tokenPosn x))
data Exp = Let String Exp Exp 
         | Plus Exp Exp 
         | Minus Exp Exp 
         | Times Exp Exp 
         | Div Exp Exp
         | Expo Exp Exp
         | Negate Exp
         | Int Int 
         | Var String 
         deriving Show 
} 