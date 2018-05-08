module AnagramsTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)

import Anagrams

suite : Test
suite =
    describe "Anagrams"
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
                    Expect.equal ["evil", "vile", "live", "veil"]
            , test "should ignore case"  <|
              \_ ->
                    Anagrams.anagrams ["Rat", "Tar"] "Art" |>
                    Expect.equal ["Rat", "Tar"]
            , test "should ignore whitespace"  <|
              \_ ->
                    Anagrams.anagrams ["rat ", "tar\n"] "art" |>
                    Expect.equal ["rat", "tar"]
            ]
