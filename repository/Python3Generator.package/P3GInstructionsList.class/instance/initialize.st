initialization
initialize
	super initialize.
	self
		instructions: OrderedCollection new;
		indentationsCount: 0;
		indentationChar: Character space