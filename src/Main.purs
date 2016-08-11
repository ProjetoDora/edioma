module Main where

import Prelude

import Data.String
import Data.Int
import Data.Maybe

data Tuple a b = Tuple a b

first :: forall a b. Tuple a b -> a
first (Tuple a b) = a

second :: forall a b. Tuple a b -> b
second (Tuple a b) = b

parse :: String -> Int
parse s = parseExpression s

parseExpression :: String -> Int
parseExpression s = 
  case fromString (first (tokenInt s)) of
       Just n -> n
       Nothing -> 0

--tokenInt :: forall a b. String -> Tuple a b
tokenInt str = Tuple (take 1 str) (drop 0 str)
