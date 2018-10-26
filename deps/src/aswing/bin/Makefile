#=======================================================#
# Makefile for ASWING 5.9x
#=======================================================#

SRC = ../src
SUFFIX = so
ASWINGLIB = libaswing.$(SUFFIX)

# convenient place to put the shared library
INSTALL_DIR = /usr/local/lib
INSTALL = install

## Default compiler
FC = gfortran

FLG  = -O3 -fdefault-real-8 -fPIC
FLGT = -O3 -fdefault-real-8 -fPIC

#FLG  = -O -fdefault-real-8 -fPIC -fbounds-check -finit-real=Inf -ffpe-trap=invalid,zer,overflow
#FLGT = -O -fdefault-real-8 -fPIC -fbounds-check -finit-real=Inf -ffpe-trap=invalid,zer,overflow

#Subroutine SECONDS source file
SECONDS = seconds_g77.f

# Auxilliary Fortran link library
FTNLIB =

#Eispack library
EISOBJ =
#EISOBJ = ../../Eispack/eispack.a


## No array checking is default
#ACHK = -fbounds-check
ACHK =


## Default debugging routines
CHKOBJ =
#CHKOBJ = mdump.o

## Default ARPACK interface routines
#ARLIB = arpack0.o
ARLIB = -larpack

# ASWINGLIB = libaswing.so

OBJ = aswing.o conlaw.o io.o iosubs.o init.o q0flap.o \
oper.o mode.o pntops.o exec.o tmarch.o setup.o \
gsetup.o gssubs.o floads.o sloads.o aicalc.o \
aic.o pgxyz.o grim.o vjet.o forces.o \
update.o cexec.o eigen.o ludcmp.o lusolv.o \
system.o vels.o vgust.o engine.o xyproj.o \
spline.o atmo.o userio.o seconds.o interface.o\
plutil.o \
$(CHKOBJ) \
$(EISOBJ)


#=====================================
# Targets

aswing: $(OBJ)
	$(FC) -shared -fPIC -o $(ASWINGLIB) $(OBJ) $(ARLIB) $(FTNLIB)

clean:
	rm -f $(ASWINGLIB)
	rm -f $(OBJ)
#	-/bin/rm *.o

install:
	$(INSTALL) $(ASWINGLIB) $(INSTALL_DIR)

#=====================================
# Source - fortran and include files

$(SRC)/ASWING.INC: $(SRC)/DIMEN.INC $(SRC)/INDEXP.INC $(SRC)/INDEXC.INC
	touch $(SRC)/ASWING.INC

interface.o: $(SRC)/interface.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC  $(SRC)/UNITS.INC \
$(SRC)/PLVARS.INC $(SRC)/LSVARS.INC $(SRC)/EIGEN.INC
	$(FC) -c $(FLG) $(SRC)/interface.f

aswing.o: $(SRC)/aswing.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC  $(SRC)/UNITS.INC \
$(SRC)/PLVARS.INC $(SRC)/LSVARS.INC $(SRC)/EIGEN.INC
	$(FC) -c $(FLG) $(SRC)/aswing.f

io.o: $(SRC)/io.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC $(SRC)/UNITS.INC $(SRC)/LSVARS.INC
	$(FC) -c $(FLG) $(SRC)/io.f

init.o: $(SRC)/init.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC $(SRC)/UNITS.INC $(SRC)/PLVARS.INC $(SRC)/LSVARS.INC $(SRC)/EIGEN.INC $(SRC)/THCALC.INC
	$(FC) -c $(FLGT) $(SRC)/init.f

q0flap.o: $(SRC)/q0flap.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/q0flap.f

oper.o: $(SRC)/oper.f $(SRC)/ASWING.INC $(SRC)/UNITS.INC $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/oper.f

bode.o: $(SRC)/bode.f $(SRC)/ASWING.INC $(SRC)/PLVARS.INC $(SRC)/UNITS.INC $(SRC)/EIGEN.INC
	$(FC) -c $(FLG) $(SRC)/bode.f

