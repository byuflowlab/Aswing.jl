# Aswing.jl

Julia wrapper for the ASWING (A licensed copy of ASWING must be obtained separately). 

## Installation

As ASWING is designed to be a standalone program, several modifications must be made to the original program to allow direct interaction with the program through Julia (and to prevent it from launching GUIs).  This section will guide you through the installation process.

Start by checking out this package for development:
```
(v1.0) pkg> dev https://github.com/byuflowlab/Aswing.jl
```
Julia will automatically try (and fail) to build the package. This is ok, because we weren't ready to build the package anyway.

Then copy the contents of ASWING's src directory into the ~/.julia/dev/Aswing/deps/src/aswing/src directory.  Plotting packages are not used by this wrapper and do not need to be copied over.

Then make the following necessary changes to the source code:

 * In aswing.f:
   * Delete `LOWRIT` function (aswing.f: lines 466-479)
   
 * In exec.f:
   * Decrease `TOLS` and `TOLU` (exec.f: line 17) to 1e-10 by changing 
     ```
           DATA TOLS, TOLU / 0.00010 , 0.001 /
     ```
     to:
     ```
           DATA TOLS, TOLU / 1e-10 , 1e-10 /
     ```
   
 * In init.f:
    * Replace the following lines of code in the `THCALC` subroutine (init.f: line 2599)
     ```
             IBREAK(KB+1) = INT( FLOAT(NINT)*DFRAC + 0.499 )
     ```
     with:
     ```
             IBREAK(KB+1) = INT( FLOAT(NINT)*DFRAC + 0.499 )
             IF (CUSTOMINTERVALS) THEN
                 IBREAK(KB+1) = INTERVALS(KB+1)
             ENDIF
     ```
   * In the same subroutine (`THCALC`) replace (init.f: line 2520)
     ```       
           IMPLICIT REAL (A-H,M,O-Z)
     ```
     with
     ```
           IMPLICIT REAL (A-H,M,O-Z)
           INCLUDE 'THCALC.INC'
     ```
     
 * In io.f:
   * Replace `SUBROUTINE DUMPDM(LU, IPNT)` (io.f: line 1927) with: 
     ```
           SUBROUTINE DUMPDM(LU, F_VBA, M_VBA, F_ROT, 
          & M_ROT, F_FLAP, M_FLAP, F_PENG, M_PENG, IPNT)
     ```
   * Delete the following lines from `BINPUT` (io.f: lines 20-34)
     ```
     C---- read configuration-definition file
           LU = 1
           OPEN(LU,FILE=FILNAM,STATUS='OLD',ERR=99)
           CALL BINPUT(LU,IBX,JBX,
          &            NBX, NBEAM, NB, QB, TB, BNAME, KBNUM,IBEAM,
          &            NJX, NJOIN, TJOIN, KBJOIN, KJTYPE,
          &            NGX, NGROU, TGROU, KBGROU, KGTYPE,
          &       KPX, NPX, NPYLO, QPYLO, KBPYLO, KPTYPE,
          &     NENGX, IENGTYP,
          &            NAJX,NANGJ, MOMJ, ANGJ, HJAX,
          &            UNITL, UNITM, UNITT, UNITF,
          &            UNCHL, UNCHM, UNCHT, UNCHF,
          &            GEEW, RHOSL, VSOSL, SREF,CREF,BREF,XYZREF,
          &            NAME )
           CLOSE(LU)
     ```
     
 * In iosubs.f:
   * Fix `LBSYMM` bug in `OUTPUT` (iosubs.f: line 1417) by changing
     ```
           LOGICAL LBSYMM(JBX,NBX)
     ```
     to:
     ```
           LOGICAL LBSYMM(0:JBX,NBX)
     ```
   * Also fix output bug (iosubs.f: line 1817) by changing
     ```
             ELSEIF( IPTYPE.EQ.3 .AND. KPTYPE(KP).GT.10      ) THEN
     ```
     to:
     ```
             ELSEIF( IPTYPE.EQ.3 .AND. KPTYPE(KP).GT.10
          & .AND. KPTYPE(KP).LT.100) THEN
     ```

 * In oper.f:
   * Delete the lines which prompt for DELTAT and NTIMES (oper.f: line 712-716)
     ```
             WRITE(*,2052) DELTAT, NTIMES
      2052   FORMAT(
          &   /' Enter delta(t), Nstep  (-Nstep to append steps)', F9.5, I8)
             CALL READR(2,AINPUT,ERROR)
             IF(ERROR) GO TO 52
     ```
     
   * Change ```GO TO 530``` to ```GO TO 500``` when checking if point index was input (oper.f: line 133)
     
   * Delete the line which prompts for OPER menu input (oper.f: 92)
     ```
           CALL ASKARG(PROMPT,COMAND,COMARG)
     ```

   * Move ` 500 CONTINUE` (oper.f: line 45) and ` 510  CONTINUE` (oper.f: line 83) to end of `OPER` subroutine (oper.f: line 1383)

   * Delete `STEADY = .TRUE.` line (oper.f: line 37)

   * Delete the following lines (oper.f: lines 32-34)
     ```
           SAVE DELTAT, NTIMES
           DATA DELTAT / 0.1 /
           DATA NTIMES / 10  /
     ```
   * Add inputs to subroutine `OPER` (oper.f: line 2) by changing 
     ```
           SUBROUTINE OPER 
     ```
     to
     ```
           SUBROUTINE OPER(COMAND, COMARG, DELTAT, NTIMES)
     ```
   
