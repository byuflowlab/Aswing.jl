var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#Aswing-1",
    "page": "Home",
    "title": "Aswing",
    "category": "section",
    "text": "Author: Taylor McDonnell"
},

{
    "location": "index.html#Summary-1",
    "page": "Home",
    "title": "Summary",
    "category": "section",
    "text": "Julia wrapper for the ASWING (A licensed copy of ASWING must be obtained separately)."
},

{
    "location": "index.html#Features-1",
    "page": "Home",
    "title": "Features",
    "category": "section",
    "text": "The following capabilities have been wrapped:Geometry Input\nOperating Point Input\nSteady solution\nUnsteady solution\nEigenmode Analysis\nGust Input\nControls (but no parameter scheduling)The following capabilities have not been wrapped:Bode Analysis"
},

{
    "location": "index.html#Rebuilding-1",
    "page": "Home",
    "title": "Rebuilding",
    "category": "section",
    "text": "Rebuilding the package will automatically regenerate the shared library.(v1.0) pkg> build Aswing"
},

{
    "location": "index.html#Testing-1",
    "page": "Home",
    "title": "Testing",
    "category": "section",
    "text": "In order to test that the package works, the hawk.asw and hawk.pnt example configuration files (found in the runs folder of the original Aswing package folder) must be copied to the test directory."
},

{
    "location": "index.html#Usage-1",
    "page": "Home",
    "title": "Usage",
    "category": "section",
    "text": "Example usage can be found here.  Most functions are also documented in the source code. Access to FORTRAN global variables can be obtained through the ASWING global composite type. Use of this package is easiest if the user has experience using ASWING as a standalone package and understands the necessary workflow in ASWING to analyze flexible aircraft."
},

{
    "location": "index.html#Disclaimer-1",
    "page": "Home",
    "title": "Disclaimer",
    "category": "section",
    "text": "This wrapper was developed for ASWING v6.00.  Only OSX and Linux build processes are implemented.  There are no guarantees that this code will work with other versions and/or setups, in reality there are no guarantees that any of it will work at all, but I have used this wrapper in my research successfully without issues and have tested it against the unmodified ASWING program."
},

{
    "location": "install.html#",
    "page": "Installation",
    "title": "Installation",
    "category": "page",
    "text": ""
},

