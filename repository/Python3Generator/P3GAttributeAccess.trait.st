"
I define methods to allow easy access to Python 3 object's attributes.
"
Trait {
	#name : #P3GAttributeAccess,
	#category : 'Python3Generator-Traits'
}

{ #category : #'attribute access' }
P3GAttributeAccess >> => aString [
	"Shortcut for #attributeNamed:."
	^ self attributeNamed: aString
]

{ #category : #'attribute access' }
P3GAttributeAccess >> attributeNamed: aString [
	"Returns an instance of P3GAttributeAccess to access the attribute with aString as name."
	^ P3GAttributeReference target: self attributeIdentifier: aString asP3GIdentifier
]
