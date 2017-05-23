module Menu.Show exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Menu.Msgs exposing (Msg)
import Menu.Model exposing (Menu)
import Route exposing (menusPath)


view : Menu -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Menu -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]


form : Menu -> Html Msg
form menu =
    div [ class "m3" ]
        [ h1 [] [ text menu.name ]
        , h2 [] [ text menu.id ]
        ]


listBtn : Html Msg
listBtn =
    a
        [ class "btn regular"
        , href menusPath
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "Menus List" ]
