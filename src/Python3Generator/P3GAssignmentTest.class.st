"
A P3GAssignmentTest is a test class for testing the behavior of P3GAssignment
"
Class {
	#name : #P3GAssignmentTest,
	#superclass : #TestCase,
	#instVars : [
		'assignment'
	],
	#category : 'Python3Generator-Tests'
}

{ #category : #running }
P3GAssignmentTest >> setUp [
	super setUp.
	assignment := P3GAssignment new
						target: (P3GIdentifier named: 'variable');
						toAssignate: 42;
						yourself.
]

{ #category : #tests }
P3GAssignmentTest >> testEquality [
	| toBeEqual |
	toBeEqual := assignment copy.
	self deny: assignment == toBeEqual.
	self assert: assignment equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GAssignmentTest >> testWritePython3On [
	| string |
	string := String streamContents: [ :s | assignment writePython3On: s ].
	self assert: string equals: 'variable = 42'
]
