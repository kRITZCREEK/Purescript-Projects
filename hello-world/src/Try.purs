---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- | 
-- | Module : Thermite.Try 
-- | Creator: paf31
-- | Created: 2/24/201
-- | Source : https://github.com/paf31/try-thermite/blob/gh-pages/staging/src/Thermite/Try.purs
-- | 
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

{-


module Try where

import Prelude

import Data.Maybe.Unsafe
import Data.Nullable (toMaybe)

import Control.Monad.Eff

import qualified Thermite as T

import qualified React as R

import qualified DOM as DOM
import qualified DOM.HTML as DOM
import qualified DOM.HTML.Types as DOM
import qualified DOM.HTML.Window as DOM
import qualified DOM.Node.ParentNode as DOM

-- | The main method creates the task list component, and renders it to the document body.
defaultMain :: forall state action eff. 
                      T.Spec _ state _ action -> state -> Eff (dom :: DOM.DOM | eff) Unit
defaultMain spec initialState = void do
  let component = T.createClass spec initialState
  document <- DOM.window >>= DOM.document
  container <- fromJust <<< toMaybe <$> DOM.querySelector "#app" (DOM.htmlDocumentToParentNode document)
  R.render (R.createFactory component {}) container

  -}