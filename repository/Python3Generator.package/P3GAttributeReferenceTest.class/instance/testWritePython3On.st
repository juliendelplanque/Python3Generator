tests-translating
testWritePython3On
	| string |
	string := String streamContents: [ :s | attrRef writePython3On: s ].
	self assert: string equals: 'var.attr'