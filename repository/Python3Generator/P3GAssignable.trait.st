"
I define methods to allow easy assignments.
"
Trait {
	#name : #P3GAssignable,
	#category : 'Python3Generator-Traits'
}

{ #category : #assignments }
P3GAssignable >> <- aP3GGenerable [
	^ self assign: aP3GGenerable
]

{ #category : #assignments }
P3GAssignable >> assign: aP3GGenerable [
	^ P3GAssignment target: self toAssignate: aP3GGenerable
]
