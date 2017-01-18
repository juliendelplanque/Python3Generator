tests-translating
testWritePython3On
	| call string |
	call := P3GCall new
				target: 'print' asP3GIdentifier;
				positionalArguments: { 'hello' };
				yourself.
	string := String streamContents: [ :s | call writePython3On: s ].
	self assert: string equals: 'print(''hello'')'