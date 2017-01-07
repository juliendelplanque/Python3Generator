tests-translating
testCharacterWritePython3On
	| string |
	string := String streamContents: [ :s | $a writePython3On: s ].
	self assert: string equals: '''a'''