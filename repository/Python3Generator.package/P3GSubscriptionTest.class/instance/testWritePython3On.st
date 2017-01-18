tests-translating
testWritePython3On
	| subscription string |
	subscription := P3GSubscription new
							target: 'test' asP3GIdentifier;
							insideBrackets: 2;
							yourself.
	string := String streamContents: [ :s | subscription writePython3On: s ].
	self assert: string equals: 'test[2]'