{
    "location": "install.html#Installation-1",
    "page": "Installation",
    "title": "Installation",
    "category": "section",
    "text": "As ASWING is designed to be a standalone program, several modifications must be made to the original program to allow direct interaction with the program through Julia (and to prevent it from launching GUIs).  This section will guide you through the installation process.Start by checking out this package for development:(v1.0) pkg> dev https://github.com/byuflowlab/Aswing.jlJulia will automatically try (and fail) to build the package. This is ok, because we weren\'t ready to build the package anyway.Then copy the contents of ASWING\'s src directory into the ~/.julia/dev/Aswing/deps/src/aswing/src directory.  Plotting packages are not used by this wrapper and do not need to be copied over.Then make the following necessary changes to the source code:In aswing.f:\nDelete LOWRIT function (aswing.f: lines 466-479)\nIn exec.f:\nDecrease TOLS and TOLU (exec.f: line 17) to 1e-10 by changing\n      DATA TOLS, TOLU / 0.00010 , 0.001 /\nto:\n      DATA TOLS, TOLU / 1e-10 , 1e-10 /\nIn init.f:\nReplace the following lines of code in the THCALC subroutine (init.f: line 2599)\nIBREAK(KB+1) = INT( FLOAT(NINT)*DFRAC + 0.499 )   with:   IBREAK(KB+1) = INT( FLOAT(NINT)*DFRAC + 0.499 )           IF (CUSTOMINTERVALS) THEN               IBREAK(KB+1) = INTERVALS(KB+1)           ENDIF\nIn the same subroutine (THCALC) replace (init.f: line 2520)\n      IMPLICIT REAL (A-H,M,O-Z)\nwith\n      IMPLICIT REAL (A-H,M,O-Z)\n      INCLUDE \'THCALC.INC\'\nIn io.f:\nReplace SUBROUTINE DUMPDM(LU, IPNT) (io.f: line 1927) with:\n      SUBROUTINE DUMPDM(LU, F_VBA, M_VBA, F_ROT,\n     & M_ROT, F_FLAP, M_FLAP, F_PENG, M_PENG, IPNT)\nDelete the following lines from BINPUT (io.f: lines 20-34)\nC---- read configuration-definition file\n      LU = 1\n      OPEN(LU,FILE=FILNAM,STATUS=\'OLD\',ERR=99)\n      CALL BINPUT(LU,IBX,JBX,\n     &            NBX, NBEAM, NB, QB, TB, BNAME, KBNUM,IBEAM,\n     &            NJX, NJOIN, TJOIN, KBJOIN, KJTYPE,\n     &            NGX, NGROU, TGROU, KBGROU, KGTYPE,\n     &       KPX, NPX, NPYLO, QPYLO, KBPYLO, KPTYPE,\n     &     NENGX, IENGTYP,\n     &            NAJX,NANGJ, MOMJ, ANGJ, HJAX,\n     &            UNITL, UNITM, UNITT, UNITF,\n     &            UNCHL, UNCHM, UNCHT, UNCHF,\n     &            GEEW, RHOSL, VSOSL, SREF,CREF,BREF,XYZREF,\n     &            NAME )\n      CLOSE(LU)\nIn iosubs.f:\nFix LBSYMM bug in OUTPUT (iosubs.f: line 1417) by changing\n      LOGICAL LBSYMM(JBX,NBX)\nto:\n      LOGICAL LBSYMM(0:JBX,NBX)\nAlso fix output bug (iosubs.f: line 1817) by changing\n        ELSEIF( IPTYPE.EQ.3 .AND. KPTYPE(KP).GT.10      ) THEN\nto:\n        ELSEIF( IPTYPE.EQ.3 .AND. KPTYPE(KP).GT.10\n     & .AND. KPTYPE(KP).LT.100) THEN\nIn oper.f:\nAdd the following line at the end of the unsteady solution loop to prevent Aswing from solving additional time steps upon solution failure during an unsteady simulation (oper.f: line 822)\n      IF(.NOT.LCONV(IPOINT)) EXIT\nDelete the lines which prompt for DELTAT and NTIMES (oper.f: line 712-716)\n        WRITE(*,2052) DELTAT, NTIMES\n 2052   FORMAT(\n     &   /\' Enter delta(t), Nstep  (-Nstep to append steps)\', F9.5, I8)\n        CALL READR(2,AINPUT,ERROR)\n        IF(ERROR) GO TO 52\nChange GO TO 530 to GO TO 500 when checking if point index was input (oper.f: line 133)\nDelete the line which prompts for OPER menu input (oper.f: 92)\n      CALL ASKARG(PROMPT,COMAND,COMARG)\nMove 500 CONTINUE (oper.f: line 45) and 510  CONTINUE (oper.f: line 83) to end of OPER subroutine (oper.f: line 1383)\nDelete STEADY = .TRUE. line (oper.f: line 37)\nDelete the following lines (oper.f: lines 32-34)\n      SAVE DELTAT, NTIMES\n      DATA DELTAT / 0.1 /\n      DATA NTIMES / 10  /\nAdd inputs to subroutine OPER (oper.f: line 2) by changing\n      SUBROUTINE OPER\nto\n      SUBROUTINE OPER(COMAND, COMARG, DELTAT, NTIMES)\nIn setup.f:\nFix bug in subroutine GLLCLR (setup.f: line 1867) by adding\n      LADT(1) = 0\n      LADT(2) = 0\n      LADT(3) = 0\nto the subroutine.You may also want to remove (or comment out) a number of WRITE statements from the original code to prevent ASWING from printing a plethora of information.  These include, but are not limited to the following lines in the original source code:cexec.f: 483; 524; 570; 688; 769-771; 843-844; 1046-1068; 1081-1084\nexec.f: 26-27; 30-31;\nio.f: 39; 131-143; 352-364; 531-534; 596-599; 710-711; 742; 2248-2521\niosubs.f: 2052\ninit.f: 1047-1051\noper.f: 54; 128; 184-185; 263-264; 548-549; 601; 600-607; 712-714; 819-820; 852-893; 1391-1392\nupdate.f: 370-384After performing the changes listed above, build the package to automatically build a shared library that Julia can call.(v1.0) pkg> build AswingYou are now ready to use the Aswing.jl package.Note that if you wish to change the file DIMEN.INC to increase FORTRAN array limits, the file dimenglobals.jl must also be modified and the package must be rebuilt."
},

