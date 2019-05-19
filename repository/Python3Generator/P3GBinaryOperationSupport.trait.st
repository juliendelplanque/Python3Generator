"
I define methods to allow easy use of Python 3 binary operators.
"
Trait {
	#name : #P3GBinaryOperationSupport,
	#category : 'Python3Generator-Traits'
}

{ #category : #'arithmetic operators' }
P3GBinaryOperationSupport >> * anObject [
	^ P3GBinaryOperator new
		operator: $*;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
P3GBinaryOperationSupport >> + anObject [
	^ P3GBinaryOperator new
		operator: $+;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
P3GBinaryOperationSupport >> - anObject [
	^ P3GBinaryOperator new
		operator: $-;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
P3GBinaryOperationSupport >> / anObject [
	^ P3GBinaryOperator new
		operator: $/;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'boolean operators' }
P3GBinaryOperationSupport >> isEqualTo: aP3GGenerable [
	^ P3GBinaryOperator new
		operator: $=;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
P3GBinaryOperationSupport >> isGreaterOrEqThan: aP3GGenerable [
	^ P3GBinaryOperator new
		operator: '>=';
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
P3GBinaryOperationSupport >> isGreaterThan: aP3GGenerable [
	^ P3GBinaryOperator new
		operator: $>;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
P3GBinaryOperationSupport >> isSmallerOrEqThan: aP3GGenerable [
	^ P3GBinaryOperator new
		operator: '<=';
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
P3GBinaryOperationSupport >> isSmallerThan: aP3GGenerable [
	^ P3GBinaryOperator new
		operator: $<;
		left: self;
		right: aP3GGenerable;
		yourself
]
