tests
testSingleArgument
	self assertCode: (P3GLambda argument: #a asP3GI expression: #a asP3GI + 1) equals: '(lambda a: a+1)'