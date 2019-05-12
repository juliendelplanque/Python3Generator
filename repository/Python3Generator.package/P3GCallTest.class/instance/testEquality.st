tests
testEquality
	| toBeEqual call |
	call := P3GCall new
				target: 'print' asP3GIdentifier;
				positionalArguments: { 'hello' };
				yourself.
	toBeEqual := call copy.
	self deny: call == toBeEqual.
	self assert: call equals: toBeEqual.