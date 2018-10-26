import Aswing
using Base.Test

# Read and input .asw file (can also be constructed manually)
inputasw = "hawk.asw"
asw = Aswing.readasw(inputasw)
Aswing.setgeom(asw)

# Read and input .pnt file (can also be constructed manually)
inputpnt = "hawk.pnt"
pnt = Aswing.readpnt(inputpnt)
Aswing.setpnt(pnt)

# Save .asw and .pnt files, saved files can be used with standalone ASWING
outputasw = "out.asw"
Aswing.aswsav(outputasw)
outputpnt = "out.pnt"
Aswing.pntsav(outputpnt)

# quasi-steady solve
steady_solution = Aswing.solvesteady(1)

# get stability derivatives
stabderivs = Aswing.getstabderivs()

# get static margin
sm, fail = Aswing.getstaticmargin(1)

# get unsteady solution
Aswing.retainparam()
constraints_unsteady = Aswing.aswconstraints("free")
Aswing.setcons(constraints_unsteady)
unsteady_solution = Aswing.solveunsteady(0.1, 10)

# get eigenvalues
asweigs = Aswing.geteigs(16, -0.1+0.0im, 1)

# get paneling between break points
intervals = [Aswing.getintervals(i) for i  in 1:4]

# set new paneling between break points and solve again
Aswing.nodeset(newintervals*2)
steady_solution = Aswing.solvesteady(1)
