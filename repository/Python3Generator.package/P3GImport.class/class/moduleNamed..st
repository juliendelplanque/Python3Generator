instance creation
moduleNamed: aString
	^ self new
		moduleIdentifier: (P3GIdentifier named: aString);
		yourself