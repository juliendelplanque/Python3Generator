tests-translating
testStringWritePython3On
	| string |
	string := String streamContents: [ :s | 'hello' writePython3On: s ].
	self assert: string equals: '''hello'''.
	string := String streamContents: [ :s | 'hello\a' writePython3On: s ].
	self assert: string equals: '''hello\\a'''.
	string := String streamContents: [ :s | 'hello',String cr writePython3On: s ].
	self assert: string equals: '''hello\r'''