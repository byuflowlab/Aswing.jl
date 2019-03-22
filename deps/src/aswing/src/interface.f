C --------------------------- C
C --- Interface Functions --- C
C --------------------------- C

      SUBROUTINE OPERJL(DELTAT, NTIMES)
        INCLUDE 'ASWING.INC'
        CHARACTER*4 COMAND
        CHARACTER*80 COMARG
        REAL DELTAT
        INTEGER NTIMES

        COMAND = ARGP1
        COMARG = ' '

        CALL OPER(COMAND, COMARG, DELTAT, NTIMES)
      END

      SUBROUTINE OUTPUTJL(FNAME, FNAMELEN)
        INTEGER, INTENT(IN) :: FNAMELEN
        CHARACTER*(FNAMELEN), INTENT(IN) :: FNAME
        CALL OUTPUT(FNAME)
      END ! OUTPUTJL

      SUBROUTINE PNTSAVJL(FNAME, FNAMELEN, IPNT1, IPNT2)
        INTEGER, INTENT(IN) :: FNAMELEN
        CHARACTER*(FNAMELEN), INTENT(IN) :: FNAME
        CALL PNTSAV(FNAME, IPNT1, IPNT2)
      END !PNTSAVJL

      SUBROUTINE SETSAVJL(FNAME, FNAMELEN)
        INTEGER, INTENT(IN) :: FNAMELEN
        CHARACTER*(FNAMELEN), INTENT(IN) :: FNAME
        CALL SETSAV(FNAME)
      END ! SETSAVJL

      LOGICAL FUNCTION LOWRIT(FNAME)
        CHARACTER*(*) FNAME
        LOWRIT = .TRUE.
      END !LOWRIT

C ------------------------------- C
C --- Dummy Plotting Routines --- C
C ------------------------------- C

      SUBROUTINE COLORSPECTRUMHUES(ncols,HUESTR)
        character*(*) HUESTR
      END !COLORSPECTRUMHUES

      SUBROUTINE NEWPEN(IPEN)
      END

      subroutine PLCHAR(xc,yc,chx,STRING,ANGLE,nc)
        CHARACTER*(*) STRING
      END

      SUBROUTINE PLINITIALIZE()
      END ! PLINITIALIZE

      SUBROUTINE PLTCLF(IPNT1,IPNT2, IPNTD, IFRST,ILAST,
     &                  LPBEAM, NBEAM, KBTYPE,
     &                  S,Q0,QPNT0,QPNT, LBASE,
     &                  QPMIN, QPMAX,
     &                  NPYLO,IPYLO,QPYLO,ISPYLO,KPTYPE,
     &                  ILINE, ICOLOR, ICOLB,
     &                  SIZE, CSIZ, LPGRID, LNODES,
     &                  NAME, ANAME, BNAME,
     &                  VERSION)

      INCLUDE 'DIMEN.INC'
      INCLUDE 'INDEXP.INC'
C
      DIMENSION KBTYPE(NBX)
      LOGICAL LPBEAM(NBX)
C
      DIMENSION S(IIX), Q0(6,IIX),
     &          QPNT0(IIX,IQTOT), QPNT(IIX,IQTOT,*)
      DIMENSION QPMIN(6), QPMAX(6)
C
      DIMENSION IPYLO(NPX), ISPYLO(NPX), KPTYPE(NPX)
      DIMENSION QPYLO(0:KPX,NPX)
C
      DIMENSION ILINE(*), ICOLOR(*), ICOLB(NBX)
      CHARACTER*(*) NAME, ANAME(*), BNAME(NBX)
      END !PLTCLF

      subroutine PLFLUSH
      end

      SUBROUTINE PLTPAR(XPLT,YPLT, IPNT1,IPNT2, IPNTD,
     &                  PARAM0, PARAM ,
     &                  QSENS0, QSENS ,
     &                  LBASE,
     &                  SREF, BREF,
     &                  LCONV, LLINE, ILINE, ICOLOR, CSIZ )

      INCLUDE 'DIMEN.INC'
      INCLUDE 'INDEXP.INC'
      INCLUDE 'UNITS.INC'
      INCLUDE 'PLVARS.INC'
C
      DIMENSION PARAM0(KPTOT)
      DIMENSION PARAM (KPTOT,*)
      DIMENSION QSENS0(KSTOT,NSENX)
      DIMENSION QSENS (KSTOT,NSENX,*)
      DIMENSION ILINE(*), ICOLOR(*)
      LOGICAL LBASE, LCONV(*), LLINE
      END
