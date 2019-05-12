tests
testEquality
	| toBeEqual slice |
	slice := P3GSlice new
					lowerBound: 1;
					upperBound: 3;
					yourself.
	toBeEqual := slice copy.
	self deny: slice == toBeEqual.
	self assert: slice equals: toBeEqual.