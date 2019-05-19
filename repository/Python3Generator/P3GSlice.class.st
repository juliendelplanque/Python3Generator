"
I am a Python 3 slice.

According to the documentation:
A slicing selects a range of items in a sequence object (e.g., a string, tuple or list).
"
Class {
	#name : #P3GSlice,
	#superclass : #P3GGenerable,
	#instVars : [
		'lowerBound',
		'upperBound',
		'stride'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #'instance creation' }
P3GSlice class >> lowerBound: anObject upperBound: anotherObject [
	^ self lowerBound: anObject upperBound: anotherObject stride: nil
]

{ #category : #'instance creation' }
P3GSlice class >> lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject [
	^ self new
		lowerBound: anObject;
		upperBound: anotherObject;
		stride: yetAnotherObject;
		yourself
]

{ #category : #comparing }
P3GSlice >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ lowerBound = anObject lowerBound
		and: [ stride = anObject stride and: [ upperBound = anObject upperBound ] ]
]

{ #category : #comparing }
P3GSlice >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ lowerBound hash bitXor: (stride hash bitXor: upperBound hash)
]

{ #category : #accessing }
P3GSlice >> lowerBound [
	^ lowerBound
]

{ #category : #accessing }
P3GSlice >> lowerBound: anObject [
	lowerBound := anObject
]

{ #category : #accessing }
P3GSlice >> stride [
	^ stride
]

{ #category : #accessing }
P3GSlice >> stride: anObject [
	stride := anObject
]

{ #category : #accessing }
P3GSlice >> upperBound [
	^ upperBound
]

{ #category : #accessing }
P3GSlice >> upperBound: anObject [
	upperBound := anObject
]

{ #category : #translating }
P3GSlice >> writePython3On: aStream [
	self lowerBound
		ifNotNil: [ self lowerBound writePython3On: aStream ].
	
	aStream << $:.
	
	self upperBound ifNotNil: [
		self upperBound writePython3On: aStream ].
	
	self stride ifNil: [ ^ self ].
	aStream << $:.
	self stride writePython3On: aStream.
]
