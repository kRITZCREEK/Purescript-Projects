---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- | 
-- | Module : Main
-- | Creator: Xiao Ling
-- | Created: 2/24/201
-- | http://research.microsoft.com/en-us/um/people/sumitg/pubs/cacm14.pdf
-- | 
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


module Main where

import Prelude

import Math
import Math (pi,pow)
import Control.Monad
import Control.Monad.ST
import Control.Monad.Eff
import Control.Monad.Eff.Random
import Control.Monad.Eff.Console

-- * for hello world
import qualified Thermite as T
import qualified React as R
import qualified React.DOM as R
import qualified React.DOM.Props as RP


---------------------------------------------------------------------------------------------------
-- * Main for hello world
-- * https://github.com/paf31/purescript-thermite
---------------------------------------------------------------------------------------------------

data Action = Incr | Decr

type State = { counter :: Int }

state0 :: State
state0 = { counter : 0 }

render :: T.Render State _ Action
render dispatch _ state _ = 
  [ R.p' [ R.text "Value: "
         , R.text $ show state.counter
         ]
  , R.p' [ R.button [ RP.onClick \_ -> dispatch Incr ]
                    [ R.text "Increment" ]
         , R.button [ RP.onClick \_ -> dispatch Decr ]
                    [ R.text "Decrement" ]
         ]
  ]    


performAction :: T.PerformAction _ State _ Action
performAction Incr _ _ update = update $ \state -> state { counter = state.counter + 1 }
performAction Decr _ _ update = update $ \state -> state { counter = state.counter - 1 }

spec :: T.Spec _ State _ Action
spec = T.simpleSpec performAction render


--main = do
  --let component = T.createClass spec state0
  --body >>= R.render (R.createFactory component {})













---------------------------------------------------------------------------------------------------
-- * Basic Math
---------------------------------------------------------------------------------------------------

diag :: Number -> Number -> Number
diag  w h = sqrt(w*2.0 + h)

circ :: Number -> Number
circ r = pi * (pow r 2.0)

---------------------------------------------------------------------------------------------------
-- * ST Monad
---------------------------------------------------------------------------------------------------

-- * play with what looks like the ST monad  - which is essentially unsafePerformIO with local variable
-- * Use: runST (sim xo vo t)
sim :: forall eff m. Number -> Number -> Number -> Eff (st :: ST m | eff) Number
sim xo vo t = do
    st <- newSTRef { x : xo, v : vo }        -- * local var
    forE 0.0 (t * 1000.0) $ \i -> do
      modifySTRef st (\st ->              
        { v : st.v  - 9.8 * 0.001
        , x : st.x + st.v * 0.001 
        })
      return unit
    st1 <- readSTRef st
    return st1.v

-- * runPure is like extract? what are the consequences of this?
sim' :: Number -> Number -> Number -> Number
sim' xo vo t = runPure $ runST (sim xo vo t)


---------------------------------------------------------------------------------------------------
-- * Old mains: random number generartion, printing
---------------------------------------------------------------------------------------------------

 --* random # generation
--main :: forall t. Eff ( random :: RANDOM, console :: CONSOLE | t) Unit
--main = random >>= print

-- * printing
--main :: forall e. Eff (console :: CONSOLE | e) Unit
--main = print $ "hello world " ++ show (circ 3.4)



---------------------------------------------------------------------------------------------------
-- * Main for dom stuff
---------------------------------------------------------------------------------------------------

-- * todo: understand purescript's philosophy in terms of dom maniuplation,
-- *       and   

--setupEventHandlers :: forall m. Eff (console :: CONSOLE, dom :: DOM | m) Unit
--setupEventHandlers = body >>= addEventListner "change" validateAndUpdateUI


--main :: forall m. Eff (console :: CONSOLE, dom :: DOM | m) Unit
--main = do
--    log "attaching event handlers"
--    setupEventHandlers










































