module Main where

import Tokens ( Token, alexScanTokens )
import Grammar ( parseCalc, Exp(..))
import System.IO ( stderr, hPutStr )
import System.Environment ( getArgs )
import Control.Exception ( catch, ErrorCall )

-- read in the program from the cmd args
main :: IO ()
main = do (fileName : _) <- getArgs
          file <- readFile fileName
          catch (lexer file) errorCall

-- lex the file
lexer :: String -> IO ()
lexer file = do let lexedFile = alexScanTokens file
                catch (parser lexedFile) errorCall

-- parse the lexed file
parser :: [Token] -> IO ()
parser lexedFile = do let parsedFile = parseCalc lexedFile
                      catch (solver parsedFile) errorCall

-- catch lexing and parsing errors
errorCall :: ErrorCall -> IO ()
errorCall e = do let err = show e
                 hPutStr stderr ("Error: " ++ err)
                 return ()

-- solve the programs
solver :: Exp -> IO ()
solver parsedFile = do a <- readFile "A.csv"
                       b <- readFile "B.csv"
                       putStrLn a
                       putStrLn b
                       print (interpreter parsedFile)

-- interpret the parsed file
interpreter :: Exp -> String 
interpreter (Let a b c) = "( let " ++ a ++ " = " ++ interpreter b ++ " in " ++ interpreter c ++ ") "
interpreter (Expo a b) = "( " ++ interpreter a ++ " ^ "  ++ interpreter b ++ " )"
interpreter (Int a) = show a
interpreter (Var a) = a