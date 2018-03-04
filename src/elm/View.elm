module View exposing (view)

import Html exposing (Html, Attribute, div, text)
import Html.Attributes exposing (style)
import List.Extra exposing ((!!))
import Model exposing (Model, Route(Slide))
import Update exposing (Msg)
import Slides exposing (slides)


slideStyle : Attribute Msg
slideStyle =
    style
        [ ( "width", "1000px" )
        , ( "height", "562.5px" )
        , ( "top", "50%" )
        , ( "left", "50%" )
        , ( "position", "absolute" )
        , ( "margin-top", "-281.75px" )
        , ( "margin-left", "-500.5px" )
        , ( "background", "#FFFFFF" )
        , ( "border", "1px solid #E6E6E6" )
        , ( "border-radius", "3px" )
        ]


view : Model -> Html Msg
view model =
    div [ slideStyle ]
        [ div [ style [ ( "padding", "29.5px 68.5px" ) ] ]
            [ case model.currentPosition of
                Slide currentPosition ->
                    case slides !! currentPosition of
                        Just slide ->
                            slide

                        Nothing ->
                            text ""
            ]
        ]
