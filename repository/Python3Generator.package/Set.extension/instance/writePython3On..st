*Python3Generator
writePython3On: aStream
	aStream << ${.
	self do: [ :item | item writePython3On: aStream ] separatedBy: [ aStream << $, ].
	aStream << $}