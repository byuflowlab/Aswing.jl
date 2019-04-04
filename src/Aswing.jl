module Aswing
using OffsetArrays

import Base.eltype

function __init__()
    global UNITS = UNITS_s()
    global ASWING = ASWING_s()
    global EIGEN = EIGEN_s()
    global THCALC = THCALC_s()
    global CONLAW = CONLAW_s()
    initialize()

    global GlobalUNITS = UNITS
    global GlobalASWING = ASWING
    global GlobalEIGEN = EIGEN
    global GlobalTHCALC = THCALC
    global GlobalCONLAW = CONLAW
end

const depsfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(depsfile)
    include(depsfile)
else
    error("Aswing not properly installed. Please run Pkg.build(\"Aswing\") then restart Julia.")
end

function initialize()
    ccall((:init_, libaswing), Nothing, ())
    ccall((:setdef_, libaswing), Nothing, ())
    ccall((:iidef_, libaswing), Nothing, ())
    ccall((:nndefp_, libaswing), Nothing, ())
    ccall((:vginit_, libaswing), Nothing, ())
    ccall((:dscheck_, libaswing), Nothing, ())
    THCALC.CUSTOMINTERVALS[1] = false
    THCALC.INTERVALS[0:NBRKX+1] .= 0
end

# Global variable wrappers and fortran pointer definitions
include("globals/dimen.jl")
include("globals/indexb.jl")
include("globals/indexc.jl")
include("globals/indexp.jl")
include("globals/units.jl")
include("globals/aswing.jl")
include("globals/eigen.jl")
include("globals/thcalc.jl")
include("globals/conlaw.jl")

# defines ASWING geometry input
include("geom.jl")

# defines ASWING operating point definitions
include("pnt.jl")

# defines Aswing solution output
include("sol.jl")

# implements Aswing file i/o
include("io.jl")

# implements main Aswing calling methods
include("main.jl")

# deprecated functions
include("deprecated.jl")

end #modules
