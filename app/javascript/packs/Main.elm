module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, class)
import Json.Decode exposing (list, string, succeed)
import Html.Events exposing (onClick, onInput)
import Http
import Rails


-- MODEL


type alias Model =
    { menu : Menu, error : String }


type alias Menu =
    List String



-- INIT


init : ( Model, Cmd Message )
init =
    ( { menu = []
      , error = ""
      }
    , Cmd.none
    )



-- VIEW


view : Model -> Html Message
view model =
    -- The inline style is being used for example purposes in order to keep this example simple and
    -- avoid loading additional resources. Use a proper stylesheet when building your own app.
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



-- MESSAGE


menuRow : String -> Html Message
menuRow menuItem =
    li [] [ text (toString menuItem) ]


showMenu : Menu -> List (Html Message)
showMenu modelMenu =
    List.map menuRow modelMenu


type Message
    = None
    | HandleGetMenuResponse (Result Http.Error (List String))
    | FetchMenu


getMenu : Cmd Message
getMenu =
    list string
        |> Rails.get "//localhost:3000/menu.json"
        |> Http.send HandleGetMenuResponse



-- menuDecoder =
--     Decode.string
-- UPDATE


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        None ->
            ( model, Cmd.none )

        FetchMenu ->
            ( model, getMenu )

        HandleGetMenuResponse (Ok m) ->
            ( { model | menu = m }, Cmd.none )

        HandleGetMenuResponse (Err err) ->
            ( { model | error = toString err }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Message
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Message
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
