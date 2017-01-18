tests-translating
testWritePython3On4
	| call string |
	call := P3GCall new
				target: 'function' asP3GIdentifier;
				positionalArguments: { 'positional1' . 38 };
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	string := String streamContents: [ :s | call writePython3On: s ].
	self assert: string equals: 'function(''positional1'',38,hello=1,key2=42.42)'