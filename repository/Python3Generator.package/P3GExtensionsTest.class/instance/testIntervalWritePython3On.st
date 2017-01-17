tests-translating
testIntervalWritePython3On
	| string |
	string := String streamContents: [ :s | (1 to: 4) writePython3On: s ].
	self assert: string equals: 'range(1,5,1)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 2) writePython3On: s ].
	self assert: string equals: 'range(1,5,2)'