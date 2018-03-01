module Model exposing (Model, Route(Slide))


type Route
    = Slide Int


type alias Model =
    { currentPosition : Route
    }
