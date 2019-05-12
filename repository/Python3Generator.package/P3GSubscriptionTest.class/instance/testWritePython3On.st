tests-translating
testWritePython3On
	| string |
	string := String streamContents: [ :s | subscription writePython3On: s ].
	self assert: string equals: 'test[2]'