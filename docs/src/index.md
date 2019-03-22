# Aswing

**Author**: Taylor McDonnell

## Summary
Julia wrapper for the ASWING (A licensed copy of ASWING must be obtained separately).

## Features

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

## Installation

See the relevant documentation page.

## Testing

In order to test that the package works, the hawk.asw and hawk.pnt example configuration files (found in the `runs` folder of the original Aswing package folder) must be copied to the test directory.

## Usage

See the example use case. Most functions are also documented in the source code. Access to FORTRAN global variables can be obtained through the ASWING global composite type. Use of this package is easiest if the user has experience using ASWING as a standalone package and understands the necessary workflow in ASWING to analyze flexible aircraft.

## Disclaimer

This wrapper was developed for ASWING v6.00.  Only OSX and Linux build processes are implemented.  There are no guarantees that this code will work with other versions and/or setups, in reality there are no guarantees that any of it will work at all, but I have used this wrapper in my research successfully without issues and have tested it against the unmodified ASWING program.
