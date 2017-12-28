*Python3Generator
writePython3On: aStream
	self isNaN
		ifTrue: [ 
			aStream << 'numpy.nan'.
			^ self ].
	
	self printOn: aStream