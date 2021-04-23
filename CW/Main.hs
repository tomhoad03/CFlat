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

-- csvs stored as [("X", ["Hello", "World"]), ("Y", ["Haskell", "Java"])]

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

-- solve a program
solver :: Exp -> IO ()
solver parsedFile = do let result = interpreter parsedFile []
                       mapM_ putStrLn result 

-- parses a csv file
readCsv :: String -> IO [String]
readCsv fileName = do a <- readFile (fileName ++ ".csv")
                      let csv = lines a
                      return csv

-- interpret the parsed file
interpreter :: Exp -> [(String, [String])] -> [String]

interpreter (TmLoad a b c) csvs = do let contents = readFile (b ++ ".csv")
                                     let splitContents = lines $ unsafePerformIO contents -- kinda illegal
                                     interpreter c (csvs ++ [(b, splitContents)])

interpreter (TmVar a b c) csvs = do let selection = interpreter b csvs
                                    interpreter c (csvs ++ [(a, selection)])

interpreter (Tm1Select a) csvs = readMaybe (lookup a csvs) -- selection as simple assignment

interpreter (TmUnite a b) csvs = do aCsv <- readMaybe (lookup a csvs)
                                    bCsv <- readMaybe (lookup b csvs)
                                    return (aCsv ++ "," ++ bCsv)
                                    
interpreter (TmPreach a) csvs = readMaybe (lookup a csvs) -- end of program


-- read maybe (used for lookups)
readMaybe :: Maybe p -> p
readMaybe (Just a) = a
readMaybe Nothing = error "Nothing"