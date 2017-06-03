translating
writePython3On: aStream
	aStream << $'.
	self string do: [ :c|
		(self charactersToEscape includesKey: c)
			ifTrue: [ aStream << (self charactersToEscape at: c) ]
			ifFalse: [ aStream << c ]
		 ].
	aStream << $'