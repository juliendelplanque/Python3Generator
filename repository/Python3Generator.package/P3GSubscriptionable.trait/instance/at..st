subscription
at: anObject
	^ P3GSubscription new
		target: self;
		insideBrackets: anObject;
		yourself