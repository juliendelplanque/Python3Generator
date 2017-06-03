instance creation
target: target attributeIdentifier: identifier
	^ self new
		target: target asP3GIdentifier;
		attributeIdentifier: identifier;
		yourself