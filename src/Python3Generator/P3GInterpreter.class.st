"
I define methods all interpreter should implement in my class side and hold the current interpreter used in my #current inst. var.
"
Class {
	#name : #P3GInterpreter,
	#superclass : #Object,
	#classInstVars : [
		'current'
	],
	#category : 'Python3Generator-Interpreters'
}

{ #category : #accessing }
P3GInterpreter class >> current [
	^ current ifNil: [ self useDebugInterpreter. current ]
]

{ #category : #accessing }
P3GInterpreter class >> current: aMLBBridge [
	current := aMLBBridge
]

{ #category : #'class initialization' }
P3GInterpreter class >> initialize [
	self useFFIInterpreter
]

{ #category : #settings }
P3GInterpreter class >> useDebugInterpreter [
	self current: P3GDebugInterpreter new
]

{ #category : #settings }
P3GInterpreter class >> useFFIInterpreter [
	self current: P3GFFIInterpreter new
]

{ #category : #python }
P3GInterpreter >> executePythonCode: aString [
	self subclassResponsibility
]

{ #category : #python }
P3GInterpreter >> executePythonCodeAngGetValue: aString [
	^ self subclassResponsibility
]
