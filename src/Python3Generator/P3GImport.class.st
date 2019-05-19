"
I represent a Python ""import"" statement.
"
Class {
	#name : #P3GImport,
	#superclass : #P3GStatement,
	#instVars : [
		'moduleIdentifier'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #'instance creation' }
P3GImport class >> moduleIdentifier: aP3GIdentifier [
	^ self new
		moduleIdentifier: aP3GIdentifier;
		yourself
]

{ #category : #'instance creation' }
P3GImport class >> moduleNamed: aString [
	^ self new
		moduleIdentifier: (P3GIdentifier named: aString);
		yourself
]

{ #category : #comparing }
P3GImport >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ moduleIdentifier = anObject moduleIdentifier
]

{ #category : #comparing }
P3GImport >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ moduleIdentifier hash
]

{ #category : #testing }
P3GImport >> isImport [
	^ true
]

{ #category : #accessing }
P3GImport >> moduleIdentifier [
	^ moduleIdentifier
]

{ #category : #accessing }
P3GImport >> moduleIdentifier: anObject [
	moduleIdentifier := anObject
]

{ #category : #translating }
P3GImport >> writePython3On: aStream [
	aStream
		<< 'import '.
	self moduleIdentifier writePython3On: aStream
]
