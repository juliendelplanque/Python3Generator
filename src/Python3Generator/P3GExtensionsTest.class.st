"
A P3GExtensionTest is a test class for testing the behavior of extensions method of this package.
"
Class {
	#name : #P3GExtensionsTest,
	#superclass : #TestCase,
	#category : 'Python3Generator-Tests'
}

{ #category : #'tests-translating' }
P3GExtensionsTest >> testByteArrayWritePython3On [
	| string |
	string := String streamContents: [ :s | #[1 2 3 4] writePython3On: s ].
	self assert: string equals: 'bytearray([1,2,3,4])'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testCharacterWritePython3On [
	| string |
	string := String streamContents: [ :s | $a writePython3On: s ].
	self assert: string equals: '''a'''
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testDictionaryWritePython3On [
	| dict string |
	dict := { 'a' -> 1 } asDictionary.
	string := String streamContents: [ :s | dict writePython3On: s ].
	self assert: string equals: '{''a'' : 1}'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testFalseWritePython3On [
	| string |
	string := String streamContents: [ :s | false writePython3On: s ].
	self assert: string equals: 'False'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testFloatWritePython3On [
	| string |
	string := String streamContents: [ :s | 3.1415 writePython3On: s ].
	self assert: string equals: '3.1415'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testIntegerWritePython3On [
	| string |
	string := String streamContents: [ :s | 42 writePython3On: s ].
	self assert: string equals: '42'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testIntervalWritePython3On [
	| string expected |
	string := String streamContents: [ :s | (1 to: 4) writePython3On: s ].
	self assert: string equals: 'range(1,5,1)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 2) writePython3On: s ].
	self assert: string equals: 'range(1,5,2)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 0.5) writePython3On: s ].
	expected := String streamContents: [ :s | (1 to: 4 by: 0.5) asArray writePython3On: s ].
	self assert: string equals: expected
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testNanWritePython3On [
	| string |
	string := String streamContents: [ :s | Float nan writePython3On: s ].
	self assert: string equals: 'float(''nan'')'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testSequenceableCollectionWritePython3On [
	| string |
	string := String streamContents: [ :s | #(1 2 3 4) writePython3On: s ].
	self assert: string equals: '[1,2,3,4]'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testSetWritePython3On [
	| string |
	string := String streamContents: [ :s | #(42) asSet writePython3On: s ].
	self assert: string equals: '{42}'.

	string := String streamContents: [ :s | Set new writePython3On: s ].
	self assert: string equals: 'set()'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testStringWritePython3On [
	| string |
	string := String streamContents: [ :s | 'hello' writePython3On: s ].
	self assert: string equals: '''hello'''.
	string := String streamContents: [ :s | 'hello\a' writePython3On: s ].
	self assert: string equals: '''hello\\a'''.
	string := String streamContents: [ :s | 'hello',String cr writePython3On: s ].
	self assert: string equals: '''hello\r'''
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testTrueWritePython3On [
	| string |
	string := String streamContents: [ :s | true writePython3On: s ].
	self assert: string equals: 'True'
]

{ #category : #'tests-translating' }
P3GExtensionsTest >> testUndefinedObjectWritePython3On [
	| string |
	string := String streamContents: [ :s | nil writePython3On: s ].
	self assert: string equals: 'None'
]
