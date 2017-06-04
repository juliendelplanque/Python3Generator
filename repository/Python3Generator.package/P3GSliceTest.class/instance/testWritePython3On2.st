tests-translating
testWritePython3On2
	| slice string |
	slice := P3GSlice new
					upperBound: 1;
					yourself.
	string := String streamContents: [ :s | slice writePython3On: s ].
	self assert: string equals: ':1'