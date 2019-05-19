"
Interpreter using LibC>>#system: method.

Far to be stable, no error management for example, use at you own risks!
"
Class {
	#name : #P3GFFIInterpreter,
	#superclass : #P3GInterpreter,
	#instVars : [
		'pathToPython'
	],
	#classInstVars : [
		'pathToPython'
	],
	#category : 'Python3Generator-Interpreters'
}

{ #category : #python }
P3GFFIInterpreter >> executePythonCode: aString [
	| file baseFileName errFile |
	baseFileName := UUID new asString.
	file := FileLocator temp / (baseFileName , '.py').
	file writeStreamDo: [ :s |
		s << aString ].
	errFile := FileLocator temp / (baseFileName , '.pyerr').
	LibC system: ('{1} {2} 2> {3}' format: {self pathToPython . file pathString . errFile pathString}).
	file ensureDelete.
	[ errFile contents isNotEmpty
		ifTrue: [ P3GPythonException signal: errFile contents ]
	] ensure: [ errFile ensureDelete ]
]

{ #category : #accessing }
P3GFFIInterpreter >> pathToPython [
	"If the user set a path and the file exists, returns it."
	pathToPython ifNotNil: [ 
		pathToPython asFileReference exists
			ifFalse: [ self error: ('The path {1} to the python3 interpreter binary references a file that does not exist.' format: { pathToPython }) ].
		^ pathToPython ].
	
	"Else, check for a default path..."
	OSPlatform current p3gPython3Path asFileReference exists
		ifFalse: [ self error: ('The path {1} to the python3 interpreter binary references a file that does not exist.' format: { OSPlatform current p3gPython3Path }) ].
	
	^ OSPlatform current p3gPython3Path
]

{ #category : #accessing }
P3GFFIInterpreter >> pathToPython: anObject [
	pathToPython := anObject
]
