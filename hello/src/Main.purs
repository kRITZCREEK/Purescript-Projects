module Main where

import Prelude

import Math
import Math (pi,pow)
import Control.Monad
import Control.Monad.Eff
import Control.Monad.Eff.Random
import Control.Monad.Eff.Console



diag :: Number -> Number -> Number
diag  w h = sqrt(w*2.0 + h)


circ :: Number -> Number
circ r = pi * (pow r 2.0)

-- * printing
--main :: forall e. Eff (console :: CONSOLE | e) Unit
--main = print $ "hello world " ++ show (circ 3.4)

-- * random # generation
main :: forall t. Eff ( random :: RANDOM, console :: CONSOLE | t) Unit
main = random >>= print






