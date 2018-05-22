module Anagrams exposing (..)

import Set exposing (Set)
import Dict exposing (Dict)

type AnagramDict = Anagrams (Dict String (Set String))

anagrams : List String -> String -> List String
anagrams word_list word =
    word_list |>
    List.map String.trim |>
    List.filter (filter_anagrams word) |>
    Set.fromList |>
    Set.toList

anagram_key : String -> String
anagram_key word =
    String.toLower word |>
    String.toList |>
    List.sort |>
    String.fromList

filter_anagrams : String -> String -> Bool
filter_anagrams word1 word2 =
  anagram_key word1 == anagram_key word2

build_anagram_dict : List String -> AnagramDict
build_anagram_dict word_list = Anagrams Dict.empty

retrieve_anagrams : String -> AnagramDict -> Set String
retrieve_anagrams  request anagram_dict = Set.empty
