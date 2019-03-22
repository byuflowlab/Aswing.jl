import Aswing

# Read and input .asw file
inputasw = "hawk.asw"
asw = Aswing.readasw(inputasw)
Aswing.setgeom(asw)

# Read and input .pnt file
inputpnt = "hawk.pnt"
pnt = Aswing.readpnt(inputpnt)
Aswing.setpnt(pnt)

# Save .asw and .pnt files, can be used with original ASWING
outputasw = "out.asw"
Aswing.aswsav(outputasw)
outputpnt = "out.pnt"
Aswing.pntsav(outputpnt)

# ASWING files can also be read using the following functions
newasw = Aswing.readasw(outputasw)
newpnt = Aswing.readpnt(outputpnt)

# solves for first operating point
steady_solution = Aswing.solvesteady(1)

# gets stability derivatives of first operating point
stabderivs = Aswing.getstabilityderivatives(1)

# you can also get and/or set the paneling between break points
newintervals = [Aswing.getintervals(i) for i  in 1:4]*2
Aswing.nodeset(newintervals)
steady_solution = Aswing.solvesteady(1)

# quasi-steady and rigid static margins can be calculated, but the
# geometry and operating point conditions will need to be re-input afterwards
sm_qs, sm_rigid, fail = Aswing.getstaticmargin(1)

Aswing.setgeom(asw)
Aswing.setpnt(pnt)
steady_solution = Aswing.solvesteady(1)

# note that when you input the geometry again the paneling is reset to the defaults
intervals = [Aswing.getintervals(i) for i  in 1:4]

# you can also do unsteady solves
Aswing.retainparam()
Aswing.setcons(Aswing.Constraints("free"))
unsteady_solution = Aswing.solveunsteady(0.1, 10)

# and you can get eigenvalues
asweigs = Aswing.geteigs(16, -0.1+0.0im, 1)
