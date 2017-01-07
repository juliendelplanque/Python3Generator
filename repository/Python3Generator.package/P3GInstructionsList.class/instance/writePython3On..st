translating
writePython3On: aStream
	self do: [ :instr |
		instr writePython3On: aStream.
		aStream
			<< Smalltalk os lineEnding ]