Extension { #name : #String }

{ #category : #'*Python3Generator' }
String >> asP3GI [
	"Shortcut for #asP3GIdentifier."
	^ self asP3GIdentifier
]

{ #category : #'*Python3Generator' }
String >> asP3GIdentifier [
	^ P3GIdentifier new
		name: self;
		yourself
]

{ #category : #'*Python3Generator' }
String >> asP3GString [
	^ P3GString string: self
]

{ #category : #'*Python3Generator' }
String >> writePython3On: aStream [
	self asP3GString writePython3On: aStream
]
