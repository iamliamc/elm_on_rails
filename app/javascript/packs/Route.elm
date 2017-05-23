module Route exposing (..)

import UrlParser as Url exposing (parseHash, s, (</>), string, oneOf, Parser, map, top)
import Navigation exposing (Location)
import Menu.Model exposing (..)
import Debug


-- import Html exposing (Attribute)
-- import Html.Attributes as Attr


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ Url.map HomeRoute top
        , Url.map MenuRoute (s "menu" </> string)
        , Url.map MenusRoute (s "menus")
        ]


menusPath : String
menusPath =
    "#menus"


menuPath : MenuId -> String
menuPath menuId =
    "#menu/" ++ menuId


parseLocation : Location -> Route
parseLocation location =
    let
        _ =
            Debug.log "Location" location
    in
        case (parseHash matchers location) of
            Just route ->
                route

            Nothing ->
                NotFoundRoute
