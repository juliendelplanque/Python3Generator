comparing
= anObject
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ target = anObject target
		and: [ self keywordArguments = anObject keywordArguments
				and: [ self positionalArguments = anObject positionalArguments ] ]