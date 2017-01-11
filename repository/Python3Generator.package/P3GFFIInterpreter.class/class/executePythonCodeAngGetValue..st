python
executePythonCodeAngGetValue: aString
	self executePythonCode: aString.
	^ MLBRemoteVariable new