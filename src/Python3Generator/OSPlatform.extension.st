Extension { #name : #OSPlatform }

{ #category : #'*Python3Generator' }
OSPlatform >> p3gPython3Path [
	"Returns the path to the python3 executable as a String."
	^ self subclassResponsibility
]
