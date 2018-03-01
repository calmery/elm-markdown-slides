module Update exposing (Msg(Left, Right, KeyDown, UrlChange), update)

import List exposing (length)
import Model exposing (Model, Route(Slide))
import Navigation exposing (Location, newUrl)
import UrlParser exposing (Parser, map, oneOf, int, parseHash)


route : Parser (Route -> a) a
route =
    oneOf
        [ map Slide int
        ]


type Msg
    = Left
    | Right
    | KeyDown Int
    | UrlChange Location


moveSlide : Bool -> Model -> Int -> ( Model, Cmd Msg )
moveSlide flag model nextPosition =
    if flag then
        { model | currentPosition = Slide nextPosition } ! [ newUrl ("#/" ++ toString nextPosition) ]
    else
        model ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        KeyDown keyCode ->
            case keyCode of
                13 ->
                    update Right model

                39 ->
                    update Right model

                37 ->
                    update Left model

                _ ->
                    model ! []

        Right ->
            let
                nextPosition =
                    case model.currentPosition of
                        Slide position ->
                            position + 1
            in
                moveSlide (length model.slides > nextPosition) model nextPosition

        Left ->
            let
                nextPosition =
                    case model.currentPosition of
                        Slide position ->
                            position - 1
            in
                moveSlide (0 <= nextPosition) model nextPosition

        UrlChange location ->
            let
                currentPosition =
                    case parseHash route location of
                        Just position ->
                            case position of
                                Slide p ->
                                    if 0 <= p && p < length model.slides then
                                        position
                                    else
                                        Slide 0

                        Nothing ->
                            Slide 0
            in
                { model | currentPosition = currentPosition } ! []
