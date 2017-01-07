tests-translating
testFalseWritePython3On
	| string |
	string := String streamContents: [ :s | false writePython3On: s ].
	self assert: string equals: 'False'