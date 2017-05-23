module Route exposing (..)

import UrlParser as Url exposing (parseHash, s, (</>), string, oneOf, Parser, map, top)
import Navigation exposing (Location)
import Menu.Model exposing (..)


-- import Html exposing (Attribute)
-- import Html.Attributes as Attr


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ Url.map AMenu (s "menu" </> string)
        , Url.map MenusRoute (s "menu")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
