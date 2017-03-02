The ForSyDe-LaTeX utilities
===========================

This is the main repo for the ForSyDe-LaTeX style packages. This library was developed as an effort to standardize symbols and graphical primitives in documents related to the ForSyDe methodology, but also to provide tools and utilities for user convenience.

Installation
------------

This project comes with an instalation script which copies the library files and custom fonts in the default `LaTeX` search paths. The script has been tested with Ubuntu 16.04 and TexLive, but similar configurations should work. For other OS or `LaTeX` compiler distributions, refer to the installation section in the [user manual](extras/refman.pdf).

The installation script will try to create a corresponding folder tree under `TEXMFLOCAL` (usually `/usr/local/share/texmf`) and if it does not have write access, it will revert to `TEXMFHOME` (usually `$(HOME)/texmf`).

```
./install.sh          # installs packages and fonts under TEXMFHOME
sudo ./install.sh     # installs packages and fonts under TEXMFLOCAL
```

To import the libraries you need to write in the preamble of your document:


```
\usepackage[options]{forsyde}
```

where `options` is a list of packages to load:

 * `tikz` : loads a collection of PGF and TikZ styles, graphical primitives and draw commands
 * `math` : loads a collection of math symbols and math environment commands
 * `plot` : (under construction)
 * `legacy` : API for previous versions of this project

Manual
------

This document comes with a [reference manual](extras/refman.pdf) in `doc/refman.tex`. The Makefile provided should be able to compile the document unless the LaTeX toolchain is not properly set up or there is an unmet dependency.

Pre-compiled examples
---------------------

In the [extras folder](extras/) you can find some pre-compiled example documents, including a version of the user manual.

Contribution
------------

The package files are documented and contributions should be self-explanatory. Feel free to branch your own changes and/or initiate pull requests. All new feature must be documented in the reference manual.
