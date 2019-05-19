"
I define methods to allow easy call on Python 3 object's.
"
Trait {
	#name : #P3GCallable,
	#category : 'Python3Generator-Traits'
}

{ #category : #call }
P3GCallable >> call [
	^ self callWith: #()
]

{ #category : #call }
P3GCallable >> callWith: anArrayOrADictionary [
	^ anArrayOrADictionary p3gCallArgumentsOf: self
]

{ #category : #call }
P3GCallable >> callWith: anArray with: aDictionary [
	^ P3GCall target: self positionalArguments: anArray keywordArguments: aDictionary
]
