tests-translating
testWritePython3On
	| attrRef string |
	attrRef := P3GAttributeReference new
						target: 'var' asP3GIdentifier;
						attributeIdentifier: 'attr' asP3GIdentifier;
						yourself.
	string := String streamContents: [ :s | attrRef writePython3On: s ].
	self assert: string equals: 'var.attr'