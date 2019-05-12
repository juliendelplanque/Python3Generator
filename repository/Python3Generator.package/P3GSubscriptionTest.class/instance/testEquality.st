tests
testEquality
	| toBeEqual |
	toBeEqual := subscription copy.
	self deny: subscription == toBeEqual.
	self assert: subscription equals: toBeEqual.