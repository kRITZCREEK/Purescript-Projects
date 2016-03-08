---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- | 
-- | Module : Play with importing stuff
-- | Creator: Xiao Ling
-- | Created: 2/24/201
-- | see    : http://www.purescript.org/learn/getting-started/
-- |
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

module Euler where

import Prelude
import Data.List (range, filter, List)
import Data.Foldable (sum)

ns :: List Int
ns = range 0 999

ms :: List Int
ms = filter (\n -> mod n 3 == 0 || mod n 5 == 0) ns

n :: Int
n  = sum ms


