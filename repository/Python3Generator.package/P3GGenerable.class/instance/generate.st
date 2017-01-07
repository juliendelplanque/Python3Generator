translating
generate
	"Returns the Python 3 code generated."
	^ String streamContents: [ :stream |
		self writePython3On: stream ]