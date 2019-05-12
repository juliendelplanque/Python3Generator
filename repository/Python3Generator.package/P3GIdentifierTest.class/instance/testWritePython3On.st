tests-translating
testWritePython3On
	| string |
	string := String streamContents: [ :s | identifier writePython3On: s ].
	self assert: string equals: 'id'