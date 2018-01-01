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
		add: (P3GCall new
					target: (P3GAttributeReference target: moduleIdentifier attributeIdentifier: 'pow' asP3GIdentifier);
					positionalArguments: { identifier . 5 };
					yourself).
	string := String streamContents: [ :s | instructions writePython3On: s ].
	self assert: string equals: ('import math{1}hello = 42{1}math.pow(hello,5){1}' format: { Smalltalk os lineEnding })