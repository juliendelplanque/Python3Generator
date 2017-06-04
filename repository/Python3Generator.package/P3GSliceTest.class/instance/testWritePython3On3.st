tests-translating
testWritePython3On3
	| slice string |
	slice := P3GSlice new
					lowerBound: 1;
					upperBound: 3;
					yourself.
	string := String streamContents: [ :s | slice writePython3On: s ].
	self assert: string equals: '1:3'