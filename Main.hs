module Main where

import Tokens ( Token, alexScanTokens )
import Grammar ( parseCalc )
import System.IO ( stderr, hPutStr )
import System.Environment ( getArgs )
import Control.Exception ( catch, ErrorCall )

main :: IO ()
main = do a <- readFile "A.csv"
          b <- readFile "B.csv"
          putStrLn a
          putStrLn b
          catch lex' lexError

lex' :: IO ()
lex' = do (fileName : _) <- getArgs
          file <- readFile fileName
          putStrLn ("Before lexing: " ++ file)
          let lexedFile = alexScanTokens file
          putStrLn ("After lexing: " ++ show lexedFile)
          catch (parse lexedFile) parError

parse :: [Token] -> IO ()
parse lexedFile = do let parsedFile = parseCalc lexedFile
                     putStrLn ("After parsing: " ++ show parsedFile)

lexError :: ErrorCall -> IO ()
lexError e = do let err = show e
                hPutStr stderr ("Error: " ++ err)
                return()

parError :: ErrorCall -> IO ()
parError e = do let err = show e
                hPutStr stderr ("Error: " ++ err)
                return()