You may also want to remove (or comment out) a number of `WRITE` statements from the original code to prevent ASWING from printing a plethora of information.  These include, but are not limited to the following lines in the original source code:

   * cexec.f: 483; 524; 570; 688; 769-771; 843-844; 1046-1068; 1081-1084
   * exec.f: 26-27; 30-31;
   * io.f: 131-143; 352-364; 531-534; 596-599; 710-711; 742; 2248-2521
   * iosubs.f: 2052
   * init.f: 1047-1051
   * oper.f: 54; 128; 184-185; 263-264; 548-549; 601; 600-607; 712-714; 819-820; 852-893; 1391-1392
   * update.f: 370-384
 
After performing the changes listed above, build the package to automatically build a shared library that Julia can call.
```
(v1.0) pkg> build Aswing
```

You are now ready to use the Aswing.jl package.

Note that if you wish to change the file DIMEN.INC to increase FORTRAN array limits, the file dimenglobals.jl must also be modified and the package must be rebuilt.

## Rebuilding

To rebuild, first delete the shared library that we created in ~/.julia/dev/Aswing/deps/usr/lib directory.  Then rebuild the package to automatically regenerate the shared library.
```
(v1.0) pkg> build Aswing
```

## Testing

In order to test that the package works, the hawk.asw and hawk.pnt example configuration files (found in the `runs` folder of the original Aswing package folder) must be copied to the test directory.

## Usage

Example usage can be found in the example directory.  Most functions are documented in the source code. Access to FORTRAN global variables can be obtained through the ASWING global struct. Use of this package is easiest if the user has experience using ASWING as a standalone package and understands the necessary workflow in ASWING to analyze flexible aircraft.  

## Capabilities

The following capabilities have been wrapped:
 * Geometry Input
 * Operating Point Input
 * Steady solution
 * Unsteady solution
 * Eigenmode Analysis
 * Gust Input
 * Controls (but no parameter scheduling)
 
The following capabilities have not been wrapped:
 * Bode Analysis

## Disclaimer

This wrapper was developed for ASWING v 6.00.  Only OSX and Linux build processes are implemented.  There are no guarantees that this code will work with other versions and/or setups, in reality there are no guarantees that any of it will work at all, but I have used this wrapper in my research very successfully without issues.

