*Python3Generator
writePython3On: aStream
	"Intervals in Pharo is equivalent to Ranges in Python.
	The range(i, j, k) function creates a range from i to j-1 by step.
	This is why in positional arguments of the function invocation, there is 'self last + 1'."
	P3GCall new
		target: 'range' asP3GIdentifier;
		positionalArguments: { start .  stop + 1 . step };
		writePython3On: aStream