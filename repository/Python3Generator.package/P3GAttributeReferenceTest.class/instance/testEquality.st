tests
testEquality
	| toBeEqual |
	toBeEqual := attrRef copy.
	self deny: attrRef == toBeEqual.
	self assert: attrRef equals: toBeEqual.