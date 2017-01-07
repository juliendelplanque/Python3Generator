comparing
= anObject
	^ self class = anObject class
		and: [ self moduleIdentifier = anObject moduleIdentifier ]