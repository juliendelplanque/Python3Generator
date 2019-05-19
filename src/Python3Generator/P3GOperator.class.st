"
I am an abstract Python operator.
"
Class {
	#name : #P3GOperator,
	#superclass : #P3GGenerable,
	#instVars : [
		'operator'
	],
	#category : 'Python3Generator-Core'
}

{ #category : #accessing }
P3GOperator >> operator [
	^ operator
]

{ #category : #accessing }
P3GOperator >> operator: anObject [
	operator := anObject
]
