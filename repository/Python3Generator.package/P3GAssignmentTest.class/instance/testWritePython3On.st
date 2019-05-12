tests-translating
testWritePython3On
	| string |
	string := String streamContents: [ :s | assignment writePython3On: s ].
	self assert: string equals: 'variable = 42'