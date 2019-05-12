comparing
hash
	"Answer an integer value that is related to the identity of the receiver."

	^ target hash
		bitXor: (self keywordArguments hash bitXor: self positionalArguments hash)