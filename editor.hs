module Main where
import Haste
import Haste.DOM
import Haste.Events

main = withElems ["editor","result"] edit

edit [editor, result] = do
    onEvent editor  KeyUp $ \_ -> recompile
  where
    recompile = do
      code <- getValue editor
      case (code) of
        (Just editor') -> setProp result "innerHTML" (editor')
        _              -> return ()

