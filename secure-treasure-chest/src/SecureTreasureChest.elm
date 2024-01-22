module SecureTreasureChest exposing (..)


type Password
    = Password String


type SecureTreasureChest treasure
    = SecureTreasureChest Password treasure


createPassword : String -> Maybe Password
createPassword passwordCandidate =
    if String.length passwordCandidate >= 8 then
        Just (Password passwordCandidate)

    else
        Nothing


createTreasure : treasure -> Password -> SecureTreasureChest treasure
createTreasure treasure password =
    SecureTreasureChest password treasure


getTreasure : String -> SecureTreasureChest treasure -> Maybe treasure
getTreasure passwordAttempt (SecureTreasureChest (Password password) treasure) =
    if passwordAttempt == password then
        Just treasure

    else
        Nothing
