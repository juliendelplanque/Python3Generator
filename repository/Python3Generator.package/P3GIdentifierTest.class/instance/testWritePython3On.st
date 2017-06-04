tests-translating
testWritePython3On
	| identifier string |
	identifier := P3GIdentifier new
						name: 'id';
						yourself.
	string := String streamContents: [ :s | identifier writePython3On: s ].
	self assert: string equals: 'id'