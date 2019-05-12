running
setUp
	super setUp.
	operator := P3GUnaryOperator new
						target: 1;
						operator: $~;
						yourself.