The ForSyDe-LaTeX utilities
===========================

This is the main repo for the ForSyDe-LaTeX style packages. This library was developed as an effort to standardize symbols and graphical primitives in documents related to the ForSyDe methodology, but also to provide tools and utilities for user convenience.

Installation & Usage
--------------------

This project comes with a [GNU Make](https://www.gnu.org/software/make/) instalation script which copies the library files and custom fonts in the default `LaTeX` search paths used by [Tex Live 2017](https://www.tug.org/texlive/). If you cannot use GNU Make or have another `LaTeX` compiler distribution, refer to the installation section in the [user manual](extras/refman.pdf). The installation script will try to create a corresponding folder tree under `TEXMFLOCAL` (usually `/usr/local/share/texmf`) and if it does not have write access, it will revert to `TEXMFHOME` (usually `$(HOME)/texmf`). 

Here is a list with all the provided `make` commands:


```
make install          # installs packages and fonts under TEXMFHOME
sudo make install     # installs packages and fonts under TEXMFLOCAL
make uninstall        # uninstalls the packages and fonts from TEXMFHOME
sudo make uninstall   # uninstalls the packages and fonts from TEXMFLOCAL
make doc              # (default), compiles the reference manual
make clean            # cleans the intermediate files generated for the reference manual
make superclean       # removes manual and generated files
```

To import the libraries you need to write in the preamble of your document:


```
\usepackage[options]{forsyde}
```

where `options` is a list of packages to load:

 * `tikz` : loads a collection of PGF and TikZ styles, graphical primitives and draw commands
 * `math` : loads a collection of math symbols and math environment commands
 * `plot` : loads a collection of alternative TikZ plotting commands, to be used with the dumped signal data.
 * `legacy` : API for previous versions of this project

Manual
------

This document comes with a [reference manual](extras/refman.pdf) in `doc/refman.tex`. The Makefile provided should be able to compile the document unless the LaTeX toolchain is not properly set up or there is an unmet dependency.

Pre-compiled Examples
---------------------

In the [extras folder](extras/) you can find some pre-compiled example documents, including a version of the user manual.

Contribution
------------

The package files are documented and contributions should be self-explanatory. Feel free to branch your own changes and/or initiate pull requests. All new feature must be documented in the reference manual.
