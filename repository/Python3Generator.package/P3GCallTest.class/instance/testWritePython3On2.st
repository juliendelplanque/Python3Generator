tests-translating
testWritePython3On2
	| call string |
	call := P3GCall new
				target: (P3GAttributeReference
								target: 'math' asP3GIdentifier
								attributeIdentifier: 'sin' asP3GIdentifier);
				positionalArguments: { 45 };
				yourself.
	string := String streamContents: [ :s | call writePython3On: s ].
	self assert: string equals: 'math.sin(45)'