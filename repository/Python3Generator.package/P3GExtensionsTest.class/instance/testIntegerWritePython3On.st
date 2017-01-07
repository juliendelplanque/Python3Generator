tests-translating
testIntegerWritePython3On
	| string |
	string := String streamContents: [ :s | 42 writePython3On: s ].
	self assert: string equals: '42'