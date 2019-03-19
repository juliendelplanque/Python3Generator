accessing
writePython3On: aStream
	aStream << '(lambda '.
	arguments 
		do: [ :arg | arg writePython3On: aStream ]
		separatedBy: [ aStream << ', ' ].
	aStream << ': '.
	expression writePython3On: aStream.
	aStream << ')'.