module Lib (Lib.parse) where

import Edioma (Expr(..), eval)
import Text.ParserCombinators.Parsec
import Data.Char (digitToInt)

{- symbol :: Parser Char -}
{- symbol = oneOf "[a-zA-z]" -}

{- parse :: String -> Either -}
parse s = case Text.ParserCombinators.Parsec.parse parseExpr "expression" s of
	Left err -> "No match: " ++ show err
	Right x -> show x

parseExpr :: Parser Expr
parseExpr = parseSoma <|> parseLit

parseSoma :: Parser Expr
parseSoma = do
  char '('
  x <- parseExpr
  char '+'
  y <- parseExpr
  char ')'
  return $ Soma x y


parseLit :: Parser Expr
parseLit = do
	x <- digit
	return $ Lit (digitToInt x)
