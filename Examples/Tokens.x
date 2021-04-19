{ 
module Tokens where 
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
$white+         ; 
  "--".*        ; 
  let           { \p s -> TokenLet p } 
  in            { \p s -> TokenIn p }
  $digit+       { \p s -> TokenInt p (read s) } 
  \=            { \p s -> TokenEq p }
  \+            { \p s -> TokenPlus p }
  \-            { \p s -> TokenMinus p }
  \*            { \p s -> TokenTimes p }
  \/            { \p s -> TokenDiv p }
  \^            { \p s -> TokenExp p }
  \(            { \p s -> TokenLParen p }
  \)            { \p s -> TokenRParen p }
  $alpha [$alpha $digit \_ \’]*   { \p s -> TokenVar p s } 

{ 
-- Each action has type :: AlexPosn -> String -> Token 
-- The token type: 
data Token = 
  TokenLet AlexPosn         | 
  TokenIn AlexPosn          | 
  TokenInt AlexPosn Int     |
  TokenVar AlexPosn String  | 
  TokenEq AlexPosn          |
  TokenPlus AlexPosn        |
  TokenMinus AlexPosn       |
  TokenTimes AlexPosn       |
  TokenDiv AlexPosn         |
  TokenExp AlexPosn         |
  TokenLParen AlexPosn      |
  TokenRParen AlexPosn      
  deriving (Eq,Show) 

tokenPosn :: Token -> String
tokenPosn (TokenLet (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenIn (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenInt (AlexPn _ l c) n) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenVar (AlexPn _ l c) x) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenEq (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenPlus (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenMinus (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenTimes (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenDiv (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenExp (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenLParen (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
tokenPosn (TokenRParen (AlexPn _ l c)) = show (l) ++ ":" ++ show (c)
}