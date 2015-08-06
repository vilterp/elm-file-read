module Html.File where

{-|
@docs MimeType, File, FileName, mimeType, size, file, domList, readAsText, download
-}

import Json.Decode as Decode
import Task exposing (Task)

import Native.Html.File


{-|-}
type alias MimeType =
  String


{-|-}
type alias FileName =
  String


{-|-}
type File
  = File


{-|-}
mimeType : File -> MimeType
mimeType =
  Native.Html.File.mimeType


{-|-}
size : File -> Int
size =
  Native.Html.File.size


{-|-}
file : Decode.Decoder File
file =
  Native.Html.File.decodeFile


{-|-}
domList : Decode.Decoder a -> Decode.Decoder (List a)
domList =
  Native.Html.File.decodeDomList


{-|-}
readAsText : File -> Task String String
readAsText =
  Native.Html.File.readAsText


{-| Given contents, mime type, and name, force browser
to save the given contents.

Current state:

- Chrome: works
- FF: works
- Safari: opens in new tab
-}
download : String -> MimeType -> FileName -> Task x ()
download =
  Native.Html.File.download


{-| Make a file picker dialog pop up; return the files the user picks. -}
pickFiles : Task x (List File)
pickFiles =
  Native.Html.File.pickFiles
