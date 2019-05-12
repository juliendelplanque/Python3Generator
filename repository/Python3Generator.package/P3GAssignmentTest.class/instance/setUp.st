running
setUp
	super setUp.
	assignment := P3GAssignment new
						target: (P3GIdentifier named: 'variable');
						toAssignate: 42;
						yourself.