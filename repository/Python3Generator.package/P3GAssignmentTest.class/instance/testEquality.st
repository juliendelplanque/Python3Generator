tests
testEquality
	| toBeEqual |
	toBeEqual := assignment copy.
	self deny: assignment == toBeEqual.
	self assert: assignment equals: toBeEqual.