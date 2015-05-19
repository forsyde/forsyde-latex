The ForSyDe-TikZ package
========================

This is the main repo for the ForSyDe TikZ library.  It contains packages:
 * _forsyde-tikz_: main tikz elements and environments
 * _forsyde-pc_: collection of macros for each ForSyDe process constructor defined until now


Installation
------------

The contents of `src` are to be copied on your local machine. The package is loaded by compiling your document with the `TEXINPUTS` variable set to your installation path, or by copying all package files in your document's root folder or any LaTeX standard loading path. To include the styles you must add in the document preamble:

```
\usepackage{forsyde-tikz}
```

or

```
\usepackage{forsyde-pc}
```


Manual
------

This document comes with a reference manual `doc/refman.tex`. The Makefile provided should be able to compile the document unless the LaTeX toolchain is not properly set up or there is an unmet dependency.


Contribution
------------

The package files are documented and contributions should be self-explanatory. Feel free to branch your own changes and/or initiate pull requests. All new feature must be documented in the reference manual.
