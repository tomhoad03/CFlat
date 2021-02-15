module Module where

import Data.List ( maximumBy )
import Data.Maybe ()
import System.IO
    ( hClose,
      openFile,
      hGetContents,
      hPutStrLn,
      IOMode(ReadMode, WriteMode) )
import Data.Function (on)

-- Main function
main :: IO ()
main = do print "Hello World!"

 -- Max int value - 2^63
maxInt :: Int
maxInt = maxBound :: Int

-- Test function
testListStuff :: IO ()
testListStuff = listStuff [1,2,3,4,5]

-- List functions
listStuff :: (Show a, Num a) => [a] -> IO ()
listStuff list = do print (head list) -- Take the first element
                    print (tail list) -- Take the last element
                    print (length list) -- Length of the list
                    print (list !! 3) -- Take the nth element
                    print (take 3 list) -- Take the first n elements
                    print (drop 3 list) -- Remove the first n elements
                    print (list ++ [6,7,8,9,10]) -- Append another list
                    print (sum list) -- Sum the list elements
                    print (product list) -- Product the list elements
                    print (reverse list) -- Reverse the list
                    -- print (repeat 1) -- An infinite list of identical elements

-- Curried functions
add :: Int -> (Int -> Int)
add x y = x + y

mult :: Int -> (Int -> (Int -> Int))
mult x y z = x*y*z

-- Polymorphic functions (functions on any types)
polyStuff :: IO ()
polyStuff = do print (fst ("Hello World!", 5))
               print (zip [1,2,3] ['A', 'B', 'C'])
               print (id 7)

-- Class constraints (used to narrow down types)
add' :: Num a => a -> a -> a
add' x y = x + y
-- Eq, Ord, Show, Read, Num, Integral, Fractional

-- Functions
abs' :: (Ord a, Num a) => a -> a
abs' n | n >= 0 = n
      | otherwise = -n

testQuadRoots :: IO ()
testQuadRoots = print (quadRoots 1 (-5) 4)

quadRoots :: Float -> Float -> Float -> String
quadRoots a b c | a == 0 = error "Not quadratic"
                | discriminant == 0 = "Root is " ++ show centre
                | otherwise = "Upper root is "
                              ++ show (centre + offset)
                              ++ " and Lower Root is "
                              ++ show (centre - offset)
  where
    discriminant = b*b-4*a*c
    centre = -b/2*a
    offset = sqrt discriminant/2*a

-- Pattern matching
not' :: Bool -> Bool
not' False = True
not' True = False

nonZero :: Int -> Bool
nonZero 0 = False 
nonZero _ = True

-- Composite pattern
fetch :: Int -> [a] -> a
fetch _ [] = error "Empty List"
fetch 0 (x:_) = x
fetch n (_:xs) = fetch (n-1) xs

-- List comprehensions
comprehensionStuff :: IO ()
comprehensionStuff = do print [1..5]
                        print ['A'..'F']
                        print [ (x, y) | x <- [1..3], y <- [4..6]]
                        print [ (x, y) | x <- [1..3], y <- [x..3]]
                        print [ x | x <- [1..10], even x]
                        print (takeWhile (<= 20) [2,4..])

-- Recursion
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)

-- Direct vs tail recursion
replicate' :: Int -> a -> [a]
replicate' 0 x = []
replicate' n x = x : replicate' (n-1) x

replicate'' :: Int -> a -> [a] -> [a]
replicate'' 0 x acc = acc
replicate'' n x acc = replicate'' (n-1) x (x:acc)

-- Higher order
twice :: (a -> a) -> a -> a
twice f a = f (f a)

-- Map
doubleList :: [Integer] -> [Integer]
doubleList = map (2*)

squareList :: [Integer] -> [Integer]
squareList = map (^2)

negateList :: [Integer] -> [Integer]
negateList = map (0-)

-- Filter
filterStuff :: IO ()
filterStuff = do print (filter even [1,2,3,4,5])
                 print (filter (>2) [1,2,3,4,5])

-- Function compositions
headDoubles :: Num a => [a] -> a
headDoubles xs = head $ map (*2) xs

