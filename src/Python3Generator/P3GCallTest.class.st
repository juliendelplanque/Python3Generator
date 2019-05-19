"
A P3GCallTest is a test class for testing the behavior of P3GCall
"
Class {
	#name : #P3GCallTest,
	#superclass : #TestCase,
	#category : 'Python3Generator-Tests'
}

{ #category : #tests }
P3GCallTest >> testEquality [
	| toBeEqual call |
	call := P3GCall new
				target: 'print' asP3GIdentifier;
				positionalArguments: { 'hello' };
				yourself.
	toBeEqual := call copy.
	self deny: call == toBeEqual.
	self assert: call equals: toBeEqual.
]

{ #category : #tests }
P3GCallTest >> testEquality2 [
	| toBeEqual call |
	call := P3GCall new
				target: 'fct' asP3GIdentifier;
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	toBeEqual := call copy.
	self deny: call == toBeEqual.
	self assert: call equals: toBeEqual.
]

{ #category : #'tests-translating' }
P3GCallTest >> testWritePython3On [
	| call string |
	call := P3GCall new
				target: 'print' asP3GIdentifier;
				positionalArguments: { 'hello' };
				yourself.
	string := String streamContents: [ :s | call writePython3On: s ].
	self assert: string equals: 'print(''hello'')'
]

{ #category : #'tests-translating' }
P3GCallTest >> testWritePython3On2 [
	| call string |
	call := P3GCall new
				target: (P3GAttributeReference
								target: 'math' asP3GIdentifier
								attributeIdentifier: 'sin' asP3GIdentifier);
				positionalArguments: { 45 };
				yourself.
	string := String streamContents: [ :s | call writePython3On: s ].
	self assert: string equals: 'math.sin(45)'
]

{ #category : #'tests-translating' }
P3GCallTest >> testWritePython3On3 [
	| call string |
	call := P3GCall new
				target: 'fct' asP3GIdentifier;
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	string := String streamContents: [ :s | call writePython3On: s ].
	self assert: string equals: 'fct(hello=1,key2=42.42)'
]

{ #category : #'tests-translating' }
P3GCallTest >> testWritePython3On4 [
	| call string |
	call := P3GCall new
				target: 'function' asP3GIdentifier;
				positionalArguments: { 'positional1' . 38 };
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	string := String streamContents: [ :s | call writePython3On: s ].
	self assert: string equals: 'function(''positional1'',38,hello=1,key2=42.42)'
]

{ #category : #'tests-translating' }
P3GCallTest >> testWritePython3On5 [
	| call |
	call := P3GCall new
				target: 'fct' asP3GIdentifier;
				keywordArguments: { 1 -> 'badkey'. 'key2' -> 42.42 } asDictionary;
				yourself.
	self should: [ String streamContents: [ :s | call writePython3On: s ] ] raise: Error.
]
