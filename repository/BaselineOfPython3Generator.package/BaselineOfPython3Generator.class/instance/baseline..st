baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			self
				definePackages: spec;
				defineDependencies: spec ]