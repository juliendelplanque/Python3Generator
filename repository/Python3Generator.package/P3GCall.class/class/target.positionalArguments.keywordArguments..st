instance creation
target: aStringOrP3GIdentifier positionalArguments: anArray keywordArguments: aDictionary
	^ self new
		target: aStringOrP3GIdentifier asP3GIdentifier;
		positionalArguments: anArray;
		keywordArguments: aDictionary;
		yourself