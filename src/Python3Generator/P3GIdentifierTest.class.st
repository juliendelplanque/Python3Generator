"
A P3GIdentifierTest is a test class for testing the behavior of P3GIdentifier
"
Class {
	#name : #P3GIdentifierTest,
	#superclass : #TestCase,
	#instVars : [
		'identifier'
	],
	#category : 'Python3Generator-Tests'
}

{ #category : #running }
P3GIdentifierTest >> setUp [
	super setUp.
	identifier := P3GIdentifier new
						name: 'id';
						yourself.
]

{ #category : #tests }
P3GIdentifierTest >> testEquality [
	| toBeEqual |
	toBeEqual := identifier copy.
	self deny: identifier == toBeEqual.
	self assert: identifier equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GIdentifierTest >> testWritePython3On [
	| string |
	string := String streamContents: [ :s | identifier writePython3On: s ].
	self assert: string equals: 'id'
]
