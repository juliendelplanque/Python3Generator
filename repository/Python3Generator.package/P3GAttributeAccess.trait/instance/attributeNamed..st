attribute access
attributeNamed: aString
	"Returns an instance of P3GAttributeAccess to access the attribute with aString as name."
	^ P3GAttributeReference target: self attributeIdentifier: aString asP3GIdentifier