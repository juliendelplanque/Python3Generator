running
setUp
	super setUp.
	operator := P3GBinaryOperator new
						left: 1;
						right: 2;
						operator: $+;
						yourself.