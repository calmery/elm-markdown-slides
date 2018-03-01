module Main exposing (..)

import Navigation exposing (program)
import Keyboard exposing (downs)
import Model exposing (Model, Route(Slide))
import View exposing (view)
import Update exposing (Msg(UrlChange, KeyDown), update)


main : Program Never Model Msg
main =
    program UrlChange
        { init = \location -> update (UrlChange location) (Model <| Slide 0)
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.batch [ downs KeyDown ]
        }
