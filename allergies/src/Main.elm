module Main exposing (..)

import Allergies
import Browser
import Html exposing (Html, br, div, input, text)
import Html.Attributes exposing (placeholder, src, style, value, width)
import Html.Events exposing (onInput)
import List
import Maybe exposing (withDefault)
import String exposing (replace, toInt)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    Int


init : Model
init =
    0


type Msg
    = Change String


update : Msg -> Model -> Model
update msg _ =
    case msg of
        Change newScore ->
            toInt newScore |> withDefault 0


toPresentable : Int -> String
toPresentable =
    Allergies.toList >> List.map Allergies.toEmoji >> List.intersperse " " >> List.foldr (++) ""


view : Model -> Html Msg
view model =
    div
        [ style "display" "flex"
        , style "justify-content" "center"
        , style "background-image" "url('background.jpg')"
        , style "opacity" "0.4"
        , style "height" "1300px" -- consider to changing to screen size
        ]
        [ div
            [ style "align" "center" ]
            [ allergiesText
            , aranjviPaiskavik model
            ]
        ]


allergiesText =
    div [ style "font-size" "1300%", style "margin-bottom" "7%", style "margin-top" "300px" ] [ text "Allergies" ]


aranjviPaiskavik : Model -> Html Msg
aranjviPaiskavik model =
    div
        [ style "font-size" "50px"
        , style "display" "flex"
        , style "flex-direction" "column"
        , style "margin-left" "25%"
        , style "padding" "20px"
        , style "background-color" "#ff9800"
        , style "border-radius" "7%"
        , style "width" "50%"
        ]
        [ input [ placeholder "score", value (Debug.toString model), onInput Change ] []
        , text (toPresentable model)
        ]
