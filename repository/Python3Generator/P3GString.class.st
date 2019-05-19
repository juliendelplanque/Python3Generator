"
I am a wrapper for Pharo Strings in order to be able to convert them to python strings.
"
Class {
	#name : #P3GString,
	#superclass : #P3GGenerable,
	#traits : 'P3GSubscriptionable',
	#classTraits : 'P3GSubscriptionable classTrait',
	#instVars : [
		'string'
	],
	#classInstVars : [
		'charactersToEscape'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #accessing }
P3GString class >> charactersToEscape [
	^ charactersToEscape
		ifNil: [ charactersToEscape := {
			($\ -> '\\').
			($' -> '\''').
			($" -> '\"').
			((Character codePoint: 7)  -> '\a').	"BEL"
			((Character codePoint: 8)  -> '\b').	"BS"
			((Character codePoint: 12) -> '\f').	"FF"
			(Character lf              -> '\n').	"LF"
			(Character cr              -> '\r').	"CR"
			(Character tab             -> '\t').	"TAB"
			((Character codePoint: 11) -> '\v')	"VT"} asDictionary ]
]

{ #category : #private }
P3GString class >> resetCharactersToEscape [
	"For debugging purpose.
	P3GString resetCharactersToEscape"
	charactersToEscape := nil
]

{ #category : #'instance creation' }
P3GString class >> string: aString [
	^ self new
		string: aString;
		yourself
]

{ #category : #comparing }
P3GString >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ string = anObject string
]

{ #category : #converting }
P3GString >> asP3GI [
	"Shortcut for #asP3GIdentifier."
	^ self asP3GIdentifier
]

{ #category : #converting }
P3GString >> asP3GIdentifier [
	^ P3GIdentifier new
		name: self string;
		yourself
]

{ #category : #accessing }
P3GString >> charactersToEscape [
	^ self class charactersToEscape
]

{ #category : #comparing }
P3GString >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ string hash
]

{ #category : #accessing }
P3GString >> string [
	^ string
]

{ #category : #accessing }
P3GString >> string: anObject [
	string := anObject
]

{ #category : #translating }
P3GString >> writePython3On: aStream [
	aStream << $'.
	self string do: [ :c|
		(self charactersToEscape includesKey: c)
			ifTrue: [ aStream << (self charactersToEscape at: c) ]
			ifFalse: [ aStream << c ]
		 ].
	aStream << $'
]
