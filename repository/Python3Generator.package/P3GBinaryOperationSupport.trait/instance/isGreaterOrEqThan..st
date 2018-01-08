boolean operators
isGreaterOrEqThan: aP3GGenerable
	^ P3GBinaryOperator new
		operator: '>=';
		left: self;
		right: aP3GGenerable;
		yourself