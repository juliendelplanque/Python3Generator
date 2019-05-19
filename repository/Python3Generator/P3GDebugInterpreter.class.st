"
I am an interpreter that just print the code it receive in Transcript. I am useful for debugging.

Warning: I can not get value!
"
Class {
	#name : #P3GDebugInterpreter,
	#superclass : #P3GInterpreter,
	#category : 'Python3Generator-Interpreters'
}

{ #category : #python }
P3GDebugInterpreter >> executePythonCode: aString [
	Transcript show: aString; cr
]
