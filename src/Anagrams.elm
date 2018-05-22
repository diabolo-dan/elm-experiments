module Anagrams exposing (..)
import Set exposing (Set)

anagrams : List String -> String -> List String
anagrams wordlist word =
    wordlist |>
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


