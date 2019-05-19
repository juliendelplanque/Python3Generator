"
A P3GUnaryOperatorTest is a test class for testing the behavior of P3GUnaryOperator
"
Class {
	#name : #P3GUnaryOperatorTest,
	#superclass : #TestCase,
	#instVars : [
		'operator'
	],
	#category : 'Python3Generator-Tests'
}

{ #category : #running }
P3GUnaryOperatorTest >> setUp [
	super setUp.
	operator := P3GUnaryOperator new
						target: 1;
						operator: $~;
						yourself.
]

{ #category : #tests }
P3GUnaryOperatorTest >> testEquality [
	| toBeEqual |
	toBeEqual := operator copy.
	self deny: operator == toBeEqual.
	self assert: operator equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GUnaryOperatorTest >> testWritePython3On [
	| string |
	string := String streamContents: [ :s | operator writePython3On: s ].
	self assert: string equals: '~1'
]
