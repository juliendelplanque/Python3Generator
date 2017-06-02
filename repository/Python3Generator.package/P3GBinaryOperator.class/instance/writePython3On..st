translating
writePython3On: aStream
	self left writePython3On: aStream.
	aStream << self operator.
	self right writePython3On: aStream