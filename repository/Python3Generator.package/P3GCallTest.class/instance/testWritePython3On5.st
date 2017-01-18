tests-translating
testWritePython3On5
	| call |
	call := P3GCall new
				target: 'fct' asP3GIdentifier;
				keywordArguments: { 1 -> 'badkey'. 'key2' -> 42.42 } asDictionary;
				yourself.
	self should: [ String streamContents: [ :s | call writePython3On: s ] ] raise: Error.