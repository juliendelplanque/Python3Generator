Extension { #name : #Symbol }

{ #category : #'*Python3Generator' }
Symbol >> <- aP3GGenerable [
	"Syntax sugar to make the DSL better."
	^ self asP3GIdentifier <- aP3GGenerable
]

{ #category : #'*Python3Generator' }
Symbol >> attributeNamed: aString [
	"Syntax sugar to make the DSL better."
	^ P3GAttributeReference target: self asP3GIdentifier attributeIdentifier: aString asP3GIdentifier
]

{ #category : #'*Python3Generator' }
Symbol >> call [
	"Syntax sugar to make the DSL better."
	^ self asP3GIdentifier call
]

{ #category : #'*Python3Generator' }
Symbol >> callWith: anArrayOrADictionary [
	"Syntax sugar to make the DSL better."
	^ self asP3GIdentifier callWith: anArrayOrADictionary
]

{ #category : #'*Python3Generator' }
Symbol >> callWith: anArray with: aDictionary [
	"Syntax sugar to make the DSL better."
	^ self asP3GIdentifier callWith: anArray with: aDictionary
]

{ #category : #'*Python3Generator' }
Symbol >> import [
	"Syntax sugar to make the DSL better."
	^ self asP3GIdentifier import
]
