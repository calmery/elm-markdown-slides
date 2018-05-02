module Model exposing (Model, Route(Slide), initialModel)


type Route
    = Slide Int


type alias TouchDevice =
    { isScroll : Bool
    , touchStartX : Int
    , innerWidth : Int
    }


type alias Model =
    { currentPosition : Route
    , touchDevice : TouchDevice
    }


initialModel : Int -> Model
initialModel innerWidth =
    Model (Slide 0) (TouchDevice False 0 innerWidth)
