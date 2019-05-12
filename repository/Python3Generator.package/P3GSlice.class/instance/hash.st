comparing
hash
	"Answer an integer value that is related to the identity of the receiver."

	^ lowerBound hash bitXor: (stride hash bitXor: upperBound hash)