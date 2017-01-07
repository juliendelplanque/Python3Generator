accessing
current
	^ current ifNil: [ current := MLBAtlasInterpreter ]