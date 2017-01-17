tests-translating
testByteArrayWritePython3On
	| string |
	string := String streamContents: [ :s | #[1 2 3 4] writePython3On: s ].
	self assert: string equals: 'bytearray([1,2,3,4])'