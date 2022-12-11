#! /bin/zsh

ocamlopt $*
rm *.cmi *.cmx *.o
./a.out
