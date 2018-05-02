module Slides exposing (slides)

import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown exposing (toHtml)
import EmbeddedGist


-- Template


title : String -> String -> Html msg
title title subtitle =
    div
        [ style
            [ ( "text-align", "center" )
            , ( "top", "50%" )
            , ( "left", "0" )
            , ( "right", "0" )
            , ( "position", "absolute" )
            , ( "margin-top", "-73.25px" )
            ]
        ]
        [ div [] [ h1 [ style [ ( "margin-top", "0" ) ] ] [ text title ] ]
        , div [] [ text subtitle ]
        ]


titleOnly : String -> List (Html msg) -> Html msg
titleOnly title body =
    div []
        [ h1 [] [ text title ]
        , div [] body
        ]


two : String -> List (Html msg) -> List (Html msg) -> Html msg
two title left right =
    let
        parentSlideStyle =
            style [ ( "display", "flex" ) ]

        childSlideStyle =
            style [ ( "width", "50%" ) ]
    in
        titleOnly title
            [ div [ parentSlideStyle ]
                [ div [ childSlideStyle ] left
                , div [ childSlideStyle ] right
                ]
            ]


blank : Html msg -> Html msg
blank body =
    div [] [ body ]



-- Slides


slides : List (Html msg)
slides =
    [ title "Title" "SubTitle"
    , titleOnly "Title and Content" [ text "Hello World" ]
    , two "Two Content" [ text "Left" ] [ text "Right" ]
    , blank <| toHtml [] <| """
# Markdown

- Item 1
- Item 2
- Item 1
- Item 2
- Item 1
- Item 2
- Item 1
- Item 2
- Item 1
- Item 2
- Item 1
- Item 2
- Item 1
- Item 2

"""
    , blank <| toHtml [] <| """
# Highlight.js

```elm
module Main exposing (main)

import Html exposing (Html, text)

main : Html msg
main =
    text "Hello, World!"
```
"""
    , titleOnly "Embedded Gist" [ EmbeddedGist.unsafeEmbeddedGist "calmery/b74cf2ba1fa17542e220e7ac5aafd941" ]
    ]
