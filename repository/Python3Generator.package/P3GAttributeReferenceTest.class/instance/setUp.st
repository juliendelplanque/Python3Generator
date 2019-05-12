running
setUp
	super setUp.
	attrRef := P3GAttributeReference new
						target: 'var' asP3GIdentifier;
						attributeIdentifier: 'attr' asP3GIdentifier;
						yourself.