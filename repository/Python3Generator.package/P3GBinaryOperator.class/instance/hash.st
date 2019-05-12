comparing
hash
	"Answer an integer value that is related to the identity of the receiver."

	^ right hash bitXor: (left hash bitXor: operator hash)