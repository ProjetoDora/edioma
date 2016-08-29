module Lib (parse) where

import Edioma (Expr(..))

{- symbol :: Parser Char -}
{- symbol = oneOf "[a-zA-z]" -}

{- parse :: String -> Either -}
parse s = case parseExpr s of
	Lit x -> Right x
	_ -> Left "Não parseou!!"

parseExpr :: String -> Expr
parseExpr a = Lit 2