odd' :: Integer -> Bool
odd' = not . even
twice' :: (b -> b) -> b -> b
twice' f = f . f
sumsqeven :: [Integer] -> Integer
sumsqeven = sum . map (^2) . filter even

-- Folding lists
foldStuff :: IO ()
foldStuff = do print (foldr (-) 0 [1,2,3])
               print (foldl (-) 0 [1,2,3])

-- Maybe
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead xs = Just (head xs)

-- Lambda
lambdaDouble :: [Integer]
lambdaDouble = map (\x -> x * 2) [1..10]

-- If statements
ifDouble :: Integral a => a -> a
ifDouble x = if odd x then x else x * 2

caseDouble :: (Eq a, Num a, Num p) => a -> p
caseDouble x = case x of
      1 -> 2
      3 -> 6
      5 -> 10
      _ -> 100

-- Defining types
type Pos = (Int, Int)

origin :: Pos
origin = (0, 0)

moveLeft :: Pos -> Pos
moveLeft (x, y) = (x-1, y)

data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving Show

isWeekend :: Day -> Bool
isWeekend Sat = True 
isWeekend Sun = True
isWeekend _ = False

isWeekday :: Day -> Bool
isWeekday = not . isWeekend

dayString :: Show a => a -> String
dayString day = "The day is: " ++ show day

{-
  :t operator will show the classes it works on
  try :t (+), :t (++) and :t (^)
-}

-- IO
sayHello = do putStrLn "Whats your name?"
              name <- getLine
              putStrLn $ "Hello " ++ name

-- Files
writeToFile = do theFile <- openFile "Test.txt" WriteMode
                 hPutStrLn theFile "Hello World!"
                 hClose theFile

readFromFile = do theFile <- openFile "Test.txt" ReadMode
                  contents <- hGetContents theFile
                  putStr contents
                  hClose theFile

-- Fibonacci
fib :: [Int]
fib = take 100 (1 : 1 : [a + b | (a, b) <- zip fib (tail fib)])

-- Exam practice
or' :: [Bool] -> Bool
or' (x:xs) | x == True = True
           | length xs == 0 = False
           | otherwise = or' xs

expMap :: (a -> a) -> [a] -> [a]
expMap f [] = []
expMap f (x:xs) = f x : expMap (f.f) xs

shorter :: [a1] -> [a2] -> Bool
shorter [] [] = False
shorter xs [] = False
shorter [] ys = True
shorter (x:xs) (y:ys) = shorter xs ys

riffle :: [a] -> [a] -> [a]
riffle xs [] = xs
riffle [] ys = ys
riffle (x:xs) (y:ys) = [x] ++ [y] ++ riffle xs ys

halve :: Fractional a => a -> a
halve x = x / 2

-- Exercise sheet 1
-- Zip two equal length lists into list pairs
zipL :: [a] -> [a] -> [[a]]
zipL (x:xs) (y:ys) | length xs /= length ys = error "The lists are not of equal lengths!"
                   | null xs = [[x, y]]
                   | otherwise = [x, y] : zipL xs ys

-- Unzip a list of list pairs
unzipL :: [[a]] -> ([a], [a])
unzipL list = (map (!! 0) list, map (!! 1) list)

-- Unzip two lists (of any length) into list pairs
zipL' :: [a] -> [a] -> [[a]]
zipL' (x:xs) (y:ys) | null xs && null ys = [[x, y]]
                   | null xs && not (null ys) = [x, y] : [ [a] | a <- ys]
                   | not (null xs) && null ys = [x, y] : [ [a] | a <- xs]
                   | otherwise = [x, y] : zipL xs ys
-- It is not possible to create the inverse function (we don't know which list the single values belong too)

-- Zip any number of lists (of any length)
multiZipL :: [[a]] -> [[a]]
multiZipL [] = []
multiZipL lists | maxListLength lists > 1 = map (!! 0) lists : multiZipL (filter (not . null) (map tail lists))
                | otherwise = [map (!! 0) lists]

-- Returns the length of the longest list in a list of lists.
maxListLength :: [[a]] -> Int
maxListLength lists = length $ maximumBy (compare `on` length) lists