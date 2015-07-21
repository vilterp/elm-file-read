Elm.Native = Elm.Native || {};
Elm.Native.Html = Elm.Native.Html || {};
Elm.Native.Html.File = Elm.Native.Html.File || {};

Elm.Native.Html = {};
Elm.Native.Html.File = {};
Elm.Native.Html.File.make = function(localRuntime) {
	localRuntime.Native = localRuntime.Native || {};
	localRuntime.Native.Html = localRuntime.Native.Html || {};
	localRuntime.Native.Html.File = localRuntime.Native.Html.File || {};
	if ('values' in localRuntime.Native.Html.File)
	{
		return localRuntime.Native.Html.File.values;
	}

	var Task = Elm.Native.Task.make (localRuntime);
	var Utils = Elm.Native.Utils.make (localRuntime);
	var List = Elm.Native.List.make (localRuntime);

	function mimeType(file) {
		return file.type;
	}

	function decodeFile(value)
	{
		if(value instanceof File) {
			return value;
		} else {
			throw new Error("expecting File");
		}
	}

	function decodeDomList(decoder)
	{
		if(value.length && value.item) {
			var files = [];
			for(var i=0; i < value.length; i++) {
				files.push(decoder(value[i]));
			}
			return Utils.fromArray(files);
		} else {
			throw new Error("expecting a dom list");
		}
	}

	function readAsText(file)
	{
		return Task.asyncFunction(function(callback) {
			var reader = new FileReader();
			reader.addEventListener('load', function(evt) {
				callback(Task.succeed(reader.result));
			});
			reader.addEventListener('error', function(evt) {
				callback(Task.fail(evt.type));
			});
			reader.readAsText(file);
		});
	}

	return localRuntime.Native.Html.File.values = {
		mimeType: mimeType,
		decodeFile: decodeFile,
		decodeDomList: decodeDomList,
		readAsText: readAsText
	};
};
