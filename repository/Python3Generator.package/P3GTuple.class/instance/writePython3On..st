writing
writePython3On: aStream
	aStream << '('.
	self 
		do: [ :elem | 
			elem writePython3On: aStream.
			aStream << ',' ].
	aStream << ')'.