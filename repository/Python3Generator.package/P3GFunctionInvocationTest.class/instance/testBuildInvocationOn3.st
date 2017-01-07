tests-building
testBuildInvocationOn3
	| invocation string |
	invocation := P3GFunctionInvocation new
						functionName: 'function';
						positionalArguments: { 'positional1' . 38 };
						keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
						yourself.
	string := String streamContents: [ :s | invocation writePython3On: s ].
	self assert: string equals: 'function(''positional1'',38,hello=1,key2=42.42)'