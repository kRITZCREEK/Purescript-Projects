---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- | 
-- | Module : Main
-- | Creator: Xiao Ling
-- | Created: 2/24/201
-- | Source : https://github.com/paf31/purescript-thermite
-- |          http://www.parsonsmatt.org/2015/10/03/elm_vs_purescript.html
-- |          https://github.com/ethul/purescript-react-example     <- project structure
-- |          pulp browserify --to app.js
-- | 
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

module Main where

import Prelude

import Control.Monad
import Control.Monad.Eff
import Control.Monad.Eff.Console

import qualified Thermite as T

import qualified React as R
import qualified React.DOM as R
import qualified React.DOM.Props as RP

import qualified DOM as DOM
import qualified DOM.HTML as DOM
import qualified DOM.HTML.Types as DOM
import qualified DOM.HTML.Window as DOM
import qualified DOM.Node.ParentNode as DOM

import Data.Maybe.Unsafe
import Data.Nullable (toMaybe)

---------------------------------------------------------------------------------------------------
-- * Default main
-- * https://github.com/paf31/try-thermite/blob/gh-pages/staging/src/Thermite/Try.purs
---------------------------------------------------------------------------------------------------


-- * note :   void :: forall f a. Functor f => f a -> f ()
defaultMain :: forall state action eff. 
                      T.Spec _ state _ action -> state -> Eff (dom :: DOM.DOM | eff) Unit
defaultMain spec initialState = void do
  let component = T.createClass spec initialState
  win       <- DOM.window
  doc       <- DOM.document win
  container <- fromJust <<< toMaybe <$> DOM.querySelector "#app" (DOM.htmlDocumentToParentNode doc)
  ReactDOM.render (R.createFactory component {}) container

---------------------------------------------------------------------------------------------------
-- * Hello world here: http://paf31.github.io/try-thermite/
---------------------------------------------------------------------------------------------------

-- * a thermite component is some state
type State = Int

-- * every component needs an initial state
state0 :: State
state0 = 0

-- * now make the state available to the render function
render :: T.Render State _ _ 
render _ _ state _ = [ R.h1' [ R.text "Hello world hello "]]

spec :: T.Spec _ State _ _ 
spec = T.simpleSpec T.defaultPerformAction render


-- * main: just displays the state
main :: forall m. Eff (dom :: DOM.DOM | m ) Unit
main = defaultMain spec state0