{
    "location": "install.html#Rebuilding-1",
    "page": "Installation",
    "title": "Rebuilding",
    "category": "section",
    "text": "Rebuilding the package will automatically regenerate the shared library.(v1.0) pkg> build Aswing"
},

{
    "location": "example.html#",
    "page": "Example Usage",
    "title": "Example Usage",
    "category": "page",
    "text": ""
},

{
    "location": "example.html#Example-Usage-1",
    "page": "Example Usage",
    "title": "Example Usage",
    "category": "section",
    "text": "I generally prefer to use import rather than using so that I know where various functions come from.import Aswing"
},

{
    "location": "example.html#Reading-and-Loading-Configuration-Files-1",
    "page": "Example Usage",
    "title": "Reading and Loading Configuration Files",
    "category": "section",
    "text": "There are various ways you can load configuration data.  The easiest option is to read from a .asw file.asw = Aswing.readasw(\"hawk.asw\")The other option is to construct a Configuration composite type manually.  This is the more useful approach if you want to automate ASWING runs for varying configurations.Inputing this data to ASWING once you have loaded it is straightforward.Aswing.setgeom(asw)"
},

{
    "location": "example.html#Reading-and-Loading-Operating-Point-Files-1",
    "page": "Example Usage",
    "title": "Reading and Loading Operating Point Files",
    "category": "section",
    "text": "You can also read operating point data from a file.pnt = Aswing.readpnt(\"hawk.pnt\")Or you can construct an OperatingPoint composite type manually.Then you can the load the operating point into ASWING using the following function.Aswing.setpnt(pnt)"
},

{
    "location": "example.html#Saving-Configuration-and-Operating-Point-Files-1",
    "page": "Example Usage",
    "title": "Saving Configuration and Operating Point Files",
    "category": "section",
    "text": "At any point in time you may save configuration and operating point files for analysis with an unmodified version of ASWING.Aswing.aswsav(\"out.asw\")\nAswing.pntsav(\"out.pnt\")"
},

{
    "location": "example.html#Quasi-Steady-Solutions-1",
    "page": "Example Usage",
    "title": "Quasi-Steady Solutions",
    "category": "section",
    "text": "You can find quasi-steady solutions for any number of operating points using the following command.steady_solution = Aswing.solvesteady(1)"
},

{
    "location": "example.html#Stability-Derivatives-1",
    "page": "Example Usage",
    "title": "Stability Derivatives",
    "category": "section",
    "text": "You can also get stability derivatives for that operating pointstabderivs = Aswing.getstabilityderivatives(1)"
},

{
    "location": "example.html#Static-Margin-1",
    "page": "Example Usage",
    "title": "Static Margin",
    "category": "section",
    "text": "Quasi-steady and rigid static margins can be calculated, but the geometry and operating point conditions will need to be re-input afterwardssm_qs, sm_rigid, fail = Aswing.getstaticmargin(1)\n\nAswing.setgeom(asw)\nAswing.setpnt(pnt)\nsteady_solution = Aswing.solvesteady(1)"
},

{
    "location": "example.html#Paneling-1",
    "page": "Example Usage",
    "title": "Paneling",
    "category": "section",
    "text": "The paneling between break points may be obtained and/or modifiednewintervals = [Aswing.getintervals(i) for i  in 1:4]*2\nAswing.nodeset(newintervals)\nsteady_solution = Aswing.solvesteady(1)Note that when you input the geometry again the paneling is reset to the defaultsAswing.setgeom(asw)\nAswing.setpnt(pnt)\n\nintervals = [Aswing.getintervals(i) for i  in 1:4]"
},

