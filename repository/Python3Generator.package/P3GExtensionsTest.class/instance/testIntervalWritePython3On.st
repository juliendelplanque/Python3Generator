tests-translating
testIntervalWritePython3On
	| string expected |
	string := String streamContents: [ :s | (1 to: 4) writePython3On: s ].
	self assert: string equals: 'range(1,5,1)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 2) writePython3On: s ].
	self assert: string equals: 'range(1,5,2)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 0.5) writePython3On: s ].
	expected := String streamContents: [ :s | (1 to: 4 by: 0.5) asArray writePython3On: s ].
	self assert: string equals: expected