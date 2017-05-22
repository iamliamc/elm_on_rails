module Route exposing (..)

import UrlParser as Url exposing (parseHash, s, (</>), string, oneOf, Parser)
import Navigation exposing (Location)
import Html exposing (Attribute)
import Html.Attributes as Attr


type Route
    = Home
    | MenuIndex
    | NotFoundRoute


route : Parser (Route -> a) a
route =
    oneOf
        [ Url.map Home (s "")
        , Url.map MenuIndex (s "menu")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash route location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


href : Route -> Attribute msg
href route =
    Attr.href (routeToString route)


routeToString : Route -> String
routeToString page =
    let
        pieces =
            case page of
                Home ->
                    []

                MenuIndex ->
                    [ "menu" ]

                NotFoundRoute ->
                    [ "404" ]
    in
        "#/" ++ (String.join "/" pieces)
