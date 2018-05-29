module AnagramsSiteTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)

import AnagramsSite exposing (..)

test_model : Model
test_model =
    model |>
    update (AddWord "rat") |>
    update (AddWord "art")

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
            , test "should have no anagrams for no word" <|
                \_ ->
                    test_model |>
                    .anagrams |>
                    Expect.equal []
            , test "should update anagrams on word change" <|
                \_ ->
                    test_model |>
                    update (Change "art") |>
                    .anagrams |>
                    Expect.equal ["art", "rat"]
            , test "should update anagrams on word addition" <|
                \_ ->
                    test_model |>
                    update (Change "art") |>
                    update (AddWord "tar") |>
                    .anagrams |>
                    Expect.equal ["art", "rat", "tar"]
            ]
        ]
