Extension { #name : #ByteArray }

{ #category : #'*Python3Generator' }
ByteArray >> writePython3On: aStream [
	P3GCall new
		target: 'bytearray' asP3GIdentifier;
		positionalArguments:  { self asArray };
		writePython3On: aStream
]
