module Main exposing (..)

import Navigation exposing (Location, programWithFlags)
import Keyboard exposing (downs)
import Model exposing (Model, Route(Slide), initialModel)
import View exposing (view)
import Update exposing (Msg(UrlChange, KeyDown, ChangeInnerWidth), update)
import Ports exposing (changeInnerWidth)


type alias Flags =
    Int


init : Flags -> Location -> ( Model, Cmd Msg )
init flags location =
    update (UrlChange location) (initialModel flags)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ downs KeyDown
        , changeInnerWidth ChangeInnerWidth
        ]


main : Program Flags Model Msg
main =
    programWithFlags UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
