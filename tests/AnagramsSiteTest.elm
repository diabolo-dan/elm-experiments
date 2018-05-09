module AnagramsSiteTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)

import AnagramsSite exposing (..)

suite : Test
suite =
    describe "Anagrams Site"
        [ describe "Model"
            [ test "should initialise empty words" <|
                \_ ->
                    model.word |>
                    Expect.equal ""
            , test "should initialise empty word list" <|
                \_ ->
                    model.word_list |>
                    Expect.equal []
            , test "should initialise empty anagrams" <|
                \_ ->
                    model.anagrams |>
                    Expect.equal []
            ]
        , describe "Update"
            [ test "should change word" <|
                \_ ->
                    model |>
                    update (Change "word") |>
                    .word |>
                    Expect.equal "word"
            , test "should add to word list" <|
                \_ ->
                    model |>
                    update (AddWord "word") |>
                    .word_list |>
                    Expect.equal ["word"]
            ]
        ]
