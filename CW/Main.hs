module Main where

import Tokens ( Token, alexScanTokens )
import Grammar ( parseCFlat, Exp(..))
import System.IO ( stderr, hPutStr )
import System.Environment ( getArgs )
import System.FilePath ( takeExtension, splitExtension )
import System.Directory ( listDirectory, getDirectoryContents, getCurrentDirectory, exeExtension )
import Control.Exception ( catch, ErrorCall )

-- ghc -o Main Main.hs
-- ./Main pr1.cql

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
parser lexedFile = do let parsedFile = parseCFlat lexedFile
                      catch (solver parsedFile) errorCall

-- catch lexing and parsing errors
errorCall :: ErrorCall -> IO ()
errorCall e = do let err = show e
                 hPutStr stderr ("Error: " ++ err)
                 return ()

-- solve the programs
solver :: Exp -> IO ()
solver parsedFile = do putStrLn (interpreter parsedFile)

-- parses a csv file
readCsv :: String -> IO [String]
readCsv fileName = do a <- readFile (fileName ++ ".csv")
                      let csv = lines a
                      return csv

-- interpret the parsed file
interpreter :: Exp -> String
interpreter (TmInt a) = show a
interpreter (TmWord a) = a
interpreter (TmLoad a b) = "load " ++ a ++ " = " ++ b ++ ".csv"
interpreter (TmVar a b) = a ++ " = " ++ interpreter b