---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- | 
-- | Module : Address book
-- | Creator: Xiao Ling
-- | Created: 2/24/201
-- |
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

module AddressBook where

import Data.List 
import Data.Maybe

import Control.Monad
import Control.Monad.ST
import Data.STRef


---------------------------------------------------------------------------------------------------
-- * Types
---------------------------------------------------------------------------------------------------


type AddressBook = [Entry]

data Entry       = E { firstN :: String, lastN :: String, address :: Address } 
                        deriving (Show,Eq)

data Address     = A { street :: String, city  :: String, state   :: String } 
                        deriving (Show,Eq)


a1 :: Address
a1 = A "copley" "solon" "OH"

e1 :: Entry
e1 = E "xiao" "ling" a1


{--------------------------------------------------------------------------------------------------
  play with ST Monad
read: http://stackoverflow.com/questions/7880555/st-monad-code-smell
--------------------------------------------------------------------------------------------------}

sumST :: Num a => [a] -> a
sumST xs = runST $ do
    n <- newSTRef 0   -- * local var
    forM_ xs $ \x -> do
        modifySTRef n (+x)
    readSTRef n









































