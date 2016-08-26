module EdiomaSpec where

import Test.Hspec
import Test.QuickCheck

import Edioma

spec :: Spec
spec = describe "eval" $ do
    let isLit (Lit _) = True
        isLit _       = False
    let isSoma (Soma _ _) = True
        isSoma _       = False

    it "does not change literals" $ property $ \x
      -> isLit x ==> eval x `shouldBe` x

    it "evaluates adition" $ do
      eval (Soma (Lit 1) (Lit 5)) `shouldBe` Lit 6

    it "evaluates subtraction" $ do
      eval (Menos (Lit 1) (Lit 5)) `shouldBe` Lit (-4)

    it "evaluates multiplication" $ do
      eval (Mult (Lit 1) (Lit 5)) `shouldBe` Lit 5

instance Arbitrary Expr where
  arbitrary = frequency
    [ (1, Soma <$> arbitrary <*> arbitrary)
    , (1, Mult <$> arbitrary <*> arbitrary)
    , (1, Menos <$> arbitrary <*> arbitrary)
    , (10, Lit <$> arbitrary)
    ]
