initialization
initialize
	super initialize.
	self
		instructions: OrderedCollection new;
		"numpy module is mandatory to be able to serialize 'Float nan'"
		add: 'numpy' asP3GIdentifier import