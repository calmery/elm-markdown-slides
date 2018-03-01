module Slides exposing (slides)

import Html exposing (..)
import Markdown exposing (toHtml)


slides : List (Html msg)
slides =
    [ toHtml [] <| """
# First
"""
    , toHtml [] <| """
# Second
"""
    , h1 [] [ text "Third" ]
    ]
