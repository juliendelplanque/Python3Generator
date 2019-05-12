tests-translating
testWritePython3On
	| string |
	string := String streamContents: [ :s | import writePython3On: s ].
	self assert: string equals: 'import math'