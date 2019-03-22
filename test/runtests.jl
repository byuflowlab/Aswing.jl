import Aswing
using Test

# Read and input .asw file
inputasw = "hawk.asw"
asw = Aswing.readasw(inputasw)
Aswing.setgeom(asw)

# Read and input .pnt file
inputpnt = "hawk.pnt"
pnt = Aswing.readpnt(inputpnt)
Aswing.setpnt(pnt)

# Save .asw and .pnt files, saved files result in identical configuration
outputasw = "out.asw"
Aswing.aswsav(outputasw)
outputpnt = "out.pnt"
Aswing.pntsav(outputpnt)

# check if fields match after being passed through ASWING
newasw = Aswing.readasw(outputasw)
@testset "asw" begin
    @test asw.namein == newasw.namein
    @test asw.si_units == newasw.si_units
    @test asw.constants == newasw.constants
    @testset "reference values" begin
        for field in fieldnames(Aswing.ReferenceValues)
            @test getfield(asw.refvals, field) ==
                getfield(newasw.refvals, field)
        end
    end
    @testset "weights" begin
        for i = 1:length(asw.weights)
            for field in fieldnames(Aswing.Weight)
                @test getfield(asw.weights[i], field) ==
                    getfield(newasw.weights[i], field)
            end
        end
    end
    @testset "sensors" begin
        for i = 1:length(asw.sensors)
            for field in fieldnames(Aswing.Sensor)
                @test getfield(asw.sensors[i], field) ==
                    getfield(newasw.sensors[i], field)
            end
        end
    end
    @testset "engines" begin
        for i = 1:length(asw.engines)
            for field in fieldnames(Aswing.Engine)
                @test getfield(asw.engines[i], field) ==
                    getfield(newasw.engines[i], field)
            end
        end
    end
    @test asw.struts == newasw.struts
    @test asw.joints == newasw.joints
    @test asw.jangles == newasw.jangles
    @test asw.grounds == newasw.grounds
    @testset "beams" begin
        for i = 1:length(asw.beams)
            asw.beams[i].number == newasw.beams[i].number
            asw.beams[i].physical_index == newasw.beams[i].physical_index
            asw.beams[i].name == newasw.beams[i].name
            for field in fieldnames(Aswing.SpanwiseVariables)
                @test isapprox(getfield(asw.beams[i].spanwise_variables, field),
                    getfield(newasw.beams[i].spanwise_variables, field))
            end
        end
    end
end

newpnt = Aswing.readpnt(outputpnt)
@testset "pnt" begin
    for i = 1:length(pnt)
        @testset "constraints" begin
            for field in fieldnames(Aswing.Constraints)
                @test getfield(pnt[i].constraints, field) ==
                    getfield(newpnt[i].constraints, field)
            end
        end
        @testset "parameters" begin
            for field in fieldnames(Aswing.Parameters)
                @test getfield(pnt[i].parameters, field) ==
                    getfield(newpnt[i].parameters, field)
            end
        end
        @test pnt[i].mach_from_airspeed == newpnt[i].mach_from_airspeed
        @test pnt[i].machpg == newpnt[i].machpg
        @test pnt[i].ground_image == newpnt[i].ground_image
        @test pnt[i].wflap == newpnt[i].wflap
        @test pnt[i].wpeng == newpnt[i].wpeng
    end
end

# test steady solution
steady_solution = Aswing.solvesteady(1)
@test isapprox(steady_solution.pnt_param.lift_force/steady_solution.pnt_param.drag_force,
    33.65, atol=0.1)

