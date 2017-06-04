# Python3Generator [![Build Status](https://travis-ci.org/juliendelplanque/Python3Generator.svg?branch=master)](https://travis-ci.org/juliendelplanque/Python3Generator)
A toolkit to generate Python 3 source code from Pharo.

## Install
```
Metacello new
    baseline: 'Python3Generator';
    repository: 'github://juliendelplanque/Python3Generator/repository';
    load
```

## Examples
### Getting os information in `/tmp/os.json` file
```
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
