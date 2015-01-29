The ForSyDe-TikZ package
========================

This is the main repo for the ForSyDe TikZ library.  It contains packages:
 * _forsyde-tikz_: main tikz elements and environments
 * _forsyde-pc_: collection of macros for each ForSyDe process constructor defined until now


Installation
------------

Until I learn how to do a standard CTAN package and (hopefully) upload it on TexLive repos, you will have to manually set up these packages The easiest way is to copy all filex except `README.md`, `refman.tex` and `.gitignore` in your tex project root folder and include the packages in the document preamble:

```
\usepackage{forsyde-tikz}
```

or

```
\usepackage{forsyde-pc}
```


Manual
------

This document comes with a reference manual `refman.tex`. Compile it using your favourite latex compiler or makefile and check it out.


Contribution
------------

The packages are well documented and contributions should be self-explanatory. Feel free to make a new branch or ask before you push into the master. All new feature should e included also in the reference manual.
