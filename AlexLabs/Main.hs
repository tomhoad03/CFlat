
module Main (main) where 

import Tokens

import System.IO
import System.Environment

main :: IO ()
main = do args <- getArgs
          file <- openFile (head args) ReadMode
          text <- hGetContents file
          print (alexScanTokens text)