*Python3Generator
writePython3On: aStream
	P3GCall new
		target: 'bytearray' asP3GIdentifier;
		positionalArguments:  { self asArray };
		writePython3On: aStream