mode.o: $(SRC)/mode.f $(SRC)/ASWING.INC $(SRC)/PLVARS.INC $(SRC)/UNITS.INC $(SRC)/EIGEN.INC \
$(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/mode.f

evcout.o: $(SRC)/evcout.f $(SRC)/ASWING.INC $(SRC)/PLVARS.INC $(SRC)/UNITS.INC $(SRC)/EIGEN.INC
	$(FC) -c $(FLGT) $(SRC)/evcout.f

option.o: $(SRC)/option.f $(SRC)/ASWING.INC $(SRC)/UNITS.INC $(SRC)/PLVARS.INC $(SRC)/LSVARS.INC
	$(FC) -c $(FLG) $(SRC)/option.f

pntops.o: $(SRC)/pntops.f $(SRC)/ASWING.INC $(SRC)/UNITS.INC $(SRC)/EIGEN.INC
	$(FC) -c $(FLG) $(SRC)/pntops.f

setup.o: $(SRC)/setup.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/setup.f

gsetup.o: $(SRC)/gsetup.f $(SRC)/ASWING.INC $(SRC)/PLVARS.INC $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/gsetup.f

gssubs.o: $(SRC)/gssubs.f $(SRC)/ASWING.INC
	$(FC) -c $(FLGT) $(SRC)/gssubs.f

sloads.o: $(SRC)/sloads.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/sloads.f

aicalc.o: $(SRC)/aicalc.f $(SRC)/ASWING.INC
	$(FC) -c $(FLGT) $(SRC)/aicalc.f

aic.o: $(SRC)/aic.f $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/aic.f

pgxyz.o: $(SRC)/pgxyz.f $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/pgxyz.f

grim.o: $(SRC)/grim.f
	$(FC) -c $(FLGT) $(SRC)/grim.f

vjet.o: $(SRC)/vjet.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/vjet.f

forces.o: $(SRC)/forces.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC
	$(FC) -c $(FLGT) $(SRC)/forces.f

exec.o: $(SRC)/exec.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC $(SRC)/UNITS.INC
	$(FC) -c $(FLGT) $(SRC)/exec.f

cexec.o: $(SRC)/cexec.f $(SRC)/ASWING.INC $(SRC)/PLVARS.INC $(SRC)/EIGEN.INC
	$(FC) -c $(FLGT) $(SRC)/cexec.f

tmarch.o: $(SRC)/tmarch.f $(SRC)/ASWING.INC
	$(FC) -c $(FLGT) $(SRC)/tmarch.f

update.o: $(SRC)/update.f $(SRC)/ASWING.INC
	$(FC) -c $(FLGT) $(SRC)/update.f

lusolv.o: $(SRC)/lusolv.f $(SRC)/ASWING.INC
	$(FC) -c $(FLGT) $(SRC)/lusolv.f

ludcmp.o: $(SRC)/ludcmp.f
	$(FC) -c $(FLGT) $(SRC)/ludcmp.f

eigen.o: $(SRC)/eigen.f $(SRC)/ASWING.INC $(SRC)/EIGEN.INC
	$(FC) -c $(FLGT) $(SRC)/eigen.f

iosubs.o: $(SRC)/iosubs.f $(SRC)/INDEXB.INC
	$(FC) -c $(FLG) $(SRC)/iosubs.f

xyproj.o: $(SRC)/xyproj.f $(SRC)/ASWING.INC $(SRC)/INDEXB.INC $(SRC)/EIGEN.INC
	$(FC) -c $(FLGT) $(SRC)/xyproj.f

system.o: $(SRC)/system.f
	$(FC) -c $(FLGT) $(SRC)/system.f

floads.o: $(SRC)/floads.f
	$(FC) -c $(FLGT) $(SRC)/floads.f

conlaw.o: $(SRC)/conlaw.f $(SRC)/DIMEN.INC $(SRC)/INDEXC.INC $(SRC)/CONLAW.INC
	$(FC) -c $(FLGT) $(SRC)/conlaw.f

engine.o: $(SRC)/engine.f
	$(FC) -c $(FLGT) $(SRC)/engine.f

vgust.o: $(SRC)/vgust.f
	$(FC) -c $(FLGT) $(SRC)/vgust.f

vels.o: $(SRC)/vels.f
	$(FC) -c $(FLGT) $(SRC)/vels.f

spline.o: $(SRC)/spline.f
	$(FC) -c $(FLG) $(SRC)/spline.f

atmo.o: $(SRC)/atmo.f
	$(FC) -c $(FLG) $(SRC)/atmo.f

userio.o: $(SRC)/userio.f
	$(FC) -c $(FLG) $(SRC)/userio.f

seconds.o: $(SRC)/$(SECONDS)
	cp $(SRC)/$(SECONDS) $(SRC)/seconds.f
	$(FC) -c $(FLG) $(SRC)/seconds.f


##-------------------------------------------------------------------
##  Note: ARPACK interface routines must NOT be compiled with -r8
##        (they have their own double precision declarations)

arpack0.o: $(SRC)/arpack0.f
	$(FC) -c $(FLG) $(SRC)/arpack0.f
##-------------------------------------------------------------------

plutil.o: $(SRC)/plutil.f $(SRC)/UNITS.INC
	$(FC) -c $(FLGT) $(SRC)/plutil.f
