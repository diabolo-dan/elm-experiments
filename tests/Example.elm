module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Test experiment"
        [ describe "addition"
            [ test "simplest thing" <|
                \_ ->
                    1 + 1 |> Expect.equal 2
            ]
        ]
