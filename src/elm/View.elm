module View exposing (view)

import Html exposing (Html, Attribute, div, text)
import Html.Attributes exposing (style)
import List exposing (length)
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


seekBar : List (Html Msg) -> Route -> Html Msg
seekBar slides currentPosition =
    case currentPosition of
        Slide position ->
            let
                numberOfSlides =
                    length slides

                percent =
                    (toFloat (position + 1)) * ((toFloat 100) / (toFloat numberOfSlides))
            in
                div
                    [ style
                        [ ( "width", "100%" )
                        , ( "height", "5px" )
                        , ( "top", "0" )
                        , ( "left", "0" )
                        , ( "position", "absolute" )
                        , ( "background", "#FFF" )
                        , ( "border-bottom", "1px solid #E6E6E6" )
                        ]
                    ]
                    [ div
                        [ style
                            [ ( "width", (toString percent) ++ "%" )
                            , ( "height", "5px" )
                            , ( "background", "#E6E6E6" )
                            ]
                        ]
                        []
                    ]


view : Model -> Html Msg
view model =
    div []
        [ seekBar slides model.currentPosition
        , div [ slideStyle ]
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
        ]
