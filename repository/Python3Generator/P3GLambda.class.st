"
I am a Python 3 lambda.
"
Class {
	#name : #P3GLambda,
	#superclass : #P3GGenerable,
	#traits : 'P3GCallable + P3GBinaryOperationSupport',
	#classTraits : 'P3GCallable classTrait + P3GBinaryOperationSupport classTrait',
	#instVars : [
		'arguments',
		'expression'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #'as yet unclassified' }
P3GLambda class >> argument: anIdentifier expression: aPythonExpression [
	^ self arguments: (Array with: anIdentifier) expression: aPythonExpression
]

{ #category : #'as yet unclassified' }
P3GLambda class >> arguments: listOfP3GI expression: aPythonExpression [
	^ self new
		arguments: listOfP3GI;
		expression: aPythonExpression;
		yourself
]

{ #category : #'as yet unclassified' }
P3GLambda class >> expression: aPythonExpression [
	^ self arguments: #() expression: aPythonExpression
]

{ #category : #comparing }
P3GLambda >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ expression = anObject expression
		and: [ arguments = anObject arguments ]
]

{ #category : #accessing }
P3GLambda >> arguments [
	^ arguments
]

{ #category : #accessing }
P3GLambda >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
P3GLambda >> expression [
	^ expression
]

{ #category : #accessing }
P3GLambda >> expression: anObject [
	expression := anObject
]

{ #category : #comparing }
P3GLambda >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ expression hash bitXor: arguments hash
]

{ #category : #accessing }
P3GLambda >> writePython3On: aStream [
	aStream << '(lambda '.
	arguments 
		do: [ :arg | arg writePython3On: aStream ]
		separatedBy: [ aStream << ', ' ].
	aStream << ': '.
	expression writePython3On: aStream.
	aStream << ')'.
]
