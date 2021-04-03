# Makefile for PGPLOT.
# ./makemake /opt/space/sw/PGPLOT/pgplot linux g77_gcc
# This file is automatically generated. Do not edit.
#
# This generates the PGPLOT binary files (libraries and demos) in the
# current default directory (which need not be the source directory).
#-----------------------------------------------------------------------
include Makefile.in
SHELL=/bin/sh
#
RM = rm -f
OUTEXT = .png
OUTFILE = simple$(OUTEXT)
#	PGPLOT subdirectories
SRC=.
#
# Fortran compiler and compilation flags
#
FCOMPL=g77
FFLAGC=-u -Wall -fPIC -O
FFLAGD=-fno-backslash
#
# C compiler and compilation flags
#
XINCL=-I/usr/X11R6/include
MOTIF_INCL=-I/usr/X11R6/include -IXm
ATHENA_INCL=-I/usr/X11R6/include
TK_INCL=-I/usr/include -I/usr/X11R6/include -I/usr/include/tcl8.6
RV_INCL=
CCOMPL=gcc
CFLAGC=-Wall -fPIC -DPG_PPU -O -I.
CFLAGD=-Wall -O
MCOMPL=
MFLAGC=
#
# Pgbind flags.
#
PGBIND_FLAGS=bsd
#
# Loader library-flags
#
LIBS=-Lx86_64-linux-gnu -L/usr/X11R6/lib -lX11
MOTIF_LIBS=-Lx86_64-linux-gnu -lXm -lXt -L/usr/X11R6/lib -lX11
ATHENA_LIBS=-Lx86_64-linux-gnu -lXaw -lXt -lXmu -lXext -L/usr/X11R6/lib -lX11
TK_LIBS=-L/usr/lib -ltk -ltcl -L/usr/X11R6/lib -lX11 -ldl
#
#	Loader command for PGPLOT library
#
PGPLOT_LIB=-L`pwd` -lpgplot -lpng -lz
CPGPLOT_LIB=-L`pwd` -lcpgplot -lpgplot -lpng -lz
#
# Shared library creation.
#
SHARED_LIB=libpgplot.so
SHARED_LD=gcc -shared  -o libpgplot.so
#
# The libraries that the shared PGPLOT library depends upon.
# This is for systems that allow one to specify what libraries
# undefined symbols of a shared library reside in. Such systems
# (eg. Solaris 2.x) use this information at run time so that users of
# the library don't have to list a slew of other implementation-specific
# libraries when they link their executables.
#
SHARED_LIB_LIBS=
#
# Ranlib command if required
#
RANLIB=ranlib
#
# Routine lists.
#
DEMOS=pgprog1
#
DEMDIR= .
#-----------------------------------------------------------------------
# Target "all" makes everything (except the library of obsolete routines)
#-----------------------------------------------------------------------
all: $(DEMOS)
	@echo ' ';echo '*** Finished compilation of PGPLOT example ***';echo ' '
	@echo 'Note that the following files will be needed.'
	@echo ' '
	@echo '       libpgplot.a'
	@echo '       libpgplot.so'
	@echo '       grfont.dat'
	@echo '       rgb.txt'
	@echo '       pgdisp'
	@echo '       pgxwin_server'
	@echo '       libXmPgplot.a'
	@echo '       XmPgplot.h'
	@echo '       libXaPgplot.a'
	@echo '       XaPgplot.h'
	@echo '       libtkpgplot.a'
	@echo '       tkpgplot.h'
	@echo ' '
	@echo 'Also note that subsequent usage of PGPLOT programs requires that'
	@echo 'the full path of the chosen installation directory be named in'
	@echo 'an environment variable named PGPLOT_DIR.'
	@echo ' '

#-----------------------------------------------------------------------
# Rules for compiling the .o files
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# The device-driver dispatch routine is generated automatically by
# reading the "drivers.list" file.
#-----------------------------------------------------------------------

DISPATCH_ROUTINE=grexec.o

grexec.o: grexec.f
	$(FCOMPL) -c $(FFLAGC) grexec.f

#-----------------------------------------------------------------------
# Target "lib" is used to built the PGPLOT subroutine library.
# libpgplot.a is the primary PGPLOT object library.
# "shared" is an optional target for operating systems that allow shared
# libraries.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Target "prog" is used to make the demo programs. They can also be made
# individually.
#-----------------------------------------------------------------------
prog: $(DEMOS)

pgprog1: $(DEMDIR)/pgdem1.o $(DEMDIR)/pgex0.o $(DEMDIR)/pgex1.o
	$(FCOMPL) $(FFLAGD) -o $@ $? $(PGPLOT_LIB) $(LIBS)
#-----------------------------------------------------------------------
# Target "grfont.dat" is the binary font file.
# This is created from grfont.txt with the "pgpack" program.
#    (a) compile the `pgpack' program; then
#    (b) run `pgpack' to convert the ASCII version of the font file
#    (grfont.txt) into the binary version (grfont.dat). When executed,
#    `pgpack' should report:
#	Characters defined:   996
#	Array cells used:   26732
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
# Documentation files
#-----------------------------------------------------------------------



#-----------------------------------------------------------------------
# Target "libxmpgplot.a" contains the Motif widget driver.
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
# Target "install" is required for Figaro.
#-----------------------------------------------------------------------
install:

run: pgprog1
	./pgprog1 < pgplot_type.conf


#-----------------------------------------------------------------------
# Target "clean" is used to remove all the intermediate files.
#-----------------------------------------------------------------------
clean :
	$(RM)  $(DEMOS) pgdem1.o pgex0.o pgex1.o $(OUTFILE)

#-----------------------------------------------------------------------
# Include file dependencies
#-----------------------------------------------------------------------
