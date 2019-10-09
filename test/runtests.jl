import Aswing
using Test

mydir,_ = splitdir(@__FILE__)

# tolerance used for tests
atol = 1e-5

# Read and input .asw file
inputasw = joinpath(mydir,"hawk.asw")
asw = Aswing.readasw(inputasw)
Aswing.setgeom(asw)

# Construct .pnt file from scratch
constraints = Aswing.Constraints(
    linear_acceleration = [Aswing.IPFORX,Aswing.IPFORY,Aswing.IPFORZ],
    angular_acceleration = [Aswing.IPMOMX,Aswing.IPMOMY,Aswing.IPMOMZ],
    velocity = [Aswing.IPVIAS,Aswing.IPBETA,Aswing.IPVACZ],
    rotation_rate = [Aswing.IPROTX,Aswing.IPROTY,Aswing.IPROTZ],
    position = [Aswing.IPPOSX,Aswing.IPPOSY,Aswing.IPPOSZ],
    phi = Aswing.IPBANK,
    theta = Aswing.IPVACX,
    psi = Aswing.IPHEAD,
    flap_defl_ctrl_var = [Aswing.IPRACX, Aswing.IPRACY, Aswing.IPRACZ, Aswing.IPFLP4],
    eng_pwr_ctrl_var = [Aswing.IPENG1])

parameters = Aswing.Parameters(
    linear_acceleration = zeros(3),
    angular_acceleration = zeros(3),
    velocity = 60.0,
    beta = 0.0,
    alpha = 1.968,
    rotation_rate = zeros(3),
    position = zeros(3),
    phi = 0.0,
    theta = 0.29,
    psi = 0.0,
    flap_defl_ctrl_var = [0.0, -1.8050, 0.0, 0.0],
    eng_pwr_ctrl_var = [0.0],
    sum_force = zeros(3),
    sum_mom = zeros(3),
    lift = 332.158,
    climb_angle = -1.678,
    radial_acceleration = 0.0,
    usr1 = 0.0,
    usr2 = 0.0,
    least_squared = 0.0)

pnt = [Aswing.OperatingPoint(
    constraints = constraints,
    parameters = parameters,
    mach_from_airspeed = false,
    machpg = 0.0)]

Aswing.setpnt(pnt)

# Save .asw and .pnt files
outputasw = joinpath(mydir,"out.asw")
Aswing.aswsav(outputasw)

outputpnt = joinpath(mydir,"out.pnt")
Aswing.pntsav(outputpnt)

# test reading/writing .asw files
newasw = Aswing.readasw(outputasw)
@testset "asw" begin
    @test asw.namein == newasw.namein
    @test asw.si_units == newasw.si_units
    @test asw.constants == newasw.constants
    @testset "reference values" begin
        for field in fieldnames(Aswing.ReferenceValues)
            @test isapprox(getfield(asw.refvals, field), getfield(newasw.refvals, field))
        end
    end
    @testset "weights" begin
        for i = 1:length(asw.weights)
            for field in fieldnames(Aswing.Weight)
                @test isapprox(getfield(asw.weights[i], field), getfield(newasw.weights[i], field))
            end
        end
    end
    @testset "sensors" begin
        for i = 1:length(asw.sensors)
            for field in fieldnames(Aswing.Sensor)
                @test isapprox(getfield(asw.sensors[i], field), getfield(newasw.sensors[i], field))
            end
        end
    end
    @testset "engines" begin
        for i = 1:length(asw.engines)
            for field in fieldnames(Aswing.Engine)
                @test isapprox(getfield(asw.engines[i], field), getfield(newasw.engines[i], field))
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

# test reading/writing operating points
newpnt = Aswing.readpnt(outputpnt)
@testset "pnt" begin
    for i = 1:length(pnt)
        @testset "constraints" begin
            for field in fieldnames(Aswing.Constraints)
                pntvar = getfield(pnt[i].constraints, field)
                newpntvar = getfield(newpnt[i].constraints, field)
                if field == :flap_defl_ctrl_var
                    @test pntvar[1] == newpntvar[1]
                    @test pntvar[2] == newpntvar[2]
                    @test pntvar[3] == newpntvar[3]
                    @test pntvar[4] == newpntvar[4]
                elseif field == :eng_pwr_ctrl_var
                    @test pntvar[1] == newpntvar[1]
                else
                    @test pntvar == newpntvar
                end
            end
        end
        @testset "parameters" begin
            for field in fieldnames(Aswing.Parameters)
                pntvar = getfield(pnt[i].parameters, field)
                newpntvar = getfield(newpnt[i].parameters, field)
                if field == :flap_defl_ctrl_var
                    @test pntvar[1] == newpntvar[1]
                    @test pntvar[2] == newpntvar[2]
                    @test pntvar[3] == newpntvar[3]
                    @test pntvar[4] == newpntvar[4]
                elseif field == :eng_pwr_ctrl_var
                    @test pntvar[1] == newpntvar[1]
                else
                    @test isapprox(pntvar, newpntvar, atol=1e-2)
                end
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
@test isapprox(steady_solution.pnt_param.lift_force/steady_solution.pnt_param.drag_force, 33.6092341750539, atol=atol)

