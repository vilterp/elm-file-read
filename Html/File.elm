module Html.File where

{-|
@docs MimeType, File, mimeType, file, domList, readAsText -}

import Native.Html.File
import Json.Decode as Decode
import Task


{-|-}
type alias MimeType =
  String


{-|-}
type File
  = File


{-|-}
mimeType : File -> MimeType
mimeType =
  Native.File.mimeType


{-|-}
file : Decode.Decoder File
file =
  Native.File.decodeFile


{-|-}
domList : Decode.Decoder a -> Decode.Decoder (List a)
domList =
  Native.File.decodeDomList


{-|-}
readAsText : File -> Task.Task String String
readAsText =
  Native.File.readAsText
