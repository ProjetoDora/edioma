module Edioma (Expr(..), eval) where

data Expr
  = Soma Expr Expr
  | Mult Expr Expr
  | Menos Expr Expr
  | Lit Int
  deriving (Show, Read, Eq)

eval :: Expr -> Expr
eval (Lit a) = Lit a
eval (Soma a b) = case (eval a, eval b) of
  (Lit a', Lit b') -> Lit (a' + b')
  _ -> error "Cannot happen"
eval (Mult a b) = case (eval a, eval b) of
  (Lit a', Lit b') -> Lit (a' * b')
  _ -> error "Cannot happen"
eval (Menos a b) = case (eval a, eval b) of
  (Lit a', Lit b') -> Lit (a' - b')
  _ -> error "Cannot happen"
