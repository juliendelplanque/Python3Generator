tests
testMultipleArguments
	| lambda |
	lambda := P3GLambda 
					arguments: (Array with: #a asP3GI with: #b asP3GI with: #c asP3GI)
					expression: #a asP3GI + (#b asP3GI callWith: (Array with: #c asP3GI)).
	self assertCode: lambda equals: '(lambda a, b, c: a+b(c))'