#!/bin/bash

texmf=
home=$(kpsewhich -var-value TEXMFHOME)
local=$(kpsewhich -var-value TEXMFLOCAL)

if [ -w $local ]; then texmf=$local; else texmf=$home; fi
if [ -z "$texmf" ]; then echo "Cannot find TEXMF directory"; exit 1; fi

echo "Installing ForSyDe LaTeX in $texmf ..."

metafont=$texmf/fonts/source/public/typeface
foundry=$texmf/fonts/tfm/foundry/typeface
manual=$texmf/doc/forsyde-latex
source=$texmf/tex/latex/forsyde-latex

mkdir -p $metafont $foundry $manual $source

cp -f src/*.sty $source
cp -f src/*.tex $source
cp -f fonts/*.mf $metafont

cd fonts
for file in *8.mf *10.mf *14.mf; do
    mf '\mode:=ljfour; nonstopmode; input '"$file"''
    mv ${file%.*}.tfm $foundry
done
rm *log; rm *gf

