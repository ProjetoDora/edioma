module Lib (Lib.parse) where

import Edioma (Expr(..), eval)
import Text.ParserCombinators.Parsec
import Data.Char (digitToInt)

{- parse :: String -> Either -}
parse s = case Text.ParserCombinators.Parsec.parse parseExpr "expression" s of
	Left err -> "No match: " ++ show err
	Right x -> show (eval x)

parseExpr :: Parser Expr
parseExpr = parseOp
	<|> parseLit

operators = oneOf "+-*"

parseOp :: Parser Expr
parseOp = do
  char '('
  x <- parseExpr
  op <- operators
  y <- parseExpr
  char ')'
  return $ case op of
		'+' -> Soma x y
		'-' -> Menos x y
		'*' -> Mult x y

parseLit :: Parser Expr
parseLit = do
	x <- digit
	return $ Lit (digitToInt x)
