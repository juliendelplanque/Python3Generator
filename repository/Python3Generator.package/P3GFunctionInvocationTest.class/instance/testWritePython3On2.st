tests-building
testWritePython3On2
	| invocation string |
	invocation := P3GFunctionInvocation new
						target: 'math';
						functionName: 'sin';
						positionalArguments: { 45 };
						yourself.
	string := String streamContents: [ :s | invocation writePython3On: s ].
	self assert: string equals: 'math.sin(45)'