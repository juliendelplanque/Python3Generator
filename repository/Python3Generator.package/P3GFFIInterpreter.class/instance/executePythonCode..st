python
executePythonCode: aString
	| file baseFileName errFile |
	baseFileName := UUID new asString.
	file := FileLocator temp / (baseFileName , '.py').
	file writeStreamDo: [ :s |
		s << aString ].
	errFile := FileLocator temp / (baseFileName , '.pyerr').
	LibC system: ('python3 {1} 2> {2}' format: {file pathString . errFile pathString}).
	file ensureDelete.
	[ errFile contents isNotEmpty
		ifTrue: [ self error: errFile contents ]
	] ensure: [ errFile ensureDelete ]