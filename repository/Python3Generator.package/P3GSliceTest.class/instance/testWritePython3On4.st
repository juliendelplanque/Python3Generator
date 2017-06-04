tests-translating
testWritePython3On4
	| slice string |
	slice := P3GSlice new
					lowerBound: 1;
					upperBound: 3;
					stride: 1;
					yourself.
	string := String streamContents: [ :s | slice writePython3On: s ].
	self assert: string equals: '1:3:1'