# get stability derivatives
stabderivs = Aswing.stabilityderivatives()
@testset "stabderivs" begin
    @test isapprox(stabderivs.CXu, -0.03652047310144528, atol=atol)
    @test isapprox(stabderivs.CYu, 0.0, atol=atol)
    @test isapprox(stabderivs.CLu, 1.216904723395558, atol=atol)
    @test isapprox(stabderivs.CXa, 0.514992210591996, atol=atol)
    @test isapprox(stabderivs.CYa, 0.0, atol=atol)
    @test isapprox(stabderivs.CLa, 6.2730761556092975, atol=atol)
    @test isapprox(stabderivs.CXb, 0.0, atol=atol)
    @test isapprox(stabderivs.CYb, -0.42126215334348716, atol=atol)
    @test isapprox(stabderivs.CLb, 0.0, atol=atol)
    @test isapprox(stabderivs.Clu, 0.0, atol=atol)
    @test isapprox(stabderivs.Cmu, 0.04767457583546996, atol=atol)
    @test isapprox(stabderivs.Cnu, 0.0, atol=atol)
    @test isapprox(stabderivs.Cla, 0.0, atol=atol)
    @test isapprox(stabderivs.Cma, -1.166473545760255, atol=atol)
    @test isapprox(stabderivs.Cna, 0.0, atol=atol)
    @test isapprox(stabderivs.Clb, -0.17672244009048493, atol=atol)
    @test isapprox(stabderivs.Cmb, 0.0, atol=atol)
    @test isapprox(stabderivs.Cnb, 0.033382702016544044, atol=atol)
    @test isapprox(stabderivs.CXp, 0.0, atol=atol)
    @test isapprox(stabderivs.CYp, -0.6745224799824928, atol=atol)
    @test isapprox(stabderivs.CLp, 0.0, atol=atol)
    @test isapprox(stabderivs.CXq, -0.45680201241386725, atol=atol)
    @test isapprox(stabderivs.CYq, 0.0, atol=atol)
    @test isapprox(stabderivs.CLq, 7.284291585430452, atol=atol)
    @test isapprox(stabderivs.CXr, 0.0, atol=atol)
    @test isapprox(stabderivs.CYr, 0.25951346743318265, atol=atol)
    @test isapprox(stabderivs.CLr, 0.0, atol=atol)
    @test isapprox(stabderivs.Clp, -0.7078626211816347, atol=atol)
    @test isapprox(stabderivs.Cmp, 0.0, atol=atol)
    @test isapprox(stabderivs.Cnp, -0.06251261778613514, atol=atol)
    @test isapprox(stabderivs.Clq, 0.0, atol=atol)
    @test isapprox(stabderivs.Cmq, -16.26577215749712, atol=atol)
    @test isapprox(stabderivs.Cnq, 0.0, atol=atol)
    @test isapprox(stabderivs.Clr, 0.1623276548641932, atol=atol)
    @test isapprox(stabderivs.Cmr, 0.0, atol=atol)
    @test isapprox(stabderivs.Cnr, -0.03741744012260867, atol=atol)
    @test isapprox(stabderivs.CXdF, [0.0, 5.16115826001186e-6, 0.0, -0.0010600668088926565], atol=atol)
    @test isapprox(stabderivs.CYdF, [0.0065501671250972815, 0.0, 0.0019375002936612249, 0.0], atol=atol)
    @test isapprox(stabderivs.CLdF, [0.0, 0.0037351659479835007, 0.0, 0.0490397612326285], atol=atol)
    @test isapprox(stabderivs.CXdP, [0.0018661778027707714], atol=atol)
    @test isapprox(stabderivs.CYdP, [-5.292539460008798e-9], atol=atol)
    @test isapprox(stabderivs.CLdP, [-0.00010449565952022606], atol=atol)
end

# test setting new paneling
newintervals = [Aswing.getintervals(i) for i  in 1:4]*2
Aswing.nodeset(newintervals)
@test all(newintervals .== [Aswing.getintervals(i) for i in 1:4])

# make sure solution remains similar
steady_solution = Aswing.solvesteady(1)
@test isapprox(steady_solution.pnt_param.lift_force/steady_solution.pnt_param.drag_force, 33.6573231422232, atol=atol)

# get static margin (note that this is using the increased paneling)
sm_qs, sm_rigid, fail = Aswing.getstaticmargin(1)
@test isapprox(sm_qs/100, 0.26230193526999124, atol=atol)
@test isapprox(sm_rigid/100, 0.31478364312678236, atol=atol)

# recover from static margin test (restores default paneling)
Aswing.setgeom(asw)
Aswing.setpnt(pnt)
steady_solution = Aswing.solvesteady(1)

# set up and test unsteady solution
Aswing.retainparam()
Aswing.setcons(Aswing.Constraints("free"))
unsteady_solution = Aswing.solveunsteady(0.1, 10)
@test isapprox(unsteady_solution[11].pnt_param.lift_force/unsteady_solution[11].pnt_param.drag_force, 33.6092341750539, atol=atol)

# test eigenvalues
asweigs = Aswing.geteigs(16, -0.1+0.0im, 1)
@test isapprox(asweigs,
[
-0.02665193416160748 + 0.0im               ,
-0.01689216581284332 + 0.4242720980364713im,
 -0.5286716816061375 + 1.521907733573002im ,
  -7.053040642626703 + 0.0im               ,
 -3.8200059691829984 + 6.2769874595045065im,
  -8.726782350618162 + 8.588264563476661im ,
 -11.749382348992544 + 7.338095974651897im,
 ], atol=atol)
