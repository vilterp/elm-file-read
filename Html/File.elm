module Html.File where

{-|
@docs MimeType, File, FileName, mimeType, size, file, domList, readAsText, download
-}

import Native.Html.File
import Json.Decode as Decode
import Task


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
readAsText : File -> Task.Task String String
readAsText =
  Native.Html.File.readAsText


{-| Given contents, mime type, and name, force browser
to save the given contents.

Current state:

- Chrome: works
- FF: works
- Safari: opens in new tab
  -}
download : String -> MimeType -> FileName -> Task.Task x ()
download =
  Native.Html.File.download
