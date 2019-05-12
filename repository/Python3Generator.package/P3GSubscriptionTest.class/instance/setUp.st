running
setUp
	super setUp.
	subscription := P3GSubscription new
							target: 'test' asP3GIdentifier;
							insideBrackets: 2;
							yourself.