Extension { #name : #Dictionary }

{ #category : #'*Python3Generator' }
Dictionary >> p3gCallArgumentsOf: aP3GCallable [
	^ P3GCall target: aP3GCallable keywordArguments: self
]

{ #category : #'*Python3Generator' }
Dictionary >> writePython3On: aWriteStream [ 
	aWriteStream << ${.
	self associations do: [ :assoc |
		assoc key writePython3On: aWriteStream.
		aWriteStream << ' : '.
		assoc value writePython3On: aWriteStream ] separatedBy: [ aWriteStream << ' , ' ].
	aWriteStream << $}
]
