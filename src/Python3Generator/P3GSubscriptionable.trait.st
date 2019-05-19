"
I define methods to allow easily perform subscription on a Python object.
"
Trait {
	#name : #P3GSubscriptionable,
	#category : 'Python3Generator-Traits'
}

{ #category : #subscription }
P3GSubscriptionable >> at: anObject [
	^ P3GSubscription new
		target: self;
		insideBrackets: anObject;
		yourself
]

{ #category : #subscription }
P3GSubscriptionable >> from: anObject to: anotherObject [
	^ self from: anObject to: anotherObject by: nil
]

{ #category : #subscription }
P3GSubscriptionable >> from: anObject to: anotherObject by: yetAnotherObject [
	^ self at: (P3GSlice lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject)
]
