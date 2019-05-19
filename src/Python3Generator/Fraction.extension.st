Extension { #name : #Fraction }

{ #category : #'*Python3Generator' }
Fraction >> writePython3On: aStream [
	self asFloat writePython3On: aStream
]
