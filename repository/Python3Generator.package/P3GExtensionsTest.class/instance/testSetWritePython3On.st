tests-translating
testSetWritePython3On
	| string |
	string := String streamContents: [ :s | #(1 2 3 4) asSet writePython3On: s ].
	self assert: string equals: '{1,2,3,4}'