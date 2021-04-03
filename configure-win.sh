#!/usr/bin/env bash
echo export PGPLOT_DIR=$PWD/i686-w64-mingw32-gcc > Makefile-win.in
echo export GFORTRAN_DIR=$PWD/i686-w64-mingw32-gfortran >> Makefile-win.in
cp Makefile.win Makefile

