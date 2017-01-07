tests-translating
testWritePython3On
	| assignment string |
	assignment := P3GAssignment new
						target: (P3GIdentifier named: 'variable');
						toAssignate: 42;
						yourself.
	string := String streamContents: [ :s | assignment writePython3On: s ].
	self assert: string equals: 'variable = 42'