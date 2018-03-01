module Slides exposing (slides)

import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown exposing (toHtml)


-- Support


divide : List (Html msg) -> List (Html msg) -> Html msg
divide left right =
    div [ style [ ( "display", "flex" ) ] ]
        [ div [ style [ ( "width", "50%" ) ] ] left
        , div [ style [ ( "width", "50%" ) ] ] right
        ]


slides : List (Html msg)
slides =
    [ toHtml [] <| """
# First
"""
    , toHtml [] <| """
# Second
"""
    , h1 [] [ text "Third" ]
    , div []
        [ h1 [] [ text "Fourth" ]
        , divide [ text "Left" ] [ text "Right" ]
        ]
    ]
