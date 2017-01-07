tests-building
testBuildInvocationOn1
	| invocation string |
	invocation := P3GFunctionInvocation new
						functionName: 'print';
						positionalArguments: { 'hello' };
						yourself.
	string := String streamContents: [ :s | invocation writePython3On: s ].
	self assert: string equals: 'print(''hello'')'