tests-translating
testDictionaryWritePython3On
	| dict string |
	dict := { 
	'a' -> 1.
	42 -> 'b'.
	3 -> 4 } asDictionary.
	string := String streamContents: [ :s | dict writePython3On: s ].
	self assert: string equals: '{''a'' : 1 , 42 : ''b'' , 3 : 4}'