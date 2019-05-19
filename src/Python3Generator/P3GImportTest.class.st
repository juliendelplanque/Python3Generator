"
A P3GImportTest is a test class for testing the behavior of P3GImport
"
Class {
	#name : #P3GImportTest,
	#superclass : #TestCase,
	#instVars : [
		'import'
	],
	#category : 'Python3Generator-Tests'
}

{ #category : #running }
P3GImportTest >> setUp [
	super setUp.
	import := P3GImport moduleNamed: 'math'.
]

{ #category : #tests }
P3GImportTest >> testEquality [
	| toBeEqual |
	toBeEqual := import copy.
	self deny: import == toBeEqual.
	self assert: import equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GImportTest >> testWritePython3On [
	| string |
	string := String streamContents: [ :s | import writePython3On: s ].
	self assert: string equals: 'import math'
]
