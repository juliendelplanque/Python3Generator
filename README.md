# Python3Generator [![Build Status](https://travis-ci.org/juliendelplanque/Python3Generator.svg?branch=master)](https://travis-ci.org/juliendelplanque/Python3Generator)
A toolkit to generate Python 3 source code from Pharo.

## Install
To be able to execute the Python code generated directly from Pharo, you need to have Python 3 installed on your computer.

```
Metacello new
    baseline: 'Python3Generator';
    repository: 'github://juliendelplanque/Python3Generator/repository';
    load
```

Once Python3Generator is installed in your image, you need to configure [Python3Generator](https://github.com/juliendelplanque/Python3Generator) to use the Python interpreter you prefer. My advise is to use the FFI interpreter using: `P3GInterpreter useFFIInterpreter`. If your `python3` binary is located in a standard path in your file system, it should be fine, else you can manually set the path to `python3` binary using for example: `P3GInterpreter current pathToPython: '/usr/bin/python3'`.

## Examples
### Getting os information in `/tmp/os.json` file
```
"Use and initialize the FFI interpreter."
P3GInterpreter useFFIInterpreter.
P3GInterpreter current pathToPython: '/usr/bin/python3'.

instr := P3GInstructionsList new.

json := 'json' asP3GIdentifier.
file := 'file' asP3GIdentifier.
os := 'os' asP3GIdentifier.

instr addAll: {
    json import.
    os import.
    file <- ('open' asP3GIdentifier callWith: #('/tmp/osp3g.json' 'w')).
    (file=>#write) callWith: { (json=>#dumps) callWith: {{
                                                'os' -> (os=>#name).
                                                'uname' -> (os=>#uname) call } asDictionary} }.
    ((file=>#close) call)
}.

instr execute.
```

### Open a Qt window using PyQt4
```
"Use and initialize the FFI interpreter."
P3GInterpreter useFFIInterpreter.
P3GInterpreter current pathToPython: '/usr/bin/python3'.

"instructions will hold the instructions of the program we are going to build."
instructions := P3GInstructionsList new.

"Import sys and PyQt."
sys := 'sys' asP3GIdentifier.

pyqt := 'PyQt4' asP3GIdentifier => 'QtGui'.
instructions
    add: sys import;
    add: pyqt import.

"Instantiate Qt App."
app := 'app' asP3GIdentifier.
instructions
    add: app <- ((pyqt => 'QApplication') callWith: #(())).

"Create a simple window with a progress bar."
w  := 'w' asP3GIdentifier.
instructions
    add: w <- (pyqt => 'QMainWindow') call;
    add: (((w => 'statusBar') call => 'showMessage') callWith: #('Ready'));
    add: ((w => 'setGeometry') callWith: #(300 300 250 150));
    add: (( w => 'setWindowTitle') callWith: #(Statusbar));
    add: (w => 'show') call;
    add: ((sys => 'exit') callWith: { (app => 'exec_') call }).

"Execute the program built (you can inspect instructions to see the source code)."
instructions execute.
```

### Plot an histogram with MatplotLib
Remark to really use MatplotLib from Pharo, I created the [MatplotLibBridge](https://github.com/juliendelplanque/MatplotLibBridge) project which provides an higher lever interface.

```
"Use and initialize the FFI interpreter."
P3GInterpreter useFFIInterpreter.
P3GInterpreter current pathToPython: '/usr/bin/python3'.

numpy := 'numpy' asP3GIdentifier.
mlab := 'matplotlib' asP3GIdentifier=>#mlab.
pyplot := 'matplotlib' asP3GIdentifier=>#pyplot.

instr := P3GInstructionsList new.

instr addAll: {
    "Import modules."
    numpy import.
    mlab import.
    pyplot import.

    "Set seed for random."
    (numpy=>#random=>#seed) callWith: #(0).

    "Example data"
    #mu asP3GIdentifier <- 100.
    #sigma asP3GIdentifier <- 15.
    #x asP3GIdentifier <- (#mu asP3GIdentifier + (#sigma asP3GIdentifier * ((numpy=>#random=>#randn) callWith: #(437)))).

    #num_bin asP3GIdentifier <- 50.

    #res asP3GIdentifier <- (pyplot=>#subplots) call.
    #fig asP3GIdentifier <- (#res asP3GIdentifier at: 0).
    #ax asP3GIdentifier <- (#res asP3GIdentifier at: 1).

    "Plot histogram of data."
    #res asP3GIdentifier <- ((#ax asP3GIdentifier=>#hist) callWith: {#x asP3GIdentifier.#num_bin asP3GIdentifier} with: {'normed' -> 1 } asDictionary).
    #bins asP3GIdentifier <- (#res asP3GIdentifier at: 1).

    "Add a 'best fit line'"
    #y asP3GIdentifier <- ((mlab=>#normpdf) callWith: {#bins asP3GIdentifier . #mu asP3GIdentifier . #sigma asP3GIdentifier}).
    (#ax asP3GIdentifier=>#plot) callWith: { #bins asP3GIdentifier . #y asP3GIdentifier . '--' }.

    (pyplot=>#show) call
 }.

instr execute
```
