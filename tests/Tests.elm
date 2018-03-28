module Tests exposing (..)

import List exposing (length)
import Tuple exposing (first)
import Test exposing (..)
import TestExp exposing (..)
import Slides exposing (slides)
import Model exposing (Model, Route(Slide))
import Update exposing (update, Msg(KeyDown))


all : Test
all =
    describe "Update Test"
        ([ "Update - KeyDown 37 (1 -> 0)"
            => first (update (KeyDown 37) (Model (Slide 1)))
            === Model (Slide 0)
         , "Update - KeyDown 37 (0 -> 0)"
            => first (update (KeyDown 37) (Model (Slide 0)))
            === Model (Slide 0)
         ]
            ++ (if length slides > 0 then
                    [ "Update - KeyDown 13 (0 -> 1)"
                        => first (update (KeyDown 13) (Model (Slide 0)))
                        === Model (Slide 1)
                    , "Update - KeyDown 39 (0 -> 1)"
                        => first (update (KeyDown 39) (Model (Slide 0)))
                        === Model (Slide 1)
                    , "Update - KeyDown 39 (length slides -> length slides)"
                        => first (update (KeyDown 13) (Model (Slide ((length slides) - 1))))
                        === Model (Slide ((length slides) - 1))
                    ]
                else
                    []
               )
        )
