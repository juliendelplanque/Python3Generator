tests-translating
testWritePython3On
	| slice string |
	slice := P3GSlice new
					lowerBound: 1;
					yourself.
	string := String streamContents: [ :s | slice writePython3On: s ].
	self assert: string equals: '1:'