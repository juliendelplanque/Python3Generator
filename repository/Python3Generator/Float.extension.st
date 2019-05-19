Extension { #name : #Float }

{ #category : #'*Python3Generator' }
Float >> writePython3On: aStream [
	self isNaN
		ifTrue: [ 
			('float' asP3GIdentifier callWith: { 'nan' asP3GString })
				writePython3On: aStream.
			^ self ].
	
	self printOn: aStream
]
