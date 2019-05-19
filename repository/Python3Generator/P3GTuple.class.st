"
I model a Python 3 typle.
That is to say, I will be written as a Python 3 tuple when serialized as source code.
"
Class {
	#name : #P3GTuple,
	#superclass : #OrderedCollection,
	#category : 'Python3Generator-Core'
}

{ #category : #writing }
P3GTuple >> writePython3On: aStream [
	aStream << '('.
	self 
		do: [ :elem | 
			elem writePython3On: aStream.
			aStream << ',' ].
	aStream << ')'.
]
