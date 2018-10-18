*Python3Generator
writePython3On: aWriteStream 
	aWriteStream << ${.
	self associations do: [ :assoc |
		assoc key writePython3On: aWriteStream.
		aWriteStream << ' : '.
		assoc value writePython3On: aWriteStream ] separatedBy: [ aWriteStream << ' , ' ].
	aWriteStream << $}