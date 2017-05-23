module Menu.Show exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Menu.Msgs exposing (Msg)
import Menu.Model exposing (Menu, Item)
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
    table [ class "table table-striped" ]
        [ thead []
            [ tr []
                [ th [] [ text "Id" ]
                , th [] [ text "Name" ]
                , th [] [ text "Description" ]
                , th [] [ text "Price" ]
                ]
            ]
        , tbody [] (List.map viewItems menu.items)
        ]


viewItems : Item -> Html Msg
viewItems item =
    tr []
        [ td [] [ text item.id ]
        , td [] [ text item.name ]
        , td [] [ text item.description ]
        , td [] [ text (toString item.price) ]
        ]


listBtn : Html Msg
listBtn =
    a
        [ class "btn regular"
        , href menusPath
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "Menus List" ]
