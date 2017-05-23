module Main exposing (..)

import Html exposing (..)
import Json.Decode as Decode exposing (list, string, succeed)
import Navigation exposing (Location)


-- import UrlParser as Url exposing (..)

import Menu.Model exposing (Model, initialModel)
import Menu.View exposing (..)
import Menu.Msgs exposing (..)
import Menu.Commands exposing (getMenus)


-- VIEW


init : ( Model, Cmd Msg )
init =
    ( initialModel, getMenus )



-- menuDecoder =
--     Decode.string
-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        FetchMenu ->
            ( model, getMenus )

        HandleGetMenuResponse (Ok m) ->
            ( { model | menus = m }, Cmd.none )

        HandleGetMenuResponse (Err err) ->
            ( { model | error = toString err }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW
-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
