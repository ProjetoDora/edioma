module EdiomaSpec where

import Test.Hspec
import Test.QuickCheck

import Edioma

spec :: Spec
spec = describe "eval" $ do
    let isLit (Lit _) = True
        isLit _       = False

    it "does not change literals" $ property $ \x
      -> isLit x ==> eval x `shouldBe` x

    it "evaluates adition for literals" $ property $ \x y
      -> eval (Soma (Lit x) (Lit y)) `shouldBe` Lit (x + y)

    it "evaluates subtraction for literals" $ property $ \x y
      -> eval (Menos (Lit x) (Lit y)) `shouldBe` Lit (x - y)

    it "evaluates multiplication for literals" $ property $ \x y
      -> eval (Mult (Lit x) (Lit y)) `shouldBe` Lit (x * y)

instance Arbitrary Expr where
  arbitrary = frequency
    [ (1, Soma <$> arbitrary <*> arbitrary)
    , (1, Mult <$> arbitrary <*> arbitrary)
    , (1, Menos <$> arbitrary <*> arbitrary)
    , (10, Lit <$> arbitrary)
    ]
