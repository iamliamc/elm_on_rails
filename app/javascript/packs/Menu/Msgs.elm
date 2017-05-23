module Menu.Msgs exposing (..)

import Menu.Model exposing (..)
import Navigation exposing (Location)
import Http exposing (..)


type Msg
    = None
    | HandleGetMenuResponse (Result Http.Error (List Menu))
    | FetchMenu
    | OnLocationChange Location
