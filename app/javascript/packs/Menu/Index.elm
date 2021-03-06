module Menu.Index exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, class, href)
import Html.Events exposing (onClick, onInput)
import Menu.Msgs exposing (..)
import Menu.Model exposing (Menu, Model)
import Route exposing (menuPath)


view : Model -> Html Msg
view model =
    div [ class "well" ]
        [ h1 [ style [ ( "display", "flex" ), ( "justify-content", "center" ) ] ]
            [ text "Hello Elmmmm!!" ]
        , div
            []
            [ text model.error ]
        , h2 [] [ text "Menu" ]
        , ul []
            (showMenu model.menus)
        ]


menuRow : Menu -> Html Msg
menuRow menu =
    li [] [ a [ href (menuPath menu.id) ] [ text (toString menu.name) ] ]


showMenu : List Menu -> List (Html Msg)
showMenu menus =
    List.map menuRow menus
