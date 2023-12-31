module Tests exposing (..)

import Allergies exposing (Allergy(..), isAllergicTo, toBinary, toList)
import Expect
import List
import Main exposing (toPresentable)
import Test exposing (..)


tests : Test
tests =
    describe "Allergies"
        [ describe "isAllergicTo"
            [ describe "no allergies means not allergic"
                [ test "peanuts" <|
                    \() -> Expect.equal False (isAllergicTo Peanuts 0)
                , test "cats" <|
                    \() -> Expect.equal False (isAllergicTo Cats 0)
                , test "strawberries" <|
                    \() -> Expect.equal False (isAllergicTo Strawberries 0)
                ]
            , test "is allergic to eggs" <|
                \() -> Expect.equal True (isAllergicTo Eggs 1)
            , describe "has the right allergies"
                [ test "eggs" <|
                    \() -> Expect.equal True (isAllergicTo Eggs 5)
                , test "shellfish" <|
                    \() -> Expect.equal True (isAllergicTo Shellfish 5)
                , test "strawberries" <|
                    \() -> Expect.equal False (isAllergicTo Strawberries 5)
                ]
            ]
        , describe "toList"
            [ test "no allergies at all" <|
                \() -> Expect.equal [] (toList 0)
            , test "allergic to just peanuts" <|
                \() -> Expect.equal [ Peanuts ] (toList 2)
            , test "allergic to everything" <|
                \() ->
                    Expect.equal (allergySort [ Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats ])
                        (255 |> toList |> allergySort)
            , test "ignore non allergen score parts" <|
                \() -> Expect.equal [ Eggs ] (toList 257)
            , test "ignore all non allergen score parts" <|
                \() ->
                    Expect.equal (allergySort [ Eggs, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats ])
                        (509 |> toList |> allergySort)
            ]
        ]


allergySort : List Allergy -> List Allergy
allergySort =
    let
        allergyOrder allergy =
            case allergy of
                Eggs ->
                    1

                Peanuts ->
                    2

                Shellfish ->
                    3

                Strawberries ->
                    4

                Tomatoes ->
                    5

                Chocolate ->
                    6

                Pollen ->
                    7

                Cats ->
                    8
    in
    List.sortBy allergyOrder



-- inqnaglux utils, lyublyu celuyu


toBinaryTest : Test
toBinaryTest =
    describe "decimal to bits. korotko i yasno."
        [ test "5 is 00000101 splitted in list" <|
            \() ->
                toBinary 5
                    |> Expect.equal ([ 1, 0, 1 ] |> List.reverse)
        , test "4 is 00000100 splitted in list" <|
            \() ->
                toBinary 4
                    |> Expect.equal ([ 1, 0, 0 ] |> List.reverse)
        , test "28 is 00011100 splitted in list" <|
            \() ->
                toBinary 28
                    |> Expect.equal ([ 1, 1, 1, 0, 0 ] |> List.reverse)
        , test "0 is 0 splitted in list" <|
            \() ->
                toBinary 0
                    |> Expect.equal ([ 0 ] |> List.reverse)
        , test "2 is 10 splitted in list" <|
            \() ->
                toBinary 2
                    |> Expect.equal ([ 1, 0 ] |> List.reverse)
        , test "0 gives an empty string" <|
            \() -> Expect.equal (toPresentable 0) ""
        ]
