module Main where

import Tokens ( Token, alexScanTokens )
import Grammar ( parseCFlat, Exp(..), Wheres(..), Cols(..))
import System.IO ( stderr, hPutStr )
import System.Environment ( getArgs )
import System.FilePath ( takeExtension, splitExtension )
import System.Directory ( listDirectory, getDirectoryContents, getCurrentDirectory, exeExtension )
import Control.Exception ( catch, ErrorCall )
import System.IO.Unsafe (unsafePerformIO)
import Data.List ( sort, elemIndex, elemIndices, intercalate, transpose, delete )

-- alex Tokens.x
-- happy Grammar.y
-- ghc -o csvql Main.hs
-- ./csvql pr1.cql (exclude the ./ for a regular terminal)

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
                       -- print result



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
interpreter :: Exp -> [(String, [String])] -> [String]

-- load a table
-- 'load A = "A.csv"'
interpreter (TmLoad varName csvName program) csvs = do let contents = readFile (csvName ++ ".csv")
                                                       let splitContents = lines $ unsafePerformIO contents -- kinda illegal
                                                       interpreter program (csvs ++ [(varName, splitContents)])

-- variable assignment
-- 'var C = ...'
interpreter (TmVar varName csvName program) csvs = do let selection = interpreter csvName csvs
                                                      interpreter program (csvs ++ [(varName, selection)])

-- select all cols from a table
-- 'select all of A'
interpreter (Tm1Select csvName) csvs = readCsv csvName csvs

-- select certain cols from a table
-- 'select (1, 2) of A'
interpreter (Tm2Select cols csvName) csvs = do let csv = readCsv csvName csvs
                                               let splitCsv = map (commaSplit []) csv
                                               let intCols = readCols cols []
                                               map (intercalate ",") (transpose (map (\x -> map (!! x) splitCsv) intCols))
                                                 where readCols (TmCols a b) xs = xs ++ readCols a xs ++ readCols b xs
                                                       readCols (TmCol x) xs = [x - 1]

-- select all cols from a table where certain cols match a condition
-- 'select all of A where (1 == 2)'
interpreter (Tm3Select csvName wheres) csvs = do let csv = readCsv csvName csvs
                                                 whereInterpreter csv wheres

-- select certain cols from a table where certain cols match a condition
-- 'select (1, 2) of A where (1 == 2)'
interpreter (Tm4Select cols csvName wheres) csvs = do let csv = readCsv csvName csvs
                                                      let whereCsv = whereInterpreter csv wheres
                                                      let splitCsv = map (commaSplit []) whereCsv
                                                      let intCols = readCols cols []
                                                      map (intercalate ",") (transpose (map (\x -> map (!! x) splitCsv) intCols))
                                                        where readCols (TmCols a b) xs = xs ++ readCols a xs ++ readCols b xs
                                                              readCols (TmCol x) xs = [x - 1]

-- sort a table lexicographically
-- 'arrange A asc'
interpreter (Tm1Arrange csvName program) csvs = do let csv = readCsv csvName csvs
                                                   let sortedCsv = sort csv
                                                   interpreter program (delete (csvName, csv) csvs ++ [(csvName, sortedCsv)])

-- sort a table reverse lexicographically
 -- 'arrange A desc'
interpreter (Tm2Arrange csvName program) csvs = do let csv = readCsv csvName csvs
                                                   let sortedCsv = reverse $ sort csv
                                                   interpreter program (delete (csvName, csv) csvs ++ [(csvName, sortedCsv)])                            

-- merge two tables (for each, for each merge)
-- 'unite A B'
interpreter (TmUnite csvNameA csvNameB) csvs = do let aCsv = readCsv csvNameA csvs
                                                  let bCsv = readCsv csvNameB csvs
                                                  concatMap (\x -> map ((x ++ ",") ++ ) bCsv) aCsv

-- output a table
-- 'preach C'                   
interpreter (TmPreach csvName) csvs = readCsv csvName csvs



-- filter a csv
whereInterpreter :: [String] -> Wheres -> [String]

-- breaking down where conditions
whereInterpreter csv (Tm1Where where1 where2) = whereInterpreter (whereInterpreter csv where1) where2

-- filter cases
whereInterpreter csv wheres = do let splitCsv = map (commaSplit []) csv
                                 map (intercalate ",") (filterCsv splitCsv wheres)
                                   where filterCsv splitCsv (Tm2Where a b) = filter (\x -> x !! (a - 1) == x !! (b - 1)) splitCsv
                                         filterCsv splitCsv (Tm3Where a b) = filter (\x -> x !! (a - 1) >= x !! (b - 1)) splitCsv
                                         filterCsv splitCsv (Tm4Where a b) = filter (\x -> x !! (a - 1) <= x !! (b - 1)) splitCsv
                                         filterCsv splitCsv (Tm5Where a b) = filter (\x -> x !! (a - 1) > x !! (b - 1)) splitCsv
                                         filterCsv splitCsv (Tm6Where a b) = filter (\x -> x !! (a - 1) < x !! (b - 1)) splitCsv
                                         filterCsv splitCsv (Tm7Where a b) = filter (\x -> x !! (a - 1) /= x !! (b - 1)) splitCsv
                                         filterCsv splitCsv (Tm8Where a) = filter (\x -> x !! (a - 1) /= []) splitCsv