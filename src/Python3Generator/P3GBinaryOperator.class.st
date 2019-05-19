"
I am a binary Python operator.
"
Class {
	#name : #P3GBinaryOperator,
	#superclass : #P3GOperator,
	#instVars : [
		'left',
		'right'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #comparing }
P3GBinaryOperator >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ right = anObject right
		and: [ left = anObject left and: [ operator = anObject operator ] ]
]

{ #category : #comparing }
P3GBinaryOperator >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ right hash bitXor: (left hash bitXor: operator hash)
]

{ #category : #accessing }
P3GBinaryOperator >> left [
	^ left
]

{ #category : #accessing }
P3GBinaryOperator >> left: anObject [
	left := anObject
]

{ #category : #accessing }
P3GBinaryOperator >> right [
	^ right
]

{ #category : #accessing }
P3GBinaryOperator >> right: anObject [
	right := anObject
]

{ #category : #translating }
P3GBinaryOperator >> writePython3On: aStream [
	self left writePython3On: aStream.
	aStream << self operator.
	self right writePython3On: aStream
]