{
    "location": "example.html#Time-Domain-Solutions-1",
    "page": "Example Usage",
    "title": "Time Domain Solutions",
    "category": "section",
    "text": "You can also do unsteady solves.  We\'ll start ours from a steady state solution.steady_solution = Aswing.solvesteady(1)We\'ll also set all parameters to the values from this steady state solution and set the constraint set to \"free\"Aswing.retainparam(1)\nAswing.setcons(Aswing.Constraints(\"free\"))Of course, this won\'t be a very exciting time domain simulation because steady state operating conditions will be maintained.unsteady_solution = Aswing.solveunsteady(0.1, 10)"
},

{
    "location": "example.html#Frequency-Domain-Analysis-1",
    "page": "Example Usage",
    "title": "Frequency Domain Analysis",
    "category": "section",
    "text": "You can also get eigenvalues.asweigs = Aswing.geteigs(16, -0.1+0.0im, 1)"
},

{
    "location": "example.html#Accessing-Internal-Aswing-Variables-1",
    "page": "Example Usage",
    "title": "Accessing Internal Aswing Variables",
    "category": "section",
    "text": "If you need to access internal ASWING variables you can access them via the global composite types ASWING, EIGEN, and UNITS which wrap the Fortran global variables contained in the respective files."
},

{
    "location": "library.html#",
    "page": "Library",
    "title": "Library",
    "category": "page",
    "text": ""
},

{
    "location": "library.html#Public-API-1",
    "page": "Library",
    "title": "Public API",
    "category": "section",
    "text": "Modules = [Aswing]\nPrivate = false\nOrder = [:function, :type]"
},

