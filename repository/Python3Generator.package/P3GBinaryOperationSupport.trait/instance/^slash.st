arithmetic operators
/ anObject
	^ P3GBinaryOperator new
		operator: $/;
		left: self;
		right: anObject;
		yourself