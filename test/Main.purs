module Test.Main where

import Prelude

import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

main :: forall e. Eff (console :: CONSOLE, testOutput :: TESTOUTPUT | e) Unit
main = runTest do
  suite "sync code" do
    test "arithmetic" do
      Assert.assert "2 + 2 should be 4" $ (2 + 2) == 4
