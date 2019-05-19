# Python3Generator
[![Build Status](https://travis-ci.org/juliendelplanque/Python3Generator.svg?branch=master)](https://travis-ci.org/juliendelplanque/Python3Generator)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/juliendelplanque/Python3Generator/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A toolkit to generate Python 3 source code from Pharo.

## Install
To be able to execute the Python code generated directly from Pharo, you need to have Python 3 installed on your computer.

```
Metacello new
    baseline: 'Python3Generator';
    repository: 'github://juliendelplanque/Python3Generator/src';
    load
```

If your `python3` binary is located in a standard path in your file system, it should be fine, else you can manually set the path to `python3` binary using for example: `P3GInterpreter current pathToPython: '/usr/bin/python3'`.

## Version management 

This project use semantic versionning to define the releases. This mean that each stable release of the project will get associate a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

When a release contains only bug fixes, the patch number increase. When the release contains new features backward compatibles, the minor version increase. When the release contains breaking changes, the major version increase. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Examples
### Getting os information in `/tmp/os.json` file
```
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
> Remark: To really use MatplotLib from Pharo, I created the [MatplotLibBridge](https://github.com/juliendelplanque/MatplotLibBridge) project which provides an higher lever interface.

```
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

# Acknowledgement
- Thanks to [Alejandro Infante](https://github.com/alejandroinfante) for his contribution to this project (based on his work on [Python3Bridge](https://github.com/ObjectProfile/PythonBridge) that you should check by the way, it is a nice complement to P3G).
