translating
writePython3On: aStream
	self lowerBound
		ifNotNil: [ self lowerBound writePython3On: aStream ].
	
	aStream << $:.
	
	self upperBound ifNotNil: [
		self upperBound writePython3On: aStream ].
	
	self stride ifNil: [ ^ self ].
	aStream << $:.
	self stride writePython3On: aStream.