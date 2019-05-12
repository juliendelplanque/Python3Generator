tests-translating
testWritePython3On
	| string |
	string := String streamContents: [ :s | operator writePython3On: s ].
	self assert: string equals: '~1'