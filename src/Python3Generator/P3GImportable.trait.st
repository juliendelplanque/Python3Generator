"
I define methods to allow easily import a module.
"
Trait {
	#name : #P3GImportable,
	#category : 'Python3Generator-Traits'
}

{ #category : #importing }
P3GImportable >> import [
	^ P3GImport moduleIdentifier: self
]
