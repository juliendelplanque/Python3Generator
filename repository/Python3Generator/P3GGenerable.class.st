"
I am an abstract object that is able to generate Python 3 source code.

My subclasses should implment #generate.
"
Class {
	#name : #P3GGenerable,
	#superclass : #Object,
	#classInstVars : [
		'bridge'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #translating }
P3GGenerable >> generate [
	"Returns the Python 3 code generated."
	^ String streamContents: [ :stream |
		self writePython3On: stream ]
]

{ #category : #'gt-inspector-extension' }
P3GGenerable >> gtInspectorPython3CodeIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite text
		title: 'Python 3 code';
		display: [ self generate ]
]

{ #category : #testing }
P3GGenerable >> isImport [
	^ false
]

{ #category : #'adding-dispatch' }
P3GGenerable >> p3gBeAddedTo: aP3GInstructionsList [
	aP3GInstructionsList add: self
]

{ #category : #translating }
P3GGenerable >> writePython3On: aStream [
	"Write the Python 3 code generated on aStream."
	self subclassResponsibility 
]
