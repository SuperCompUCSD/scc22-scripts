#!/bin/sh -e
echo Cloning repo...
git clone https://github.com/IO500/io500
script_path=$(readlink -f $(dirname "$0"))
cd io500/

echo Compiling, first pass...
./prepare.sh || true

echo Fix linker flags
sed -i "s|^LDFLAGS=\"\"$|LDFLAGS=\"$(mpicxx -showme:link)\"|" build/pfind/compile.sh

echo Compiling, second pass...
./prepare.sh

ls -l --color io500
echo && echo $(tput bold && tput setaf 3)Tada!$(tput sgr0)
