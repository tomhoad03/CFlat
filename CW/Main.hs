module Main where

import Tokens ( Token, alexScanTokens )
import Grammar ( parseCFlat, Exp(..))
import System.IO ( stderr, hPutStr )
import System.Environment ( getArgs )
import System.FilePath ( takeExtension, splitExtension )
import System.Directory ( listDirectory, getDirectoryContents, getCurrentDirectory, exeExtension )
import Control.Exception ( catch, ErrorCall )
import System.IO.Unsafe (unsafePerformIO)

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
solver parsedFile = do putStrLn (interpreter parsedFile [["Hello", "World"], ["Haskell", "Java"]])

-- parses a csv file
readCsv :: String -> IO [String]
readCsv fileName = do a <- readFile (fileName ++ ".csv")
                      let csv = lines a
                      return csv

-- interpret the parsed file
interpreter :: Exp -> [[String]] -> String
interpreter (TmInt a) xs = show a
interpreter (TmWord a) xs = a
interpreter (TmLoad a b c) xs = do let contents = readFile (b ++ ".csv")
                                   let splitContents = lines $ unsafePerformIO contents
                                   "load " ++ a ++ " = " ++ b ++ ".csv" ++ interpreter c (xs ++ [splitContents])
interpreter (TmVar a b c) xs = a ++ " = " ++ interpreter b xs ++ interpreter c xs
interpreter (TmPreach a) xs = show $ last xs