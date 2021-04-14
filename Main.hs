module Main where

import Tokens
import Grammar
import System.IO
import System.Environment
import Control.Exception

main :: IO ()
main = catch lex' lexError

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