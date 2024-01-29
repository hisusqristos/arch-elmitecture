module TalkingBoard exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Simple.Animation as Animation exposing (Animation)
import Simple.Animation.Animated as Animated
import Simple.Animation.Property as P
import Svg
import Svg.Attributes exposing (cx, cy, fill, r, stroke, strokeWidth)


esoterics : List (Html msg)
esoterics =
    [ div
        [ style "background-color" "#E0115F"
        , style "border" "2px solid black"
        , style "border-radius" "25px"
        , style "width" "55%"
        , style "padding" "2.5% 5% 0% 5%"
        , style "text-align" "center"
        , style "line-height" "2"
        ]
        [ talkingBoard alphabet
        , div [ style "font-size" "30px" ] [ text "⛤" ]
        , wanderingCircle
        ]
    ]


type alias Location =
    { x : Float
    , y : Float
    }


alphabet : List String
alphabet =
    [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ]


talkingBoard : List String -> Html msg
talkingBoard =
    List.intersperse " " >> List.foldr (++) "" >> text


wanderingCircle : Html msg
wanderingCircle =
    let
        location =
            Location 0.66 -46

        kLocation =
            Location 45 -123
    in
    Animated.div (location |> moveTo kLocation) [] [ circle 14 ]


moveTo : Location -> Location -> Animation
moveTo dest current =
    Animation.fromTo
        { duration = 1000
        , options = []
        }
        [ P.xy current.x current.y ]
        [ P.xy dest.x dest.y ]


circle : Float -> Html msg
circle radius =
    let
        cxcy =
            radius + 2 |> Debug.toString

        boxSize =
            2 * (radius + 2) |> Debug.toString
    in
    Svg.svg [ Svg.Attributes.width boxSize, Svg.Attributes.height boxSize ] [ Svg.circle [ cx cxcy, cy cxcy, r (Debug.toString radius), stroke "black", strokeWidth "2", fill "none" ] [] ]
