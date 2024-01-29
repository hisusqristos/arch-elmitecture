module Main exposing (..)

import Browser
import Html exposing (Html, div)
import Html.Attributes exposing (style)
import SecureTreasureChest exposing (Password(..), SecureTreasureChest(..), createTreasure)
import TalkingBoard exposing (esoterics)


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
        esoterics


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


putInRow : List (Html.Attribute msg)
putInRow =
    [ style "display" "grid"
    , style "grid-auto-flow" "column"
    , style "gap" "4%"
    ]