{
    "location": "library.html#Aswing.aswsav-Tuple{Any}",
    "page": "Library",
    "title": "Aswing.aswsav",
    "category": "method",
    "text": "aswsav(file)\nSaves ASWING geometry state to a file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.conadd-NTuple{5,Any}",
    "page": "Library",
    "title": "Aswing.conadd",
    "category": "method",
    "text": "conadd(i,j,ls,gfac,c)\nSets up a proportional control law\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.conclr-Tuple{}",
    "page": "Library",
    "title": "Aswing.conclr",
    "category": "method",
    "text": "conclr()\nClears all control laws\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.freeze",
    "page": "Library",
    "title": "Aswing.freeze",
    "category": "function",
    "text": "freeze(ipoint = 1)\nFreezes geometry at current state\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.geteigs-Tuple{Any,Any,Any}",
    "page": "Library",
    "title": "Aswing.geteigs",
    "category": "method",
    "text": "geteigs(neigen, zshift, ipnt; evmin = 1e-4, evtol = 1e-3)\nReturns eigenvalues of the system\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.getintervals-Tuple{Integer}",
    "page": "Library",
    "title": "Aswing.getintervals",
    "category": "method",
    "text": "getintervals(ibeam::Integer)\nGets number of panels between each break point\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.getstabilityderivatives",
    "page": "Library",
    "title": "Aswing.getstabilityderivatives",
    "category": "function",
    "text": "getstabilityderivatives(ipnt = 1, momref=Float64[])\nCalculates stability derivatives\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.getstaticmargin",
    "page": "Library",
    "title": "Aswing.getstaticmargin",
    "category": "function",
    "text": "getstaticmargin(ipnt::Integer=1)\n\nReturns quasi-steady static margin, rigidized static margin, and a solution\nfailure flag.  Assumes constraints are set up for trimmed flight and follows\nthe instructions in derivative_calc.txt. This function performs irreversible\nchanges so you will need to re-input the geometry afterwards.\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.isinline-Tuple{Any,Any,Any}",
    "page": "Library",
    "title": "Aswing.isinline",
    "category": "method",
    "text": "isinline(line, stringtofind, range)\n\nchecks for string within line, used in readasw\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.nodeset-Tuple{Integer,Integer}",
    "page": "Library",
    "title": "Aswing.nodeset",
    "category": "method",
    "text": "nodeset(ibeam::Integer, nnodes::Integer)\nnodeset(intervals::AbstractArray{<:AbstractArray{<:Integer, 1},1})\n\nSets new number of nodes for ibeam.  A custom number of panels can be used\nbetween break points.\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.parseblock-NTuple{4,Any}",
    "page": "Library",
    "title": "Aswing.parseblock",
    "category": "method",
    "text": "parseblock(f, line, nvalue, skip)\n\nparses common input blocks, used in readasw\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.pntsav",
    "page": "Library",
    "title": "Aswing.pntsav",
    "category": "function",
    "text": "pntsav(file, ipnt1=1, ipnt2=ASWING.NPOINT)\nSaves ASWING operating point state to a file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.readasw-Tuple{String}",
    "page": "Library",
    "title": "Aswing.readasw",
    "category": "method",
    "text": "readasw(filename::String)\n\nReads a .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.readpnt-Tuple{String}",
    "page": "Library",
    "title": "Aswing.readpnt",
    "category": "method",
    "text": "readpnt(filename::String)\n\nReads a .pnt file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.retainparam-Tuple{Integer,Integer}",
    "page": "Library",
    "title": "Aswing.retainparam",
    "category": "method",
    "text": "retainparam()\nretainparam(ipnt1::Integer)\nretainparam(ipnt1::Integer, ipnt2::Integer)\nSets operating point parameters equivalent to those of the current state\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.setcons",
    "page": "Library",
    "title": "Aswing.setcons",
    "category": "function",
    "text": "setcons(pnt::dotpnt,ipnt=1)\nInputs operating points contraints into ASWING\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.setgeom-Tuple{Aswing.Configuration}",
    "page": "Library",
    "title": "Aswing.setgeom",
    "category": "method",
    "text": "setgeom(asw::Configuration)\n\nInputs geometry into ASWING\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.setgust",
    "page": "Library",
    "title": "Aswing.setgust",
    "category": "function",
    "text": "setgust(igust::Integer, params::AbstractArray{<:Real}=[-4.0,0.0,1.0,8.0,2.0,0.0])\nSets gust type and corresponding parameters\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.setpars",
    "page": "Library",
    "title": "Aswing.setpars",
    "category": "function",
    "text": "setpars(parameters, ipnt::Integer=1)\nSets operating point parameters into ASWING\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.setpnt-Tuple{AbstractArray{Aswing.OperatingPoint,1}}",
    "page": "Library",
    "title": "Aswing.setpnt",
    "category": "method",
    "text": "setpnt(point)\nInputs operating point(s) into ASWING\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.setsav-Tuple{Any}",
    "page": "Library",
    "title": "Aswing.setsav",
    "category": "method",
    "text": "setsav(file)\nSaves ASWING operating point state to a file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.solvesteady-Tuple{Integer,Integer}",
    "page": "Library",
    "title": "Aswing.solvesteady",
    "category": "method",
    "text": "solvesteady(;repeat::Integer=0)\nsolvesteady(ipnt1::Integer; repeat::Integer=0)\nsolvesteady(ipnt1::Integer, ipnt2::Integer; repeat::Integer=0)\n\nQuasi-steady ASWING solve. If no arguments are specified, all points are\nsolved.\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.solveunsteady",
    "page": "Library",
    "title": "Aswing.solveunsteady",
    "category": "function",
    "text": "solveunsteady(deltat::Real, ntimes::Integer)\nUnsteady ASWING time-domain solve\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Beam",
    "page": "Library",
    "title": "Aswing.Beam",
    "category": "type",
    "text": "Beam(;number::Integer = 0, physical_index::Integer = 0, name::String = \"\",\n    spanwise_variables::SpanwiseVariables = SpanwiseVariables())\n\nReturns struct defining a beam as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Configuration",
    "page": "Library",
    "title": "Aswing.Configuration",
    "category": "type",
    "text": "Configuration\n\nReturns struct containing contents of .asw configuration file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Constants",
    "page": "Library",
    "title": "Aswing.Constants",
    "category": "type",
    "text": "Constants(;\n    sea_level_air_density::Real = 1.225,\n    sea_level_speed_of_sound::Real = 340.2778,\n    gravity::Real = 9.81)\n\nReturns struct containing constants as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Constraints",
    "page": "Library",
    "title": "Aswing.Constraints",
    "category": "type",
    "text": "Constraints(mode::String)\nConstraints(;\n    linear_acceleration::AbstractArray{<:Integer,1} =\n        -[dparam[\"accel_x\"],dparam[\"accel_y\"],dparam[\"accel_z\"]],\n    angular_acceleration::AbstractArray{<:Integer,1} =\n        -[dparam[\"ang_accel_x\"],dparam[\"ang_accel_y\"],dparam[\"ang_accel_z\"]],\n    velocity::AbstractArray{<:Integer,1} =\n        -[dparam[\"velocity\"],dparam[\"beta\"],dparam[\"alpha\"]],\n    rotation_rate::AbstractArray{<:Integer,1} =\n        -[dparam[\"ang_vel_x\"],dparam[\"ang_vel_y\"],dparam[\"ang_vel_z\"]],\n    position::AbstractArray{<:Integer,1} =\n        -[dparam[\"position_x\"],dparam[\"position_y\"],dparam[\"position_z\"]],\n    phi::Integer = -dparam[\"roll\"],\n    theta::Integer = -dparam[\"pitch\"],\n    psi::Integer = -dparam[\"yaw\"],\n    flap_defl_ctrl_var::AbstractArray{<:Integer,1} =\n        -(dparam[\"flap_1\"]:(dparam[\"flap_1\"]-1+NFLPX)),\n    eng_pwr_ctrl_var::AbstractArray{<:Integer,1} =\n        -(dparam[\"eng_1\"]:(dparam[\"eng_1\"]-1+NENGX))\n    err_int_Vinf::Integer = dparam[\"velocity\"],\n    err_int_beta::Integer = dparam[\"beta\"],\n    err_int_alpha::Integer = dparam[\"alpha\"],\n    err_int_phi::Integer = dparam[\"ang_vel_x\"],\n    err_int_theta::Integer = dparam[\"ang_vel_y\"],\n    err_int_psi::Integer = dparam[\"ang_vel_z\"],\n    err_int_ROTxyz::AbstractArray{<:Integer,1} = [0,0,0],\n    err_int_VACxyz::AbstractArray{<:Integer,1} = [0,0,0])\n\nDefines operating point constraints as done within ASWING.\nImplemented modes: [\"default\", \"anchored\", \"free\", \"static\"]\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Engine",
    "page": "Library",
    "title": "Aswing.Engine",
    "category": "type",
    "text": "Engine(;Keng::Integer=0, IEtyp::Integer=0, Nbeam::Integer=0,\n    t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(R,3),\n    thrust_direction::AbstractArray{<:Real,1}=zeros(R,3), dFdPe::Real=0.0,\n    dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0, cdA::Real=0.0,\n    cl::Real=0.0, CLa::Real=0.0, S0::Real=0.0, C0::Real=0.0, S1::Real=0.0,\n    C1::Real=0.0, S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0)\n\nReturns struct defining a single engine as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Ground",
    "page": "Library",
    "title": "Aswing.Ground",
    "category": "type",
    "text": "Ground(;Nbeam::Integer=0, t::Real=0.0, KGtype::Integer=0)\n\nReturns struct defining a single ground as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Jangle",
    "page": "Library",
    "title": "Aswing.Jangle",
    "category": "type",
    "text": "Jangle(;Njoint::Integer=0,\n    hinge_axis::AbstractArray{<:Real,1} = zeros(R, 3),\n    hinge_moment::AbstractArray{<:Real,1} = zeros(1),\n    hinge_angle::AbstractArray{<:Real,1} = zeros(1))\n\nReturns struct defining a single jangle as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Joint",
    "page": "Library",
    "title": "Aswing.Joint",
    "category": "type",
    "text": "Joint(;Nbeam1::Integer=0, Nbeam2::Integer=0, t1::Real=0.0,\n    t2::Real=0.0, KJtype::Integer=0)\n\nReturns struct defining a single joint as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.OperatingPoint",
    "page": "Library",
    "title": "Aswing.OperatingPoint",
    "category": "type",
    "text": "OperatingPoint(;\n    constraints::Constraints=Constraints(),\n    mach_from_airspeed::Bool = false,\n    machpg::Real = 0.0,\n    ground_image::Real = 0,\n    parameters::Parameters = Parameters(),\n    wflap::AbstractArray{<:Real,1} = ones(R,NFLPX),\n    wpeng::AbstractArray{<:Real,1} = ones(R,NENGX))\n\ncontains operating point inputs\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Parameters",
    "page": "Library",
    "title": "Aswing.Parameters",
    "category": "type",
    "text": "Parameters(;\n    linear_acceleration::AbstractArray{<:Real,1} = zeros(R,3),\n    angular_acceleration::AbstractArray{<:Real,1} = zeros(R,3),\n    velocity::Real = 0.0,\n    beta::Real = 0.0,\n    alpha::Real = 0.0,\n    rotation_rate::AbstractArray{<:Real,1} = zeros(R,3),\n    position::AbstractArray{<:Real,1} = zeros(R,3),\n    phi::Real = 0.0,\n    theta::Real = 0.0,\n    psi::Real = 0.0,\n    flap_defl_ctrl_var::AbstractArray{<:Real,1} = zeros(R,NFLPX),\n    eng_pwr_ctrl_var::AbstractArray{<:Real,1} = zeros(R,NENGX),\n    sum_force::AbstractArray{<:Real,1} = zeros(R,3),\n    sum_mom::AbstractArray{<:Real,1} = zeros(R,3),\n    lift::Real = 0.0,\n    climb_angle::Real = 0.0,\n    radial_acceleration::Real = 0.0,\n    usr1::Real = 0.0,\n    usr2::Real = 0.0,\n    least_squared::Real = 0.0)\n\nDefines operating point parameters as done within ASWING.\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.ReferenceValues",
    "page": "Library",
    "title": "Aswing.ReferenceValues",
    "category": "type",
    "text": "ReferenceValues(;area::Real = 1.0, chord::Real = 1.0, span::Real = 1.0,\n    momref::AbstractArray{<:Real,1} = zeros(R,3),\n    velref::AbstractArray{<:Real,1} = zeros(R,3),\n    accelref::AbstractArray{<:Real,1} = zeros(R,3))\n\nReturns struct containing reference values as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Sensor",
    "page": "Library",
    "title": "Aswing.Sensor",
    "category": "type",
    "text": "Sensor(;Ksens::Integer = 0, Nbeam::Integer = 0, t::Real=0.0,\n    location::AbstractArray{<:Real,1} = zeros(R,3),\n    V::AbstractArray{<:Real,1} = zeros(R,3),\n    A::AbstractArray{<:Real,1} = zeros(R,3))\n\nReturns struct defining a single sensor as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.SpanwiseVariables",
    "page": "Library",
    "title": "Aswing.SpanwiseVariables",
    "category": "type",
    "text": "SpanwiseVariables(; <keyword arguments>)\n\nReturns struct defining the spanwise properties of a beam as defined in\n    .asw file\nThe first column of each variable is the t-value\nThe second column is the variable value corresponding to that t-value\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Strut",
    "page": "Library",
    "title": "Aswing.Strut",
    "category": "type",
    "text": "Strut(;Nbeam::Integer=0, t::Real=0.0,\n    location::AbstractArray{<:Real,1}=zeros(R,3),\n    anchor_location::AbstractArray{<:Real,1}=zeros(R,3), dLo::Real=0.0,\n    EAw::Real=0.0)\n\nReturns struct defining a single strut as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Aswing.Weight",
    "page": "Library",
    "title": "Aswing.Weight",
    "category": "type",
    "text": "Weight(;Nbeam::Integer=0, t::Real=0.0,\n    location::AbstractArray{<:Real,1}=zeros(R,3), weight::Real=0.0,\n    CDA::Real=0.0, vol::Real=0.0, Ho::AbstractArray{<:Real,1}=zeros(R,3),\n    Ixx::Real=0, Iyy::Real=0, Izz::Real=0, Ixy::Real=0, Ixz::Real=0, Iyz::Real=0)\n\nReturns struct defining a single point mass as defined in .asw file\n\n\n\n\n\n"
},

{
    "location": "library.html#Internal-API-1",
    "page": "Library",
    "title": "Internal API",
    "category": "section",
    "text": "Modules = [Aswing]\nPublic = false\nOrder = [:function, :type]"
},

]}
