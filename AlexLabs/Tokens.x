{ 
module Tokens (Token(..), AlexPosn(..), alexScanTokens, token_posn) where 
}

%wrapper "posn"

$digit = 0-9         -- digits 
$alpha = [a-zA-Z]    -- alphabetic characters

tokens :-
  $white+       ; 
  "--".*        ; 
  let           { tok (\p s -> Let p) } 
  in            { tok (\p s -> In p) }
  $digit+       { tok (\p s -> Int p (read s)) } 
  \=            { tok (\p s -> Eq p) }
  \+            { tok (\p s -> Plus p) }
  \-            { tok (\p s -> Minus p) }
  \*            { tok (\p s -> Times p) }
  \/            { tok (\p s -> Div p) }
  \(            { tok (\p s -> LParen p) }
  \)            { tok (\p s -> RParen p) }
  \^            { tok (\p s -> Exp p) }
  $alpha [$alpha $digit \_ \’]*   { tok (\p s -> Var p s) } 
{ 

-- Action helpers
tok f p s = f p s

-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  Let AlexPosn         | 
  In AlexPosn          | 
  Int AlexPosn Int     |
  Var AlexPosn String  | 
  Eq AlexPosn          |
  Plus AlexPosn        |
  Minus AlexPosn       |
  Times AlexPosn       |
  Div AlexPosn         |
  LParen AlexPosn      |
  RParen AlexPosn      |
  Exp AlexPosn       
  deriving (Eq,Show)

token_posn (Let p) = p
token_posn (In p) = p
token_posn (Int p _) = p
token_posn (Var p _) = p
token_posn (Eq p) = p
token_posn (Plus p) = p
token_posn (Minus p) = p
token_posn (Times p) = p
token_posn (Div p) = p
token_posn (LParen p) = p
token_posn (RParen p) = p
token_posn (Exp p) = p
}