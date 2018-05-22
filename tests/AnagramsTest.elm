module AnagramsTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)

import Dict exposing (Dict)
import Set exposing (Set)

import Anagrams

suite : Test
suite =
    describe "Anagrams"
        [ describe "anagram function"
            [ test "should return empty list of anagrams when given the empty string" <|
                \_ ->
                    Expect.equal (Anagrams.anagrams [] "" ) []
            , test "should return itself when in word list" <|
              \_ ->
                    Expect.equal (Anagrams.anagrams ["word"] "word") ["word"]
            , test "should return nothign when no anagram in word list" <|
              \_ ->
                    Expect.equal (Anagrams.anagrams ["word"] "anagram") []
            , test "should return an anagram if it exists" <|
              \_ ->
                    Expect.equal (Anagrams.anagrams ["word"] "wrod") ["word"]
            , test "should return only anagrams" <|
              \_ ->
                    Expect.equal (Anagrams.anagrams ["word", "other"] "wrod") ["word"]
            , test "should return all anagrams" <|
              \_ ->
                    Anagrams.anagrams ["evil", "vile", "live", "veil", "good", "gut", "word", "anagram"] "evil" |>
                    Expect.equal ["evil", "live", "veil", "vile"]
            , test "should ignore case"  <|
              \_ ->
                    Anagrams.anagrams ["Rat", "Tar"] "Art" |>
                    Expect.equal ["Rat", "Tar"]
            , test "should ignore whitespace"  <|
              \_ ->
                    Anagrams.anagrams ["rat ", "tar\n"] "art" |>
                    Expect.equal ["rat", "tar"]
            , test "should ignore duplicates"  <|
              \_ ->
                    Anagrams.anagrams ["rat ", "rat", "rat"] "art" |>
                    Expect.equal ["rat"]
            ]
        , describe "angram dict builder"
            [ test "should produce no result" <|
                \_ ->
                    (Anagrams.build_anagram_dict []) |>
                    Anagrams.retrieve_anagrams "rat" |>
                    Expect.equal Set.empty
            , test "should retrieve word added" <|
                \_ ->
                    (Anagrams.build_anagram_dict ["rat"]) |>
                    Anagrams.retrieve_anagrams "rat" |>
                    Expect.equal (Set.singleton "rat")
            , test "should not retrieve word added for different request" <|
                \_ ->
                    (Anagrams.build_anagram_dict ["rat"]) |>
                    Anagrams.retrieve_anagrams "other" |>
                    Expect.equal Set.empty
            , test "should  retrieve word added by anagram" <|
                \_ ->
                    (Anagrams.build_anagram_dict ["rat"]) |>
                    Anagrams.retrieve_anagrams "art" |>
                    Expect.equal (Set.singleton "rat")
            , test "should  retrieve multiple anagrams" <|
                \_ ->
                    (Anagrams.build_anagram_dict ["rat", "art"]) |>
                    Anagrams.retrieve_anagrams "art" |>
                    Set.toList |>
                    Expect.equal ["art", "rat"]
            , test "should  ignore whitespace and case" <|
                \_ ->
                    (Anagrams.build_anagram_dict ["Rat", "Tar\n", "art ", "other"]) |>
                    Anagrams.retrieve_anagrams "art" |>
                    Set.toList |>
                    Expect.equal ["Rat", "Tar", "art"]
            ]
        ]
