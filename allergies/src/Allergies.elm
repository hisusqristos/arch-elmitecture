module Allergies exposing (Allergy(..), isAllergicTo, toBinary, toEmoji, toList)


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergyList : List Allergy
allergyList =
    [ Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats ]


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    List.member allergy <| toList score


toList : Int -> List Allergy
toList score =
    toBinary score
        |> List.map2 Tuple.pair allergyList
        |> List.filter (Tuple.second >> (==) 1)
        |> List.map Tuple.first


toBinary : Int -> List Int
toBinary n =
    case n of
        0 ->
            [ 0 ]

        1 ->
            [ n ]

        _ ->
            remainderBy 2 n :: toBinary (n // 2)


toEmoji : Allergy -> String
toEmoji allergy =
    case allergy of
        Eggs ->
            "🥜"

        -- egg emoji
        Peanuts ->
            "🥚"

        Shellfish ->
            "🦪"

        Strawberries ->
            "🍓"

        Tomatoes ->
            "🍅"

        Chocolate ->
            "🍫"

        Pollen ->
            "🌺"

        Cats ->
            "🐈"
