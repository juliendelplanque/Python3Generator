accessing
charactersToEscape
	^ charactersToEscape
		ifNil: [ charactersToEscape := {
			($\ -> '\\').
			($' -> '\''').
			($" -> '\"').
			((Character codePoint: 7)  -> '\a').	"BEL"
			((Character codePoint: 8)  -> '\b').	"BS"
			((Character codePoint: 12) -> '\f').	"FF"
			(Character lf              -> '\n').	"LF"
			(Character cr              -> '\r').	"CR"
			(Character tab             -> '\t').	"TAB"
			((Character codePoint: 11) -> '\v')	"VT"} asDictionary ]