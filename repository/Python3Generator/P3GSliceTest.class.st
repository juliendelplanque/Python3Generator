"
A P3GSliceTest is a test class for testing the behavior of P3GSlice
"
Class {
	#name : #P3GSliceTest,
	#superclass : #TestCase,
	#category : 'Python3Generator-Tests'
}

{ #category : #tests }
P3GSliceTest >> testEquality [
	| toBeEqual slice |
	slice := P3GSlice new
					lowerBound: 1;
					upperBound: 3;
					yourself.
	toBeEqual := slice copy.
	self deny: slice == toBeEqual.
	self assert: slice equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GSliceTest >> testWritePython3On [
	| slice string |
	slice := P3GSlice new
					lowerBound: 1;
					yourself.
	string := String streamContents: [ :s | slice writePython3On: s ].
	self assert: string equals: '1:'
]

{ #category : #'tests-translating' }
P3GSliceTest >> testWritePython3On2 [
	| slice string |
	slice := P3GSlice new
					upperBound: 1;
					yourself.
	string := String streamContents: [ :s | slice writePython3On: s ].
	self assert: string equals: ':1'
]

{ #category : #'tests-translating' }
P3GSliceTest >> testWritePython3On3 [
	| slice string |
	slice := P3GSlice new
					lowerBound: 1;
					upperBound: 3;
					yourself.
	string := String streamContents: [ :s | slice writePython3On: s ].
	self assert: string equals: '1:3'
]

{ #category : #'tests-translating' }
P3GSliceTest >> testWritePython3On4 [
	| slice string |
	slice := P3GSlice new
					lowerBound: 1;
					upperBound: 3;
					stride: 1;
					yourself.
	string := String streamContents: [ :s | slice writePython3On: s ].
	self assert: string equals: '1:3:1'
]
