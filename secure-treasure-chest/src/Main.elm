module Main exposing (..)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (style, width)
import List
import SecureTreasureChest exposing (Password(..), SecureTreasureChest(..), createTreasure)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { attempt : String
    , chest : SecureTreasureChest String
    }


init : Model
init =
    { attempt = ""
    , chest = createTreasure "🐱" (Password "Password")
    }


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newText ->
            { model | attempt = newText }


view : Model -> Html Msg
view _ =
    div
        placeToCenter
        [ div
            [ style "background-color" "#E0115F"
            , style "border" "2px solid black"
            , style "border-radius" "25px"
            , style "width" "55%"
            , style "padding" "2.5% 5% 2.5% 5%"
            , style "text-align" "center"
            , style "line-height" "2"
            ]
            [ toOuija alphabet
            , div [ style "font-size" "30px" ] [ text "⛤" ]
            ]
        ]


toOuija : List String -> Html msg
toOuija =
    List.intersperse " " >> List.foldr (++) "" >> text


alphabet : List String
alphabet =
    [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ]


placeToCenter : List (Html.Attribute msg)
placeToCenter =
    [ style "position" "absolute"
    , style "display" "grid"
    , style "justify-items" "center"
    , style "top" "40%"
    , style "left" "50%"
    , style "margin-right" "-50%"
    , style "transform" "translate(-50%, -50%)"
    ]
