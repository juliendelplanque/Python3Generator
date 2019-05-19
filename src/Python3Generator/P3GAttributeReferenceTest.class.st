"
A P3GAttributeReferenceTest is a test class for testing the behavior of P3GAttributeReference
"
Class {
	#name : #P3GAttributeReferenceTest,
	#superclass : #TestCase,
	#instVars : [
		'attrRef'
	],
	#category : 'Python3Generator-Tests'
}

{ #category : #running }
P3GAttributeReferenceTest >> setUp [
	super setUp.
	attrRef := P3GAttributeReference new
						target: 'var' asP3GIdentifier;
						attributeIdentifier: 'attr' asP3GIdentifier;
						yourself.
]

{ #category : #tests }
P3GAttributeReferenceTest >> testEquality [
	| toBeEqual |
	toBeEqual := attrRef copy.
	self deny: attrRef == toBeEqual.
	self assert: attrRef equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GAttributeReferenceTest >> testWritePython3On [
	| string |
	string := String streamContents: [ :s | attrRef writePython3On: s ].
	self assert: string equals: 'var.attr'
]
