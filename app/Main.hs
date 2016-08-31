module Main where

import System.Environment

import Lib (parse)

readExpr :: String -> String
readExpr input = parse input

main :: IO ()
main = do
	 (expr:_) <- getArgs
	 putStrLn (readExpr expr)
