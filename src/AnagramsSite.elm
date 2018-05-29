module AnagramsSite exposing (..)
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import Anagrams exposing (anagrams)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { word_list : List String,
    word : String,
    anagrams : List String
  }

model : Model
model =
  { word_list = [],
    word = "",
    anagrams = []
  }


-- UPDATE

type Msg
  = Change String | AddWord String

update : Msg -> Model -> Model
update msg model =
  update_anagrams <|
  case msg of
    Change new_word ->
      { model | word = new_word}
    AddWord word ->
      { model | word_list = word :: model.word_list }

update_anagrams : Model -> Model
update_anagrams model =
    {model | anagrams = anagrams model.word_list model.word }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Word List", onInput AddWord ] []
    , input [ placeholder "Word to anagram", onInput Change ] []
    , div [] [ text (String.join ",\n" model.anagrams) ]
    ]
