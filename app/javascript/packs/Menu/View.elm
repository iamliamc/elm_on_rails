module Menu.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick, onInput)
import Menu.Msgs exposing (..)
import Menu.Model exposing (Model, Menu)
import Menu.Index exposing (view)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    Menu.Index.view model
