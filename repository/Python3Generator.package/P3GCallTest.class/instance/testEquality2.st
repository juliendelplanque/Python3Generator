tests
testEquality2
	| toBeEqual call |
	call := P3GCall new
				target: 'fct' asP3GIdentifier;
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	toBeEqual := call copy.
	self deny: call == toBeEqual.
	self assert: call equals: toBeEqual.