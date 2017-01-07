tests-translating
testWritePython3On
	| import string |
	import := P3GImport moduleNamed: 'math'.
	string := String streamContents: [ :s | import writePython3On: s ].
	self assert: string equals: 'import math'