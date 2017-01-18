tests-translating
testWritePython3On3
	| call string |
	call := P3GCall new
				target: 'fct' asP3GIdentifier;
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	string := String streamContents: [ :s | call writePython3On: s ].
	self assert: string equals: 'fct(hello=1,key2=42.42)'