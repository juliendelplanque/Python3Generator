accessing
pathToPython
	"If the user set a path and the file exists, returns it."
	pathToPython ifNotNil: [ 
		pathToPython asFileReference exists
			ifFalse: [ self error: ('The path {1} to the python3 interpreter binary references a file that does not exist.' format: { pathToPython }) ].
		^ pathToPython ].
	
	"Else, check for a default path..."
	OSPlatform current p3gPython3Path asFileReference exists
		ifFalse: [ self error: ('The path {1} to the python3 interpreter binary references a file that does not exist.' format: { OSPlatform current p3gPython3Path }) ].
	
	^ OSPlatform current p3gPython3Path