tests-translating
testTrueWritePython3On
	| string |
	string := String streamContents: [ :s | true writePython3On: s ].
	self assert: string equals: 'True'