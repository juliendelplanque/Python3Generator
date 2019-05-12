tests
testEquality
	| toBeEqual |
	toBeEqual := identifier copy.
	self deny: identifier == toBeEqual.
	self assert: identifier equals: toBeEqual.