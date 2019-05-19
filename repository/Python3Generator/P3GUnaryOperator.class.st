"
I am a unary Python operator.
"
Class {
	#name : #P3GUnaryOperator,
	#superclass : #P3GOperator,
	#instVars : [
		'target'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #comparing }
P3GUnaryOperator >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ operator = anObject operator and: [ target = anObject target ]
]

{ #category : #comparing }
P3GUnaryOperator >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ operator hash bitXor: target hash
]

{ #category : #accessing }
P3GUnaryOperator >> target [
	^ target
]

{ #category : #accessing }
P3GUnaryOperator >> target: anObject [
	target := anObject
]

{ #category : #translating }
P3GUnaryOperator >> writePython3On: aStream [
	aStream << self operator.
	self target writePython3On: aStream
]
