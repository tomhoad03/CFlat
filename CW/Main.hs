module Main where

import Tokens ( Token, alexScanTokens )
import Grammar ( parseCFlat, Exp(..), Wheres(..), Where(..), Cols(..), Col(..), Words(..))
import System.IO ( stderr, hPutStr )
import System.Environment ( getArgs )
import System.FilePath ( takeExtension, splitExtension )
import System.Directory ( listDirectory, getDirectoryContents, getCurrentDirectory, exeExtension )
import Control.Exception ( catch, ErrorCall )
import System.IO.Unsafe (unsafePerformIO)
import Data.List ( sortBy, elemIndex, elemIndices, intercalate, transpose, delete, nub )

-- alex Tokens.x
-- happy Grammar.y
-- ghc -o csvql Main.hs
-- ./csvql pr1.cql (exclude the ./ for a regular terminal)

-- csvs stored as [("X", [["Hello", "World"], ["Goodbye", "Earth"]]), ("Y", [["Haskell", "Java", ["C++", "CFlat"]])

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
errorCall e = do hPutStr stderr ("Error: " ++ show e)
                 return ()



-- solve a program
solver :: Exp -> IO ()
solver parsedFile = mapM_ (putStrLn . intercalate ",") (interpreter parsedFile [])



-- read csv from list of loaded csvs
readCsv :: Eq a => a -> [(a, p)] -> p
readCsv csvName csvs = readMaybe (lookup csvName csvs)
                         where readMaybe (Just a) = a
                               readMaybe Nothing = error "Nothing"



-- break a csv into its columns
commaSplit :: [String] -> String -> [String]
commaSplit xs s = readMaybe (elemIndex ',' s)
                    where readMaybe (Just a) = commaSplit (xs ++ [take a s]) (drop (a + 1) s)
                          readMaybe Nothing = xs ++ [s]



-- interpret the parsed file
interpreter :: Exp -> [(String, [[String]])] -> [[String]]

-- load a table (kinda illegal using unsafe IO)
-- 'load A = "A.csv"'
interpreter (TmLoad varName csvName program) csvs = do let contents = readFile (csvName ++ ".csv")
                                                       let splitContents = map (commaSplit []) (lines $ unsafePerformIO contents)
                                                       interpreter program (csvs ++ [(varName, splitContents)])
                                                         where commaSplitxs xs s = readMaybe (elemIndex ',' s)
                                                                                     where readMaybe (Just a) = commaSplit (xs ++ [take a s]) (drop (a + 1) s)
                                                                                           readMaybe Nothing = xs ++ [s]

-- add another table to another
-- 'A add B'
interpreter (Tm1Add csvNameA csvNameB) csvs = readCsv csvNameA csvs ++ readCsv csvNameB csvs

-- add another table to another
-- 'A add (a,b,c,d)'
interpreter (Tm2Add csvNameA record) csvs = readCsv csvNameA csvs ++ [readRecord record []]
                                              where readRecord (TmWords s b) xs = xs ++ [s] ++ readRecord b xs
                                                    readRecord (TmWord s) xs = [s]

-- variable assignment
-- 'var C = ...'
interpreter (TmVar varName csvName program) csvs = interpreter program (csvs ++ [(varName, interpreter csvName csvs)])

-- selection as simple assignment
-- select all of A
interpreter (Tm1Select csvName) csvs = readCsv csvName csvs

-- select certain cols from a table
-- 'select (1, 2) of A'
interpreter (Tm2Select cols csvName) csvs = transpose (readCols cols (readCsv csvName csvs) [])
                                              where readCols (Tm1Cols colsA colsB) csv xs = xs ++ readCol colsA csv xs ++ readCols colsB csv xs                                              
                                                    readCols (Tm2Cols colsA) csv xs = readCol colsA csv xs
                                                    readCol (TmCol x) csv xs = [map (!! (x - 1)) csv]
                                                    readCol (TmNullCol col nullColl) csv xs = do [[ a | a <- zipWith (curry nullCase) (map (!! (col - 1)) csv) (map (!! (nullColl - 1)) csv)]]
                                                                                                    where nullCase ("", y) = y
                                                                                                          nullCase (x, y) = x

-- select all cols from a table where certain cols match a condition
-- 'select all of A where (1 == 2)'
interpreter (Tm3Select csvName wheres) csvs = whereInterpreter (readCsv csvName csvs) wheres

-- select certain cols from a table where certain cols match a condition
-- 'select (1, 2) of A where (1 == 2)'
interpreter (Tm4Select cols csvName wheres) csvs = transpose (readCols cols (whereInterpreter (readCsv csvName csvs) wheres) [])
                                                     where readCols (Tm1Cols colsA colsB) csv xs = xs ++ readCol colsA csv xs ++ readCols colsB csv xs                                                    
                                                           readCols (Tm2Cols colsA) csv xs = readCol colsA csv xs
                                                           readCol (TmCol x) csv xs = [map (!! (x - 1)) csv]
                                                           readCol (TmNullCol col nullColl) csv xs = do [[ a | a <- zipWith (curry nullCase) (map (!! (col - 1)) csv) (map (!! (nullColl - 1)) csv)]]
                                                                                                           where nullCase ("", y) = y
                                                                                                                 nullCase (x, y) = x

-- select distinct values from a table
-- 'select distinct (1,2) of A'
interpreter (Tm5Select cols csvName) csvs = nub (interpreter (Tm2Select cols csvName) csvs)

-- select the top n records from a table
-- 'select top 4 of A'
interpreter (Tm6Select n csvName) csvs = take n (interpreter (Tm1Select csvName) csvs)

-- sort a table lexicographically
-- 'arrange A asc'
interpreter (TmArr1 csvName i) csvs = sortBy (\xs ys -> compare (xs !! (i - 1)) (ys !! (i - 1))) (readCsv csvName csvs)

-- sort a table reverse lexicographically
 -- 'arrange A desc'
interpreter (TmArr2 csvName i) csvs = sortBy (\xs ys -> compare (ys !! (i - 1)) (xs !! (i - 1))) (readCsv csvName csvs)

-- append two tables together
-- 'append (A C)'
interpreter (TmApp1 csvNameA csvNameB) csvs = zipWith (++) (readCsv csvNameA csvs) (readCsv csvNameB csvs)

-- append a column to a table
-- 'append (A "hello")'
interpreter (TmApp2 csvName s) csvs = map (++[s]) (readCsv csvName csvs)


-- append a column to a table
-- 'append (A "0")'
interpreter (TmApp3 csvName i) csvs = map (++[show i]) (readCsv csvName csvs)

-- append a column to a table
-- 'append (A "0b")'
interpreter (TmApp4 csvName i s) csvs = map (++[show i ++ s]) (readCsv csvName csvs)

-- merge two tables (for each, for each merge)
-- 'unite A B'
interpreter (TmUnite csvNameA csvNameB) csvs = concatMap (\y -> map (++ y) (readCsv csvNameA csvs)) (readCsv csvNameB csvs)

-- output a table
-- 'preach C'
interpreter (TmPreach csvName) csvs = readCsv csvName csvs

-- filter a csv
whereInterpreter :: [[String]] -> Wheres -> [[String]]

whereInterpreter csv wheres = readWheres wheres csv
                                where readWheres (Tm1Wheres whereA whereB) csv = readWheres whereB (filterCsv whereA csv)
                                      readWheres (Tm2Wheres whereA) csv = filterCsv whereA csv
                                      filterCsv (Tm2Where a b) csv = filter (\x -> x !! (a - 1) == x !! (b - 1)) csv
                                      filterCsv (Tm3Where a b) csv = filter (\x -> x !! (a - 1) >= x !! (b - 1)) csv
                                      filterCsv (Tm4Where a b) csv = filter (\x -> x !! (a - 1) <= x !! (b - 1)) csv
                                      filterCsv (Tm5Where a b) csv = filter (\x -> x !! (a - 1) > x !! (b - 1)) csv
                                      filterCsv (Tm6Where a b) csv = filter (\x -> x !! (a - 1) < x !! (b - 1)) csv
                                      filterCsv (Tm7Where a b) csv = filter (\x -> x !! (a - 1) /= x !! (b - 1)) csv
                                      filterCsv (Tm8Where a) csv = filter (\x -> x !! (a - 1) /= "") csv