tests-translating
testWritePython3On
	| operator string |
	operator := P3GUnaryOperator new
						target: 1;
						operator: $~;
						yourself.
	string := String streamContents: [ :s | operator writePython3On: s ].
	self assert: string equals: '~1'