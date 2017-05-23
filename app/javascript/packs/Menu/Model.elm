module Menu.Model exposing (..)

-- MODEL


type alias Model =
    { menu : Menu
    , error : String
    }


type alias Menu =
    List String



-- INIT


initialModel : Model
initialModel =
    ({ menu = []
     , error = ""
     }
    )
