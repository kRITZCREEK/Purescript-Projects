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
import Data.Functor
import Control.Plus


---------------------------------------------------------------------------------------------------
-- * Types 
---------------------------------------------------------------------------------------------------

type AddressBook = List Entry 
data Entry       = E { firstN :: String, lastN :: String, address :: Address } 
data Address     = A { street :: String, city  :: String, state   :: String }


derive instance eqAddress  :: Eq Address
derive instance eqEntry    :: Eq Entry

---------------------------------------------------------------------------------------------------
-- * Type classes
---------------------------------------------------------------------------------------------------

instance showAddress :: Show Address where
    show (A a) = "Address: " ++ a.street ++ " " ++ a.city ++ " " ++ a.state

instance showEntry :: Show Entry where
    show (E e) = "Name: " ++ e.firstN ++ " " ++ e.lastN ++ " " ++ show e.address

---------------------------------------------------------------------------------------------------
-- * Utility functions
---------------------------------------------------------------------------------------------------

liveAt :: Entry -> Address -> Entry
liveAt (E e) a = E { firstN : e.firstN, lastN : e.lastN, address : a }

insertE :: AddressBook -> Entry -> AddressBook
insertE xs e = e : xs

findE :: AddressBook -> String -> String -> Maybe Entry
findE es n1 n2 = case es of
    Nil            -> Nothing
    Cons (E e) es' -> if e.firstN == n1 && e.lastN == n2 then Just (E e) else findE es' n1 n2

deleteE :: AddressBook -> Entry -> AddressBook
deleteE Nil         _      = Nil
deleteE (Cons x xs) e      = if x == e then xs else Cons x (deleteE xs e)

updateA :: AddressBook -> String -> String -> Address -> AddressBook
updateA es n1 n2 a = (go n1 n2 a) <$> es
    where go n1 n2 a (E e) = if e.firstN == n1 && e.lastN == n2 then (E e) `liveAt` a else (E e)

---------------------------------------------------------------------------------------------------
-- * Examples
---------------------------------------------------------------------------------------------------

e1 :: Entry
e1 = E { firstN : "John", lastN : "Doh", address : a1 }

e2 :: Entry
e2 = E { firstN : "Jane", lastN : "Doh", address : a1 }

a1 :: Address
a1 = A { street : "copley", city : "solon", state : "OH" }

a2 :: Address
a2 = A { street : "Max ct", city : "Twinsburg", state : "OH" }

es :: AddressBook
es = Cons e1 (Cons e2 Nil)

---------------------------------------------------------------------------------------------------
-- * Utility function Properties
-- * TODO quickcheck these. also restate them since the functions have changed
---------------------------------------------------------------------------------------------------

-- * insert
-- * forall l e. length l = n -> length (insert l e) = n + 1
-- * forall e.   [e] = insert e []

-- * find
-- * forall l e. IN e l    -> findEntry l e = Just e
-- * forall l e. ~(In e l) -> findEntry l e = Nothing

-- * delete
-- * forall l e. In e l -> ~ (In e (delete l e))
-- * forall l e. In e l -> length l = n -> length (delete l e) = n - 1
-- * forall l e. ~ (In e l) -> l = delete e l

-- * update
-- * forall l e1 e2. In e1 l -> e1 ~= e2 -> ~ (In e1 (updateEntry l e1 e2)) /\ In e2 (updateEntry l e1 e2)
-- * forall l e1 e2. ~ (IN e1 l) -> l = updateEntry l e1 e2










