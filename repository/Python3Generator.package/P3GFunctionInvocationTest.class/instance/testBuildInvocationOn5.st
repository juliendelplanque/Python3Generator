tests-building
testBuildInvocationOn5
	| invocation |
	invocation := P3GFunctionInvocation new
						functionName: 'fct';
						keywordArguments: { 1 -> 'badkey'. 'key2' -> 42.42 } asDictionary;
						yourself.
	self should: [ String streamContents: [ :s | invocation writePython3On: s ] ] raise: Error.