"
I am a call to apply on a callable target.
"
Class {
	#name : #P3GCall,
	#superclass : #P3GGenerable,
	#traits : 'P3GTExecutable + P3GAttributeAccess + P3GCallable + P3GSubscriptionable',
	#classTraits : 'P3GTExecutable classTrait + P3GAttributeAccess classTrait + P3GCallable classTrait + P3GSubscriptionable classTrait',
	#instVars : [
		'target',
		'positionalArguments',
		'keywordArguments'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #examples }
P3GCall class >> example1 [
	(P3GCall target: 'print' asP3GIdentifier positionalArguments: #('hello world') keywordArguments: {'end' -> ''} asDictionary) generate inspect
]

{ #category : #examples }
P3GCall class >> example2 [
	(P3GCall target: 'print' asP3GIdentifier positionalArguments: #('hello world')) generate inspect
]

{ #category : #'instance creation' }
P3GCall class >> target: aStringOrP3GIdentifier [
	^ self target: aStringOrP3GIdentifier positionalArguments: nil
]

{ #category : #'instance creation' }
P3GCall class >> target: aStringOrP3GIdentifier keywordArguments: aDictionary [
	^ self target: aStringOrP3GIdentifier positionalArguments: nil keywordArguments: aDictionary
]

{ #category : #'instance creation' }
P3GCall class >> target: aStringOrP3GIdentifier positionalArguments: anArray [
	^ self target: aStringOrP3GIdentifier positionalArguments: anArray keywordArguments: nil
]

{ #category : #'instance creation' }
P3GCall class >> target: aP3GIdentifier positionalArguments: anArray keywordArguments: aDictionary [
	^ self new
		target: aP3GIdentifier;
		positionalArguments: anArray;
		keywordArguments: aDictionary;
		yourself
]

{ #category : #comparing }
P3GCall >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ target = anObject target
		and: [ self keywordArguments = anObject keywordArguments
				and: [ self positionalArguments = anObject positionalArguments ] ]
]

{ #category : #comparing }
P3GCall >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ target hash
		bitXor: (self keywordArguments hash bitXor: self positionalArguments hash)
]

{ #category : #accessing }
P3GCall >> keywordArguments [
	^ keywordArguments ifNil: [ Dictionary new ]
]

{ #category : #accessing }
P3GCall >> keywordArguments: anObject [
	keywordArguments := anObject
]

{ #category : #accessing }
P3GCall >> positionalArguments [
	^ positionalArguments ifNil: [ #() ]
]

{ #category : #accessing }
P3GCall >> positionalArguments: anObject [
	positionalArguments := anObject
]

{ #category : #accessing }
P3GCall >> target [
	^ target
]

{ #category : #accessing }
P3GCall >> target: anObject [
	target := anObject
]

{ #category : #translating }
P3GCall >> writePython3On: aStream [
	self target writePython3On: aStream.
	aStream << $(.
	self positionalArguments 
		do: [ :arg | arg writePython3On: aStream ]
		separatedBy: [ aStream << $, ].
	(self positionalArguments isNotEmpty and: [ 
		self keywordArguments isNotEmpty ])
			ifTrue: [ aStream << $, ].
	self keywordArguments associations
		do: [ :assoc |
			assoc key isString
				ifFalse: [ self error: 'Keys of keyword arguments dict must be strings.' ].
			aStream << assoc key.
			aStream << $=.
			assoc value writePython3On: aStream ]
		separatedBy: [ aStream << $, ].
	aStream
		<< $)
]
