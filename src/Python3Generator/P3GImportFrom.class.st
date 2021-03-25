Class {
	#name : #P3GImportFrom,
	#superclass : #P3GImport,
	#instVars : [
		'names'
	],
	#category : #'Python3Generator-Core'
}

{ #category : #'instance creation' }
P3GImportFrom class >> moduleNamed: aString names: aCollection [
	^ (self moduleNamed: aString)
		names: aCollection;
		yourself
]

{ #category : #accessing }
P3GImportFrom >> names [
	^ names ifNil: [ #() ]
]

{ #category : #accessing }
P3GImportFrom >> names: anObject [
	names := anObject
]

{ #category : #translating }
P3GImportFrom >> writePython3On: aStream [
	aStream
		<< 'from '.
	self moduleIdentifier writePython3On: aStream.
	aStream
		<< ' import '.
	self names 
		do: [ :n | aStream << n ]
		separatedBy: [ aStream << ', ' ]
]
