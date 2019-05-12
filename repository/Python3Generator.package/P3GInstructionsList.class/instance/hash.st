comparing
hash
	"Answer an integer value that is related to the identity of the receiver."

	^ instructions hash
		bitXor: (indentationChar hash bitXor: indentationsCount hash)