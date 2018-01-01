tests-translating
testNanWritePython3On
	| string |
	string := String streamContents: [ :s | Float nan writePython3On: s ].
	self assert: string equals: 'float(''nan'')'