accessing
current
	^ current ifNil: [ self useDebugInterpreter. current ]