module Main where

import Tokens ( Token, alexScanTokens )
import Grammar ( parseCalc, Exp(..))
import System.IO ( stderr, hPutStr )
import System.Environment ( getArgs )
import System.FilePath ( takeExtension )
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
parser lexedFile = do let parsedFile = parseCalc lexedFile
                      catch (solver parsedFile) errorCall

-- catch lexing and parsing errors
errorCall :: ErrorCall -> IO ()
errorCall e = do let err = show e
                 hPutStr stderr ("Error: " ++ err)
                 return ()

-- solve the programs
solver :: Exp -> IO ()
solver parsedFile = do files <- scanner
                       let csvs = map readFile files
                       mapM_ converter csvs
                       putStrLn (interpreter parsedFile)

-- looks for csv files in the cd
scanner :: IO [FilePath]
scanner = do cd <- getCurrentDirectory
             files <- getDirectoryContents cd
             return (filter (\x -> takeExtension x == ".csv") files)

-- reads the csv files
reader :: Monad m => [FilePath] -> m [IO String]
reader csvs = do let files = map readFile csvs
                 return files

-- parses a csv file
converter :: IO String -> IO ()
converter csv = do parseCsv <- csv
                   print $ lines parseCsv

-- interpret the parsed file
interpreter :: Exp -> String 
interpreter (Let a b c) = "( let " ++ a ++ " = " ++ interpreter b ++ " in " ++ interpreter c ++ ")"
interpreter (Plus a b) = "( " ++ interpreter a ++ " + "  ++ interpreter b ++ " )"
interpreter (Minus a b) = "( " ++ interpreter a ++ " - "  ++ interpreter b ++ " )"
interpreter (Times a b) = "( " ++ interpreter a ++ " * "  ++ interpreter b ++ " )"
interpreter (Div a b) = "( " ++ interpreter a ++ " / "  ++ interpreter b ++ " )"
interpreter (Expo a b) = "( " ++ interpreter a ++ " ^ "  ++ interpreter b ++ " )"
interpreter (Negate a) = "-" ++ interpreter a
interpreter (Int a) = show a
interpreter (Var a) = a