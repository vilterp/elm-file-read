module Test where

import Html.File as File
import Html.Attributes.DragDropFile exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Signal

actions : Signal.Mailbox Action
actions = 
  Signal.mailbox NoOp

main =
  Signal.map (view actions.address) state

state =
  Signal.foldp update initState actions.signal

initState =
  { highlighted = False }

type alias Model =
  { highlighted : Bool }

type Action
  = DragEnter (List File.File)
  | DragLeave (List File.File)
  | Drop (List File.File)
  | NoOp

view addr state =
  div
    [ style
        (if state.highlighted then [("background", "red")] else [])
    , onDragEnter addr DragEnter
    , onDragLeave addr DragLeave
    , onDrop addr Drop
    ]
    [ text "sup" ]

update action state =
  case action of
    DragEnter files ->
      { state | highlighted <- True }

    DragLeave files ->
      { state | highlighted <- False }

    Drop files ->
      state -- TODO

    NoOp ->
      state