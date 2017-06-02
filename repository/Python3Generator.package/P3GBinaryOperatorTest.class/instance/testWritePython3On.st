tests-translating
testWritePython3On
	| operator string |
	operator := P3GBinaryOperator new
						left: 1;
						right: 2;
						operator: $+;
						yourself.
	string := String streamContents: [ :s | operator writePython3On: s ].
	self assert: string equals: '1+2'