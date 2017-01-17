*Python3Generator
writePython3On: aStream
	P3GFunctionInvocation new
		functionName: 'bytearray';
		positionalArguments: { self asArray };
		writePython3On: aStream