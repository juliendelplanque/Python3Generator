translating
writePython3On: aStream
	self target writePython3On: aStream.
	aStream << $[.
	self insideBrackets writePython3On: aStream.
	aStream << $]