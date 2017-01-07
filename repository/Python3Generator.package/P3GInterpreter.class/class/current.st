accessing
current
	^ current ifNil: [ current := P3GDebugInterpreter ]