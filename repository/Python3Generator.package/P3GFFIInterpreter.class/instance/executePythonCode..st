python
executePythonCode: aString
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