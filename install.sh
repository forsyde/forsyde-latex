#!/bin/bash

texmf=
home=$(kpsewhich -var-value TEXMFHOME)
local=$(kpsewhich -var-value TEXMFLOCAL)

if [ -w $local ]; then texmf=$local; else texmf=$home; fi
if [ -z "$texmf" ]; then echo "Cannot find TEXMF directory"; exit 1; fi

echo "Installing ForSyDe LaTeX in $texmf ..."

metafont=$texmf/fonts/source/public/typeface
foundry=$texmf/fonts/tfm/foundry/typeface
manual=$texmf/doc/forsyde
source=$texmf/tex/latex/forsyde

mkdir -p $metafont $foundry $manual $source

# remove previous installations
rm -f $manual/* $source/*
find $texmf/fonts/ -name "forsyde*" -type f -delete

# copy sources in their respective place
cp -f src/*.sty $source
cp -f src/*.tex $source
cp -f fonts/*.mf $metafont
cd fonts
for file in *8.mf *10.mf *14.mf; do
    if mf '\mode:=ljfour; nonstopmode; input '"$file"'' ; then
	mv ${file%.*}.tfm $foundry
    fi
done
rm *log; rm *gf

# # compiling the documentation
# cd ../doc
# echo "Compiling reference manual..."
# echo "Please be patient since it is also generating the font maps..."
# make > /dev/null
# cp refman.pdf $manual/


echo "The ForSyDe-LaTeX utilities have been succesfully installed!"
