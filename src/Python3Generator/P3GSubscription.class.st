"
I represent a Python 3 subscription.
A subscription selects an item of a sequence (string, tuple or list) or mapping (dictionary) .
"
Class {
	#name : #P3GSubscription,
	#superclass : #P3GGenerable,
	#traits : 'P3GAttributeAccess + P3GCallable + P3GAssignable + P3GSubscriptionable',
	#classTraits : 'P3GAttributeAccess classTrait + P3GCallable classTrait + P3GAssignable classTrait + P3GSubscriptionable classTrait',
	#instVars : [
		'target',
		'insideBrackets'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #comparing }
P3GSubscription >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ insideBrackets = anObject insideBrackets
		and: [ target = anObject target ]
]

{ #category : #comparing }
P3GSubscription >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ insideBrackets hash bitXor: target hash
]

{ #category : #accessing }
P3GSubscription >> insideBrackets [
	^ insideBrackets
]

{ #category : #accessing }
P3GSubscription >> insideBrackets: anObject [
	insideBrackets := anObject
]

{ #category : #accessing }
P3GSubscription >> target [
	^ target
]

{ #category : #accessing }
P3GSubscription >> target: anObject [
	target := anObject
]

{ #category : #translating }
P3GSubscription >> writePython3On: aStream [
	self target writePython3On: aStream.
	aStream << $[.
	self insideBrackets writePython3On: aStream.
	aStream << $]
]
