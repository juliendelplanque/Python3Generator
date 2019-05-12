comparing
= anObject
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ instructions = anObject instructions
		and: [ indentationChar = anObject indentationChar
				and: [ indentationsCount = anObject indentationsCount ] ]