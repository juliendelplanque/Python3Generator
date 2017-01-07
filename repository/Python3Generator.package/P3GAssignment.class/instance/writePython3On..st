translating
writePython3On: aStream
	self target writePython3On: aStream.
	aStream
		<< ' = '.
	self toAssignate writePython3On: aStream