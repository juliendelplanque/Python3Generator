python
executePythonCode: aString
	| file |
	file := FileLocator temp / (UUID new asString , '.py').
	file writeStreamDo: [ :s |
		s << aString ].
	LibC system: ('python3 {1}' format: {file pathString}).
	file ensureDelete.