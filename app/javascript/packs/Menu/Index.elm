module Menu.Index exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick, onInput)
import Menu.Msgs exposing (..)
import Menu.Model exposing (Menu, Model)


view : Model -> Html Msg
view model =
    div [ class "well" ]
        [ h1 [ style [ ( "display", "flex" ), ( "justify-content", "center" ) ] ]
            [ text "Hello Elmmmm!!" ]
        , button [ onClick (FetchMenu) ] [ text "Get the New Menu" ]
        , div
            []
            [ text model.error ]
        , h2 [] [ text "Menu" ]
        , ul []
            (showMenu model.menu)
        ]


menuRow : String -> Html Msg
menuRow menuItem =
    li [] [ text (toString menuItem) ]


showMenu : Menu -> List (Html Msg)
showMenu modelMenu =
    List.map menuRow modelMenu
