"
I am  the reference to an attribute like this: 'target.attribute'.
"
Class {
	#name : #P3GAttributeReference,
	#superclass : #P3GGenerable,
	#traits : 'P3GCallable + P3GAssignable + P3GAttributeAccess + P3GImportable + P3GSubscriptionable',
	#classTraits : 'P3GCallable classTrait + P3GAssignable classTrait + P3GAttributeAccess classTrait + P3GImportable classTrait + P3GSubscriptionable classTrait',
	#instVars : [
		'target',
		'attributeIdentifier'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #'instance creation' }
P3GAttributeReference class >> target: target attributeIdentifier: identifier [
	^ self new
		target: target;
		attributeIdentifier: identifier;
		yourself
]

{ #category : #comparing }
P3GAttributeReference >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ target = anObject target
		and: [ attributeIdentifier = anObject attributeIdentifier ]
]

{ #category : #accessing }
P3GAttributeReference >> attributeIdentifier [
	^ attributeIdentifier
]

{ #category : #accessing }
P3GAttributeReference >> attributeIdentifier: anObject [
	attributeIdentifier := anObject
]

{ #category : #comparing }
P3GAttributeReference >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ target hash bitXor: attributeIdentifier hash
]

{ #category : #accessing }
P3GAttributeReference >> target [
	^ target
]

{ #category : #accessing }
P3GAttributeReference >> target: anObject [
	target := anObject
]

{ #category : #translating }
P3GAttributeReference >> writePython3On: aStream [
	self target writePython3On: aStream.
	aStream << $..
	self attributeIdentifier writePython3On: aStream.
]
