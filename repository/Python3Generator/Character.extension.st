Extension { #name : #Character }

{ #category : #'*Python3Generator' }
Character >> writePython3On: aStream [
	aStream
		<< $';
		<< self;
		<< $'
]
