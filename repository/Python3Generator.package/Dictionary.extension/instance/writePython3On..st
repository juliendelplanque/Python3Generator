*Python3Generator
writePython3On: aWriteStream 
	aWriteStream << ${.
	self associations do: [ :assoc |
		assoc head writePython3On: aWriteStream.
		aWriteStream << ' : '.
		assoc tail writePython3On: aWriteStream ] separatedBy: [ aWriteStream << ' , ' ].
	aWriteStream << $}