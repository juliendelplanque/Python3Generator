subscription
from: anObject to: anotherObject by: yetAnotherObject
	^ self at: (P3GSlice lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject)