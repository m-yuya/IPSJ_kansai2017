#!/bin/bash

printf "\nListing old tex files...\n"
ls diff_tex/
printf "\nSelect *.tex: "
read  old_file
old_file=$old_file.tex
echo $old_file
latexdiff diff_tex/$old_file $1.tex > diff.tex
platex diff.tex
pbibtex diff
platex diff.tex
platex diff.tex
dvipdfmx diff.dvi
mv diff.* ./diff/