translating
writePython3On: aStream
	self target writePython3On: aStream.
	aStream << $(.
	self positionalArguments 
		do: [ :arg | arg writePython3On: aStream ]
		separatedBy: [ aStream << $, ].
	(self positionalArguments isNotEmpty and: [ 
		self keywordArguments isNotEmpty ])
			ifTrue: [ aStream << $, ].
	self keywordArguments associations
		do: [ :assoc |
			assoc key isString
				ifFalse: [ self error: 'Keys of keyword arguments dict must be strings.' ].
			aStream << assoc key.
			aStream << $=.
			assoc value writePython3On: aStream ]
		separatedBy: [ aStream << $, ].
	aStream
		<< $)