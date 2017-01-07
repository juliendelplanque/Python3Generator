tests-translating
testWritePython3On
	| instructions identifier moduleIdentifier string |
	instructions := P3GInstructionsList new.
	moduleIdentifier := P3GIdentifier named: 'math'.
	identifier := P3GIdentifier named: 'hello'.
	instructions
		add: (P3GImport moduleIdentifier: moduleIdentifier);
		add: (P3GAssignment new
					target: identifier;
					toAssignate: 42;
					yourself);
		add: (P3GFunctionInvocation new
					target: moduleIdentifier;
					functionName: 'pow';
					positionalArguments: { identifier . 5 };
					yourself).
	string := String streamContents: [ :s | instructions writePython3On: s ].
	self assert: string equals: 'import math',Smalltalk os lineEnding,
	'hello = 42',Smalltalk os lineEnding,
	'math.pow(hello,5)',Smalltalk os lineEnding