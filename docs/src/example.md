## Example Usage

I generally prefer to use `import` rather than `using` so that I know where various functions come from.

```julia
import Aswing
```

### Reading and Loading Configuration Files

There are various ways you can load configuration data.  The easiest option is to read from a .asw file.

```julia
asw = Aswing.readasw("hawk.asw")
```

The other option is to construct a `Configuration` composite type manually.  This is the more useful approach if you want to automate ASWING runs for varying configurations.

Inputing this data to ASWING once you have loaded it is straightforward.

```julia
Aswing.setgeom(asw)
```

### Reading and Loading Operating Point Files

You can also read operating point data from a file.

```julia
pnt = Aswing.readpnt("hawk.pnt")
```

Or you can construct an `OperatingPoint` composite type manually.

Then you can the load the operating point into ASWING using the following function.

```julia
Aswing.setpnt(pnt)
```

### Saving Configuration and Operating Point Files

At any point in time you may save configuration and operating point files for analysis with an unmodified version of ASWING.

```julia
Aswing.aswsav("out.asw")
Aswing.pntsav("out.pnt")
```

### Quasi-Steady Solutions

You can find quasi-steady solutions for any number of operating points using the following command.

```julia
steady_solution = Aswing.solvesteady(1)
```

### Stability Derivatives

You can also get stability derivatives for that operating point

```julia
stabderivs = Aswing.getstabilityderivatives(1)
```

### Static Margin

Quasi-steady and rigid static margins can be calculated, but the
geometry and operating point conditions will need to be re-input afterwards

```julia
sm_qs, sm_rigid, fail = Aswing.getstaticmargin(1)

Aswing.setgeom(asw)
Aswing.setpnt(pnt)
steady_solution = Aswing.solvesteady(1)
```

### Paneling

The paneling between break points may be obtained and/or modified

```julia
newintervals = [Aswing.getintervals(i) for i  in 1:4]*2
Aswing.nodeset(newintervals)
steady_solution = Aswing.solvesteady(1)
```

Note that when you input the geometry again the paneling is reset to the defaults

```julia
Aswing.setgeom(asw)
Aswing.setpnt(pnt)

intervals = [Aswing.getintervals(i) for i  in 1:4]
```

### Time Domain Solutions

You can also do unsteady solves.  We'll start ours from a steady state solution.

```julia
steady_solution = Aswing.solvesteady(1)
```

We'll also set all parameters to the values from this steady state solution and set the constraint set to "free"

```julia
Aswing.retainparam(1)
Aswing.setcons(Aswing.Constraints("free"))
```

Of course, this won't be a very exciting time domain simulation because steady state operating conditions will be maintained.

```julia
unsteady_solution = Aswing.solveunsteady(0.1, 10)
```

### Frequency Domain Analysis

You can also get eigenvalues.

```julia
asweigs = Aswing.geteigs(16, -0.1+0.0im, 1)
```

### Accessing Internal Aswing Variables

If you need to access internal ASWING variables you can access them via the global composite types ASWING, EIGEN, and UNITS which wrap the Fortran global variables contained in the respective files.
