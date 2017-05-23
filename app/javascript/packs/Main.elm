module Main exposing (..)

import Html exposing (..)
import Json.Decode as Decode exposing (list, string, succeed)
import Navigation exposing (Location)


-- import UrlParser as Url exposing (..)

import Menu.Model exposing (Model, initialModel)
import View exposing (..)
import Menu.Msgs exposing (..)
import Menu.Commands exposing (getMenus)
import Route exposing (parseLocation)


-- VIEW


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Route.parseLocation location
    in
        ( initialModel currentRoute, getMenus )



-- menuDecoder =
--     Decode.string
-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        Menu.Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

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
    Navigation.program Menu.Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
