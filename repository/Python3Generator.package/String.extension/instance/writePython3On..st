*Python3Generator
writePython3On: aStream
	| pythonFormatted lastChar |
	pythonFormatted := (self splitOn: '\') joinUsing: '\\'.
	aStream
		<< $'.
	lastChar := nil.
	pythonFormatted do: [ :char |
		char = Character cr
			ifTrue: [ aStream << '\n' ]
			ifFalse: [ 
				char = Character lf
					ifTrue: [ 
						lastChar = Character cr
							ifFalse: [ aStream << '\n' ] ]
					ifFalse: [ aStream << char ] ].
		lastChar := char ].
	aStream
		<< $'