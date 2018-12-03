The ForSyDe-LaTeX utilities
===========================

This is the main repo for the ForSyDe-LaTeX style packages. This library was developed as an effort to standardize symbols and graphical primitives in documents related to the ForSyDe methodology, but also to provide tools and utilities for user convenience.

Installation & Usage
--------------------

This project comes with a [GNU Make](https://www.gnu.org/software/make/) instalation script which copies the library files and custom fonts in the default `LaTeX` search paths, We have developed with and recommend [Tex Live 2017](https://www.tug.org/texlive/).

Here is a list with all the provided `make` commands:

```
make install          # (default) installs packages and fonts under TEXMFHOME
sudo make install     # installs packages and fonts under TEXMFLOCAL
make uninstall        # uninstalls the packages and fonts from TEXMFHOME
sudo make uninstall   # uninstalls the packages and fonts from TEXMFLOCAL
make doc              # compiles the reference manual
make clean            # cleans the intermediate files generated for the reference manual
make superclean       # removes manual and generated files
```

*OBS:* depending on your OS or your chosen installation method, you might need to run `sudo texhash` to rebuild the TeX path database.

If you cannot use GNU Make or your `LaTeX` suite does not contain the tools necessary, refer to the installation section in the [user manual](https://forsyde.github.io/forsyde-latex/assets/pdf/refman.pdf). The installation script will try to create a corresponding folder tree under `TEXMFLOCAL` (on Ubuntu `/usr/local/share/texmf`) and if it does not have write access, it will revert to `TEXMFHOME` (usually `$(HOME)/texmf`). 

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

This document comes with a [reference manual](https://forsyde.github.io/forsyde-latex/assets/pdf/refman.pdf) in `doc/refman.tex`. The Makefile provided should be able to compile the document unless the LaTeX toolchain is not properly set up or there is an unmet dependency.

Examples
--------

Code examples can be found in [`docs/figs_orig`](docs/figs_orig) and in [`examples`](examples), and are pre-compiled on the [web page](https://forsyde.github.io/forsyde-latex/#examples).

Contribution
------------

The package files are documented and contributions should be self-explanatory. Feel free to branch your own changes and/or initiate pull requests. All new feature must be documented in the reference manual.
