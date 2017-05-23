module Menu.Model exposing (..)

-- MODEL


type alias Model =
    { menus : List Menu
    , error : String
    }


type alias Menu =
    { id : MenuId
    , name :
        String
        -- , items : List Item
    }


type alias Item =
    { id : ItemId
    , name : String
    , description : String
    , price : Float
    }


type alias MenuId =
    String


type alias ItemId =
    String


type Route
    = MenusRoute
    | AMenu MenuId
    | NotFoundRoute



-- INIT


initialModel : Model
initialModel =
    ({ menus = []
     , error = ""
     }
    )
