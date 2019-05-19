"
I represent a Python assignment statement.
"
Class {
	#name : #P3GAssignment,
	#superclass : #P3GStatement,
	#instVars : [
		'target',
		'toAssignate'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #'instance creation' }
P3GAssignment class >> target: aP3GIdentifier toAssignate: anObject [
	^ self new
		target: aP3GIdentifier;
		toAssignate: anObject;
		yourself
]

{ #category : #comparing }
P3GAssignment >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ target = anObject target
		and: [ toAssignate = anObject toAssignate ]
]

{ #category : #comparing }
P3GAssignment >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ target hash bitXor: toAssignate hash
]

{ #category : #accessing }
P3GAssignment >> target [
	^ target
]

{ #category : #accessing }
P3GAssignment >> target: anObject [
	target := anObject
]

{ #category : #accessing }
P3GAssignment >> toAssignate [
	^ toAssignate
]

{ #category : #accessing }
P3GAssignment >> toAssignate: anObject [
	toAssignate := anObject
]

{ #category : #translating }
P3GAssignment >> writePython3On: aStream [
	self target writePython3On: aStream.
	aStream
		<< ' = '.
	self toAssignate writePython3On: aStream
]
