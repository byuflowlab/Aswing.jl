module Aswing
using OffsetArrays

__precompile__(false)

function __init__()
    global UNITS = UNITS_s()
    global ASWING = ASWING_s()
    global EIGEN = EIGEN_s()
    global THCALC = THCALC_s()
    global CONLAW = CONLAW_s()
    initialize()
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
include("dimenglobals.jl")
include("indexbglobals.jl")
include("indexcglobals.jl")
include("indexpglobals.jl")
include("unitsglobals.jl")
include("aswingglobals.jl")
include("eigenglobals.jl")
include("thcalcglobals.jl")
include("conlawglobals.jl")

# defines ASWING geometry input
include("geom.jl")

# defines ASWING operating point definitions
include("oppnt.jl")

# defines Aswing solution output
include("sol.jl")

# implements Aswing file i/o
include("io.jl")

# implements main Aswing calling methods
include("main.jl")

end #modules
