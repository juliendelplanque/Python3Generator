"
A P3GLambdaTest is a test class for testing the behavior of P3GLambda
"
Class {
	#name : #P3GLambdaTest,
	#superclass : #TestCase,
	#category : 'Python3Generator-Tests'
}

{ #category : #tests }
P3GLambdaTest >> assertCode: expr equals: targetStr [
	| string |
	string := String streamContents: [ :s | expr writePython3On: s ].
	self assert: string equals: targetStr
]

{ #category : #tests }
P3GLambdaTest >> testMultipleArguments [
	| lambda |
	lambda := P3GLambda 
					arguments: (Array with: #a asP3GI with: #b asP3GI with: #c asP3GI)
					expression: #a asP3GI + (#b asP3GI callWith: (Array with: #c asP3GI)).
	self assertCode: lambda equals: '(lambda a, b, c: a+b(c))'
]

{ #category : #tests }
P3GLambdaTest >> testReturn1 [
	self assertCode: (P3GLambda expression: 1) equals: '(lambda : 1)'
]

{ #category : #tests }
P3GLambdaTest >> testSingleArgument [
	self assertCode: (P3GLambda argument: #a asP3GI expression: #a asP3GI + 1) equals: '(lambda a: a+1)'
]
