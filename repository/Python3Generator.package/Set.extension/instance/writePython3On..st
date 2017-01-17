*Python3Generator
writePython3On: aStream
	self ifEmpty: [ "If empty, can't use '{}' or Python will think it is a dict."
		P3GFunctionInvocation new
			functionName: 'set';
			writePython3On: aStream.
		^ self ].
	
	aStream << ${.
	self do: [ :item | item writePython3On: aStream ] separatedBy: [ aStream << $, ].
	aStream << $}