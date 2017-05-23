module Menu.Commands exposing (..)

import Http
import Json.Decode as Decode
import Menu.Msgs exposing (..)
import Menu.Model exposing (Menu)
import Rails


getMenu : Cmd Msg
getMenu =
    Decode.list Decode.string
        |> Rails.get "//localhost:3000/menu.json"
        |> Http.send HandleGetMenuResponse
