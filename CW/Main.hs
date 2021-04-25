module Main where

import Tokens ( Token, alexScanTokens )
import Grammar ( parseCFlat, Exp(..), Ofs(..))
import System.IO ( stderr, hPutStr )
import System.Environment ( getArgs )
import System.FilePath ( takeExtension, splitExtension )
import System.Directory ( listDirectory, getDirectoryContents, getCurrentDirectory, exeExtension )
import Control.Exception ( catch, ErrorCall )
import System.IO.Unsafe (unsafePerformIO)
import Data.List ( sort, elemIndex, elemIndices, intercalate )

-- alex Tokens.x
-- happy Grammar.y
-- ghc -o csvql Main.hs
-- ./csvql pr1.cql

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
                       print result



-- read csv from list of loaded csvs
readCsv :: Eq a => a -> [(a, p)] -> p
readCsv a csvs = readMaybe (lookup a csvs)
                   where readMaybe (Just a) = a
                         readMaybe Nothing = error "Nothing"


-- break a csv into its columns
commaSplit :: [String] -> String -> [String]
commaSplit xs s = readMaybe (elemIndex ',' s)
                    where readMaybe (Just a) = commaSplit (xs ++ [take a s]) (drop (a + 1) s)
                          readMaybe Nothing = xs ++ [s]



-- interpret the parsed file
interpreter :: Exp -> [(String, [String])] -> [String]

-- load A = "A.csv"
interpreter (TmLoad a b c) csvs = do let contents = readFile (b ++ ".csv")
                                     let splitContents = lines $ unsafePerformIO contents -- kinda illegal
                                     interpreter c (csvs ++ [(b, splitContents)])

-- var C = ...
interpreter (TmVar a b c) csvs = do let selection = interpreter b csvs
                                    interpreter c (csvs ++ [(a, selection)])

-- select A
interpreter (Tm1Select a) csvs = readCsv a csvs -- selection as simple assignment

-- unite A B
interpreter (Tm1Unite a b) csvs = do let aCsv = readCsv a csvs
                                     let bCsv = readCsv b csvs
                                     concatMap (\x -> map ((x ++ ",") ++ ) bCsv) aCsv

-- unite A B where (1 of A >= 1 of B)                         
interpreter (Tm2Unite a b c) csvs = do let aCsv = readCsv a csvs
                                       let bCsv = readCsv b csvs
                                       let cCsv = concatMap (\x -> map ((x ++ ",") ++ ) bCsv) aCsv
                                       let cols = map (\x -> a ++ show x) [1..(1 + length (filter (== ',') $ head aCsv))] -- column header names
                                                  ++ map (\x -> b ++ show x) [1..(1 + length (filter (== ',') $ head bCsv))]
                                       whereInterpreter cCsv cols c

-- preach C                    
interpreter (TmPreach a) csvs = sort $ readCsv a csvs -- end of program, output sorted lexicographically



-- filter a csv
whereInterpreter :: [String] -> [String] -> Ofs -> [String]

-- breaking down conditions
whereInterpreter csv cols (Tm1Of a b) = whereInterpreter (whereInterpreter csv cols a) cols b

-- base cases
whereInterpreter csv cols c = do let splitCsv = map (commaSplit []) csv
                                 map (intercalate ",") (filterCsv splitCsv cols c)
                                   where filterCsv splitCsv cols (Tm2Of p q r s) = filter (\x -> x !! a == x !! b) splitCsv
                                          where
                                               a = head $ elemIndices (q ++ show p) cols
                                               b = head $ elemIndices (s ++ show r) cols
                                         filterCsv splitCsv cols (Tm3Of p q r s) = filter (\x -> x !! a >= x !! b) splitCsv
                                           where
                                               a = head $ elemIndices (q ++ show p) cols
                                               b = head $ elemIndices (s ++ show r) cols
                                         filterCsv splitCsv cols (Tm4Of p q r s) = filter (\x -> x !! a <= x !! b) splitCsv
                                           where
                                               a = head $ elemIndices (q ++ show p) cols
                                               b = head $ elemIndices (s ++ show r) cols
                                         filterCsv splitCsv cols (Tm5Of p q r s) = filter (\x -> x !! a > x !! b) splitCsv
                                           where
                                               a = head $ elemIndices (q ++ show p) cols
                                               b = head $ elemIndices (s ++ show r) cols
                                         filterCsv splitCsv cols (Tm6Of p q r s) = filter (\x -> x !! a < x !! b) splitCsv
                                           where
                                               a = head $ elemIndices (q ++ show p) cols
                                               b = head $ elemIndices (s ++ show r) cols
                                         filterCsv splitCsv cols (Tm7Of p q r s) = filter (\x -> x !! a /= x !! b) splitCsv
                                           where
                                               a = head $ elemIndices (q ++ show p) cols
                                               b = head $ elemIndices (s ++ show r) cols 