The ForSyDe-TikZ package
========================

This is the main repo for the ForSyDe TikZ library.  It contains packages:
 * _forsyde-tikz_: main tikz elements and environments
 * _forsyde-pc_: collection of macros for each ForSyDe process constructor defined until now


Installation
------------

The contents of `src` are to be copied on your local machine, ideally in your LaTeX project folder. The package is loaded by compliling your document with the `TEXINPUTS` variable set to your installation path, or by copying all of the package files in your document's root folder or any LaTeX standard loading paths. To include the styles you must add in the document preamble:

```
\usepackage{forsyde-tikz}
```

or

```
\usepackage{forsyde-pc}
```


Manual
------

This document comes with a reference manual `doc/refman.tex`. The Makefile provided should be able to compile the document if the LaTeX toolchain is properly set up and all the dependencies are met.


Contribution
------------

The package files are documented and contributions should be self-explanatory. Feel free to make a new branch or ask before you push into the master. All new feature should be included also in the reference manual.
