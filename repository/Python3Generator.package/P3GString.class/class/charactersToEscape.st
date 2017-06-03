accessing
charactersToEscape
	^ charactersToEscape
		ifNil: [ charactersToEscape := {
			($\ -> '\\').
			($' -> '\''').
			($" -> '\"').
			((Character codePoint: 7) -> '\a').	"BEL"
			((Character codePoint: 8) -> '\b').	"BS"
			((Character codePoint: 12) -> '\f').	"FF"
			((Character codePoint: 10) -> '\n').	"LF"
			((Character codePoint: 15) -> '\r').	"CR"
			((Character codePoint: 9) -> '\t').	"TAB"
			((Character codePoint: 11) -> '\v')	"VT"} asDictionary ]