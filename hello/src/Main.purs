module Main where

import Prelude

import Math
import Math (pi,pow)
import Control.Monad.Eff
import Control.Monad.Eff.Console



diag :: Number -> Number -> Number
diag  w h = sqrt(w*2.0 + h)


circ :: Number -> Number
circ r = pi * (pow r 2.0)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = print (circ 1.3)






