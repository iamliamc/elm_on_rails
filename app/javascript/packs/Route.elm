module Route exposing (..)

import UrlParser as Url exposing (parseHash, s, (</>), string, oneOf, Parser, map, top)
import Navigation exposing (Location)


-- import Html exposing (Attribute)
-- import Html.Attributes as Attr


type alias ItemId =
    String


type Route
    = Home
    | MenuRoute
    | ItemRoute ItemId
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ Url.map Home Url.top
        , Url.map ItemRoute (s "item" </> string)
        , Url.map MenuRoute (s "menu")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
