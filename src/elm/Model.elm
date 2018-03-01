module Model exposing (Model, Route(Slide))

import Html exposing (Html)


type Route
    = Slide Int


type alias Model =
    { currentPosition : Route
    , slides : List String
    }
