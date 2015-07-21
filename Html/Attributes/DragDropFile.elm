module Html.Attributes.DragDropFile where

{-|
@docs onDragEnter, onDragLeave, onDrop -}

import Signal
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Html.File exposing (..)


{-|-}
onDragEnter : Signal.Address (List File) -> Attribute
onDragEnter addr =
  onWithOptions
    "dragenter"
    { defaultOptions | preventDefault <- True }
    (domList file)
    (Signal.message addr)


{-|-}
onDragLeave : Signal.Address (List File) -> Attribute
onDragLeave addr =
  onWithOptions
    "dragleave"
    { defaultOptions | preventDefault <- True }
    (domList file)
    (Signal.message addr)


{-|-}
onDrop : Signal.Address (List File) -> Attribute
onDrop addr =
  onWithOptions
    "drop"
    { defaultOptions | preventDefault <- True }
    (domList file)
    (Signal.message addr)