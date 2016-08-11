module Test.Main where

import Prelude (Unit, (==), ($))

import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

import Main (parse)

main :: forall e. Eff (console :: CONSOLE, testOutput :: TESTOUTPUT | e) Unit
main = runTest do
  suite "parse" do
    test "number" do
      Assert.assert "fails to convert to number" $ parse "2" == 2
