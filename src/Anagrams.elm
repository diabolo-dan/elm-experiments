module Anagrams exposing (..)

import Set exposing (Set)
import Dict exposing (Dict)
import Maybe exposing (Maybe)

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
build_anagram_dict word_list =
    List.foldl add_word (Anagrams Dict.empty) word_list

add_word : String -> AnagramDict -> AnagramDict
add_word word (Anagrams anagram_dict) =
    retrieve_anagrams word (Anagrams anagram_dict) |>
    Set.insert word |>
    \set ->
        Dict.insert (anagram_key word) set anagram_dict |>
    Anagrams


retrieve_anagrams : String -> AnagramDict -> Set String
retrieve_anagrams  request (Anagrams anagram_dict) =
    Dict.get (anagram_key request) anagram_dict |>
    Maybe.withDefault Set.empty
