module Menu.Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Menu.Msgs exposing (..)
import Menu.Model exposing (Menu)
import Rails


getMenus : Cmd Msg
getMenus =
    menusDecoder
        |> Rails.get "//localhost:3000/menu.json"
        |> Http.send HandleGetMenuResponse


menusDecoder : Decode.Decoder (List Menu)
menusDecoder =
    Decode.list menuDecoder


menuDecoder : Decode.Decoder Menu
menuDecoder =
    decode Menu
        |> required "id" Decode.string
        |> required "name" Decode.string
