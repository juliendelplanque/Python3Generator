translating
writePython3On: aStream
	self target writePython3On: aStream.
	aStream << $..
	self attributeIdentifier writePython3On: aStream.