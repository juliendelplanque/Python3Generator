"
I am a list of Python 3 instructions.
"
Class {
	#name : #P3GInstructionsList,
	#superclass : #P3GGenerable,
	#traits : 'P3GTExecutable',
	#classTraits : 'P3GTExecutable classTrait',
	#instVars : [
		'indentationsCount',
		'indentationChar',
		'instructions'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #adding }
P3GInstructionsList >> << anObject [
	anObject p3gBeAddedTo: self
]

{ #category : #comparing }
P3GInstructionsList >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ instructions = anObject instructions
		and: [ indentationChar = anObject indentationChar
				and: [ indentationsCount = anObject indentationsCount ] ]
]

{ #category : #adding }
P3GInstructionsList >> add: anInstruction [
	self instructions add: anInstruction
]

{ #category : #adding }
P3GInstructionsList >> addAll: aListOfInstructions [
	self instructions addAll: aListOfInstructions
]

{ #category : #enumerating }
P3GInstructionsList >> collect: aBlock [
	^ self instructions collect: aBlock
]

{ #category : #enumerating }
P3GInstructionsList >> do: aBlock [
	self instructions do: aBlock
]

{ #category : #comparing }
P3GInstructionsList >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ instructions hash
		bitXor: (indentationChar hash bitXor: indentationsCount hash)
]

{ #category : #accessing }
P3GInstructionsList >> indentationChar [
	^ indentationChar
]

{ #category : #accessing }
P3GInstructionsList >> indentationChar: anObject [
	indentationChar := anObject
]

{ #category : #accessing }
P3GInstructionsList >> indentationsCount [
	^ indentationsCount
]

{ #category : #accessing }
P3GInstructionsList >> indentationsCount: anObject [
	indentationsCount := anObject
]

{ #category : #initialization }
P3GInstructionsList >> initialize [
	super initialize.
	self
		instructions: OrderedCollection new;
		indentationsCount: 0;
		indentationChar: Character space
]

{ #category : #accessing }
P3GInstructionsList >> instructions [
	^ instructions
]

{ #category : #accessing }
P3GInstructionsList >> instructions: anObject [
	instructions := anObject
]

{ #category : #'adding-dispatch' }
P3GInstructionsList >> p3gBeAddedTo: aP3GInstructionsList [
	aP3GInstructionsList addAll: self instructions
]

{ #category : #enumerating }
P3GInstructionsList >> reject: aBlock [
	^ self instructions reject: aBlock
]

{ #category : #removing }
P3GInstructionsList >> remove: anInstruction [
	self instructions remove: anInstruction
]

{ #category : #enumerating }
P3GInstructionsList >> select: aBlock [
	^ self instructions select: aBlock
]

{ #category : #enumerating }
P3GInstructionsList >> select: aBlock thenCollect: anotherBlock [
	^ self instructions select: aBlock thenCollect: anotherBlock
]

{ #category : #translating }
P3GInstructionsList >> writePython3On: aStream [
	self do: [ :instr |
		self indentationsCount timesRepeat: [ aStream << self indentationChar ].
		instr writePython3On: aStream.
		aStream
			<< Smalltalk os lineEnding ]
]
