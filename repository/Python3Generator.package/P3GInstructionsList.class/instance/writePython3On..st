translating
writePython3On: aStream
	self do: [ :instr |
		self indentationsCount timesRepeat: [ aStream << self indentationChar ].
		instr writePython3On: aStream.
		aStream
			<< Smalltalk os lineEnding ]