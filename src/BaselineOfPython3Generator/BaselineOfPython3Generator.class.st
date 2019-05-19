Class {
	#name : #BaselineOfPython3Generator,
	#superclass : #BaselineOf,
	#category : 'BaselineOfPython3Generator'
}

{ #category : #baseline }
BaselineOfPython3Generator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self
				definePackages: spec ]
]

{ #category : #baseline }
BaselineOfPython3Generator >> definePackages: spec [
	^ spec
		package: 'Python3Generator';
		yourself
]
