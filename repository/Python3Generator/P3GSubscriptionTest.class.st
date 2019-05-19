"
A P3GSubscriptionTest is a test class for testing the behavior of P3GSubscription
"
Class {
	#name : #P3GSubscriptionTest,
	#superclass : #TestCase,
	#instVars : [
		'subscription'
	],
	#category : 'Python3Generator-Tests'
}

{ #category : #running }
P3GSubscriptionTest >> setUp [
	super setUp.
	subscription := P3GSubscription new
							target: 'test' asP3GIdentifier;
							insideBrackets: 2;
							yourself.
]

{ #category : #tests }
P3GSubscriptionTest >> testEquality [
	| toBeEqual |
	toBeEqual := subscription copy.
	self deny: subscription == toBeEqual.
	self assert: subscription equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GSubscriptionTest >> testWritePython3On [
	| string |
	string := String streamContents: [ :s | subscription writePython3On: s ].
	self assert: string equals: 'test[2]'
]
