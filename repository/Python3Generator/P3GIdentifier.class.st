"
I represent a Python 3 identifier.
"
Class {
	#name : #P3GIdentifier,
	#superclass : #P3GGenerable,
	#traits : 'P3GAttributeAccess + P3GCallable + P3GAssignable + P3GImportable + P3GSubscriptionable + P3GBinaryOperationSupport',
	#classTraits : 'P3GAttributeAccess classTrait + P3GCallable classTrait + P3GAssignable classTrait + P3GImportable classTrait + P3GSubscriptionable classTrait + P3GBinaryOperationSupport classTrait',
	#instVars : [
		'name'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #'instance creation' }
P3GIdentifier class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #comparing }
P3GIdentifier >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #converting }
P3GIdentifier >> asP3GI [
	"Shortcut for #asP3GIdentifier."
	^ self asP3GIdentifier
]

{ #category : #converting }
P3GIdentifier >> asP3GIdentifier [
	^ self
]

{ #category : #comparing }
P3GIdentifier >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
P3GIdentifier >> name [
	^ name
]

{ #category : #accessing }
P3GIdentifier >> name: anObject [
	name := anObject
]

{ #category : #translating }
P3GIdentifier >> writePython3On: aStream [
	aStream << self name
]
