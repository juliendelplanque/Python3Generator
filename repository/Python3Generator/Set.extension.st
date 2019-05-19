Extension { #name : #Set }

{ #category : #'*Python3Generator' }
Set >> writePython3On: aStream [
	self ifEmpty: [ "If empty, can't use '{}' or Python will think it is a dict."
		P3GCall new
		target: 'set' asP3GIdentifier;
		writePython3On: aStream.
		^ self ].
	
	aStream << ${.
	self do: [ :item | item writePython3On: aStream ] separatedBy: [ aStream << $, ].
	aStream << $}
]
