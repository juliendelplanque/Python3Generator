tests
testEquality
	| toBeEqual |
	toBeEqual := operator copy.
	self deny: operator == toBeEqual.
	self assert: operator equals: toBeEqual.