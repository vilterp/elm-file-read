module Html.Attributes.DragDropFile
    ( onDragEnter, onDragLeave, onDrop
    ) where

{-|
@docs onDragEnter, onDragLeave, onDrop -}

import Signal
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode exposing (..)

import Html.File exposing (..)


handleEvent : String -> Signal.Address a -> (List File -> a) -> Attribute
handleEvent name addr fun =
  onWithOptions
    name
    { defaultOptions | preventDefault <- True }
    (at ["dataTransfer", "files"] <| domList file)
    (\files -> Signal.message addr (fun files))


{-|-}
onDragEnter : Signal.Address a -> (List File -> a) -> Attribute
onDragEnter =
  handleEvent "mouseover"


{-|-}
onDragLeave : Signal.Address a -> (List File -> a) -> Attribute
onDragLeave =
  handleEvent "dragleave"


{-|-}
onDrop : Signal.Address a -> (List File -> a) -> Attribute
onDrop =
  handleEvent "drop"