# get stability derivatives
stabderivs = Aswing.getstabilityderivatives(1)
@testset "stabderivs" begin
    @test isapprox(stabderivs.CXu, -0.03647, atol=1e-4)
    @test isapprox(stabderivs.CYu, 0.0, atol=1e-4)
    @test isapprox(stabderivs.CLu, 1.21699, atol=1e-4)
    @test isapprox(stabderivs.CXa, 0.51654, atol=1e-4)
    @test isapprox(stabderivs.CYa, 0.0, atol=1e-4)
    @test isapprox(stabderivs.CLa, 6.26062, atol=1e-4)
    @test isapprox(stabderivs.CXb, 0.0, atol=1e-4)
    @test isapprox(stabderivs.CYb, -0.42333, atol=1e-4)
    @test isapprox(stabderivs.CLb, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Clu, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Cmu, 0.04751, atol=1e-4)
    @test isapprox(stabderivs.Cnu, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Cla, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Cma, -1.17130, atol=1e-4)
    @test isapprox(stabderivs.Cna, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Clb, -0.17711, atol=1e-4)
    @test isapprox(stabderivs.Cmb, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Cnb, 0.03391, atol=1e-4)
    @test isapprox(stabderivs.CXp, 0.0, atol=1e-4)
    @test isapprox(stabderivs.CYp, -0.68140, atol=1e-4)
    @test isapprox(stabderivs.CLp, 0.0, atol=1e-4)
    @test isapprox(stabderivs.CXq, -0.45578, atol=1e-4)
    @test isapprox(stabderivs.CYq, 0.0, atol=1e-4)
    @test isapprox(stabderivs.CLq, 7.27280, atol=1e-4)
    @test isapprox(stabderivs.CXr, 0.0, atol=1e-4)
    @test isapprox(stabderivs.CYr, 0.26086, atol=1e-4)
    @test isapprox(stabderivs.CLr, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Clp, -0.70804, atol=1e-4)
    @test isapprox(stabderivs.Cmp, 0.00002, atol=1e-4)
    @test isapprox(stabderivs.Cnp, -0.06134, atol=1e-4)
    @test isapprox(stabderivs.Clq, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Cmq, -16.27071, atol=1e-4)
    @test isapprox(stabderivs.Cnq, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Clr, 0.16269, atol=1e-4)
    @test isapprox(stabderivs.Cmr, 0.0, atol=1e-4)
    @test isapprox(stabderivs.Cnr, -0.03759, atol=1e-4)
    @test isapprox(stabderivs.CXdF, [0.0, 0.0, 0.0, -0.00105], atol=1e-4)
    @test isapprox(stabderivs.CYdF, [0.00670, 0.0, 0.00193, 0.0], atol=1e-4)
    @test isapprox(stabderivs.CLdF, [0.0, 0.00373, 0.0, 0.04894], atol=1e-4)
    @test isapprox(stabderivs.CXdP, [0.001866], atol=1e-4)
    @test isapprox(stabderivs.CYdP, [0.0], atol=1e-4)
    @test isapprox(stabderivs.CLdP, [-0.000104], atol=1e-4)
end

# test setting new paneling
newintervals = [Aswing.getintervals(i) for i  in 1:4]*2
Aswing.nodeset(newintervals)
@test all(newintervals .== [Aswing.getintervals(i) for i in 1:4])

# make sure solution remains similar
steady_solution = Aswing.solvesteady(1)
@test isapprox(steady_solution.pnt_param.lift_force/steady_solution.pnt_param.drag_force,
    33.65, atol=0.1)

# get static margin (note that this is using the increased paneling)
sm_qs, sm_rigid, fail = Aswing.getstaticmargin(1)
@test isapprox(sm_qs, 26.2352, atol=1e-1)
@test isapprox(sm_rigid, 31.48, atol=1e-1)

# recover from static margin test (and restore normal paneling)
Aswing.setgeom(asw)
Aswing.setpnt(pnt)
steady_solution = Aswing.solvesteady(1)

# set up and test unsteady solution
Aswing.retainparam()
Aswing.setcons(Aswing.Constraints("free"))
unsteady_solution = Aswing.solveunsteady(0.1, 10)
@test isapprox(unsteady_solution[11].pnt_param.lift_force/unsteady_solution[11].pnt_param.drag_force,
    33.65, atol=0.1)

# test eigenvalues
asweigs = Aswing.geteigs(16, -0.1+0.0im, 1)
@test length(asweigs) == 7
@test isapprox(asweigs[1],  -0.0259 + 0.0000im, atol = 1e-3)
@test isapprox(asweigs[2],  -0.0169 + 0.4249im, atol = 1e-3)
@test isapprox(asweigs[3],  -0.5283 + 1.5259im, atol = 1e-3)
@test isapprox(asweigs[4],  -7.0504 + 0.0000im, atol = 1e-3)
@test isapprox(asweigs[5],  -3.8156 + 6.2790im, atol = 1e-3)
@test isapprox(asweigs[6],  -8.7304 + 8.5861im, atol = 1e-3)
@test isapprox(asweigs[7], -11.7465 + 7.3447im, atol = 1e-3)
