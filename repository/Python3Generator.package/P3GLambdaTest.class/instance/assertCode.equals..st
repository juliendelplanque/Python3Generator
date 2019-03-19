tests
assertCode: expr equals: targetStr
	| string |
	string := String streamContents: [ :s | expr writePython3On: s ].
	self assert: string equals: targetStr