tests-translating
testFloatWritePython3On
	| string |
	string := String streamContents: [ :s | 3.1415 writePython3On: s ].
	self assert: string equals: '3.1415'