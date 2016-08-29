module Main where

import System.Environment

import Lib (parse)

readExpr :: String -> String
readExpr input = case parse input of
    Left err -> "No match: " ++ show err
    Right val -> "Found value"

main :: IO ()
main = do
	 (expr:_) <- getArgs
	 putStrLn (readExpr expr)
