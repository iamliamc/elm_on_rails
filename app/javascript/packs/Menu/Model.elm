module Menu.Model exposing (..)

-- MODEL


type alias Model =
    { menus : List Menu
    , error : String
    , route : Route
    }


type alias Menu =
    { id : MenuId
    , name : String
    , items : List Item
    }


type alias Item =
    { id : ItemId
    , name : String
    , description : String
    , price : Int
    }


type alias MenuId =
    String


type alias ItemId =
    String


type Route
    = HomeRoute
    | MenusRoute
    | MenuRoute MenuId
    | NotFoundRoute



-- INIT


initialModel : Route -> Model
initialModel route =
    ({ menus = []
     , error = ""
     , route = route
     }
    )
