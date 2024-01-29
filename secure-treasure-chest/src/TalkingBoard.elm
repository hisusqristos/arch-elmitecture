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
