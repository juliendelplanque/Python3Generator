tests-translating
testUndefinedObjectWritePython3On
	| string |
	string := String streamContents: [ :s | nil writePython3On: s ].
	self assert: string equals: 'None'