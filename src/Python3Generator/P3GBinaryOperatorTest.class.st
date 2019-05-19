"
A P3BinaryOperatorTest is a test class for testing the behavior of P3BinaryOperator
"
Class {
	#name : #P3GBinaryOperatorTest,
	#superclass : #TestCase,
	#instVars : [
		'operator'
	],
	#category : 'Python3Generator-Tests'
}

{ #category : #running }
P3GBinaryOperatorTest >> setUp [
	super setUp.
	operator := P3GBinaryOperator new
						left: 1;
						right: 2;
						operator: $+;
						yourself.
]

{ #category : #tests }
P3GBinaryOperatorTest >> testEquality [
	| toBeEqual |
	toBeEqual := operator copy.
	self deny: operator == toBeEqual.
	self assert: operator equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GBinaryOperatorTest >> testWritePython3On [
	| string |
	string := String streamContents: [ :s | operator writePython3On: s ].
	self assert: string equals: '1+2'
]
