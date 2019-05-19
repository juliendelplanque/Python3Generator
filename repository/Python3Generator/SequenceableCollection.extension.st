Extension { #name : #SequenceableCollection }

{ #category : #'*Python3Generator' }
SequenceableCollection >> p3gCallArgumentsOf: aP3GCallable [
	^ P3GCall target: aP3GCallable positionalArguments: self
]

{ #category : #'*Python3Generator' }
SequenceableCollection >> writePython3On: aStream [
	aStream << $[.
	self do: [ :item | item writePython3On: aStream ] separatedBy: [ aStream << $, ].
	aStream << $]
]
