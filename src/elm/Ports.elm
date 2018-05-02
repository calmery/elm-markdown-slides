port module Ports exposing (changeInnerWidth)


port changeInnerWidth : (Int -> msg) -> Sub msg
