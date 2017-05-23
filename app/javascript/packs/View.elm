module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, class, href)
import Html.Events exposing (onClick, onInput)
import Menu.Msgs exposing (..)
import Menu.Model exposing (Model, Menu)
import Menu.Index exposing (view)
import Menu.Show exposing (view)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Menu.Model.HomeRoute ->
            homeView

        Menu.Model.MenusRoute ->
            Menu.Index.view model

        Menu.Model.MenuRoute menuId ->
            menuShowPage model menuId

        Menu.Model.NotFoundRoute ->
            notFoundView


menuShowPage : Model -> Menu.Model.MenuId -> Html Msg
menuShowPage model menuId =
    let
        menu =
            model.menus
                |> List.filter (\menu -> menu.id == menuId)
                |> List.head
    in
        case menu of
            Just menu ->
                Menu.Show.view menu

            Nothing ->
                notFoundView


homeView : Html msg
homeView =
    h1 []
        [ a [ href "#menus" ] [ text "Welcome to the Elm Menus App! Click To Continue" ]
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found is matching"
        ]
