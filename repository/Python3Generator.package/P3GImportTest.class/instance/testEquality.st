tests
testEquality
	| toBeEqual |
	toBeEqual := import copy.
	self deny: import == toBeEqual.
	self assert: import equals: toBeEqual.