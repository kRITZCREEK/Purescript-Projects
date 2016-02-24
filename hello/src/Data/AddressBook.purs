---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- | 
-- | Module : Address book
-- | Creator: Xiao Ling
-- | Created: 2/24/201
-- |
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

module Data.AddressBook where

import Prelude
import Data.List 
import Data.Maybe
import Control.Plus


---------------------------------------------------------------------------------------------------
-- * Types
---------------------------------------------------------------------------------------------------


type AddressBook = List Entry 
type Entry       = { firstN :: String, lastN :: String, address :: Address } 
data Address     = A { street :: String, city :: String, state :: String }


instance showAddress :: Show Address where
	show (A a) = a.street ++ " " ++ a.city ++ " " ++ a.state

e :: Address
e = A { street : "Hello", city : "world", state: "stuff"}