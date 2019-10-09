# contains main ASWING calling routines

"""
    setgeom(asw::Configuration)

    Inputs geometry into ASWING
"""
function setgeom(asw::Configuration)

    # clear variable array sizes
    ASWING.NB[:, :] .= 0
    ASWING.NANGJ[:] .= 0
    npylo = 0 #pylon counter

    # NAME
    for i = 1:length(asw.namein)
        ASWING.NAME[i] = asw.namein[i]
    end

    # UNITS
    if asw.si_units
        UNITS.UNITL[1] = 1.0
        UNITS.UNCHL[:] = Vector{Char}(rpad("m",32))
        UNITS.UNITT[1] = 1.0
        UNITS.UNCHT[:] = Vector{Char}(rpad("s",32))
        UNITS.UNITM[1] = 1.0
        UNITS.UNCHM[:] = Vector{Char}(rpad("kg",32))
        UNITS.UNITF[1] = 0.0
        UNITS.UNCHF[:] = Vector{Char}(rpad(" ",32))
    else
        UNITS.UNITL[1] = 1.0
        UNITS.UNCHL[:] = Vector{Char}(rpad("ft",32))
        UNITS.UNITT[1] = 1.0
        UNITS.UNCHT[:] = Vector{Char}(rpad("s ",32))
        UNITS.UNITM[1] = 0.0
        UNITS.UNCHM[:] = Vector{Char}(rpad("  ",32))
        UNITS.UNITF[1] = 1.0
        UNITS.UNCHF[:] = Vector{Char}(rpad("lb",32))
    end

    # CONSTANTS BLOCK
    ASWING.GEEW[1] = asw.constants.gravity
    ASWING.RHOSL[1] = asw.constants.sea_level_air_density
    ASWING.VSOSL[1] = asw.constants.sea_level_speed_of_sound

    # REFERENCE BLOCK
    ASWING.SREF[1] = asw.refvals.area
    ASWING.CREF[1] = asw.refvals.chord
    ASWING.BREF[1] = asw.refvals.span
    ASWING.XYZREF[:,1] = asw.refvals.moments
    ASWING.XYZREF[:,2] = asw.refvals.accelerations
    ASWING.XYZREF[:,3] = asw.refvals.velocities

    # SENSOR BLOCK
    nsen = length(asw.sensors)
    for i = 1:nsen
        ASWING.KPTYPE[npylo+i] = 100 + asw.sensors[i].Ksens
        ASWING.KBPYLO[npylo+i] = asw.sensors[i].Nbeam
        ASWING.QPYLO[0,npylo+i] = asw.sensors[i].t
        ASWING.QPYLO[1:3,npylo+i] = asw.sensors[i].location
        ASWING.QPYLO[4:6,npylo+i] = asw.sensors[i].V
        ASWING.QPYLO[7:9,npylo+i] = asw.sensors[i].A
    end
    npylo += nsen

    # ENGINE BLOCK
    neng = length(asw.engines)
    for i = 1:neng
        keng = asw.engines[i].Keng
        ietyp = asw.engines[i].IEtyp
        ASWING.KBPYLO[npylo+i] = asw.engines[i].Nbeam
        ASWING.QPYLO[0,npylo+i] = asw.engines[i].t
        ASWING.QPYLO[1:3,npylo+i] = asw.engines[i].location
        ASWING.QPYLO[4:6,npylo+i] = asw.engines[i].thrust_direction
        ASWING.QPYLO[7,npylo+i] = asw.engines[i].dFdPe
        ASWING.QPYLO[8,npylo+i] = asw.engines[i].dMdPe
        ASWING.QPYLO[9,npylo+i] = asw.engines[i].Rdisk
        ASWING.QPYLO[10,npylo+i] = asw.engines[i].Omega
        ASWING.QPYLO[11,npylo+i] = asw.engines[i].cdA
        ASWING.QPYLO[12,npylo+i] = asw.engines[i].cl
        ASWING.QPYLO[13,npylo+i] = asw.engines[i].CLa
        ASWING.QPYLO[14,npylo+i] = asw.engines[i].S0
        ASWING.QPYLO[15,npylo+i] = asw.engines[i].C0
        ASWING.QPYLO[16,npylo+i] = asw.engines[i].S1
        ASWING.QPYLO[17,npylo+i] = asw.engines[i].C1
        ASWING.QPYLO[18,npylo+i] = asw.engines[i].S2
        ASWING.QPYLO[19,npylo+i] = asw.engines[i].C2
        ASWING.QPYLO[20,npylo+i] = asw.engines[i].S3
        ASWING.QPYLO[21,npylo+i] = asw.engines[i].C3

        ASWING.KPTYPE[npylo+i] = 10 + keng
        ke = max(1, min(NENGX, keng))
        ASWING.IENGTYP[ke] = ietyp
    end
    npylo += neng

    # WEIGHT BLOCK
    nwei = length(asw.weights)
    for i = 1:nwei
        ASWING.KPTYPE[npylo+i] = 1
        ASWING.KBPYLO[npylo+i] = asw.weights[i].Nbeam
        ASWING.QPYLO[0,npylo+i] = asw.weights[i].t
        ASWING.QPYLO[1:3,npylo+i] = asw.weights[i].location
        ASWING.QPYLO[4,npylo+i] = asw.weights[i].weight
        ASWING.QPYLO[5,npylo+i] = asw.weights[i].CDA
        ASWING.QPYLO[6,npylo+i] = asw.weights[i].vol
        ASWING.QPYLO[7:9,npylo+i] = asw.weights[i].Ho
        ASWING.QPYLO[10,npylo+i] = asw.weights[i].Ixx
        ASWING.QPYLO[11,npylo+i] = asw.weights[i].Iyy
        ASWING.QPYLO[12,npylo+i] = asw.weights[i].Izz
        ASWING.QPYLO[13,npylo+i] = asw.weights[i].Ixy
        ASWING.QPYLO[14,npylo+i] = asw.weights[i].Ixz
        ASWING.QPYLO[15,npylo+i] = asw.weights[i].Iyz
    end
    npylo += nwei

    # STRUT BLOCK
    nstr = length(asw.struts)
    for i = 1:nstr
        ASWING.KPTYPE[npylo+i] = 2
        ASWING.KBPYLO[npylo+i] = asw.struts[i].Nbeam
        ASWING.QPYLO[0,npylo+i] = asw.struts[i].t
        ASWING.QPYLO[1:3,npylo+i] = asw.struts[i].location
        ASWING.QPYLO[4:6,npylo+i] = asw.struts[i].anchor_location
        ASWING.QPYLO[7,npylo+i] = asw.struts[i].dLo
        ASWING.QPYLO[8,npylo+i] = asw.struts[i].EAw
    end
    npylo += nstr
    ASWING.NPYLO[1] = npylo

    # JOINT BLOCK
    njoin = length(asw.joints)
    ASWING.NJOIN[1] = njoin
    for i = 1:njoin
        ASWING.KBJOIN[1,i] = asw.joints[i].Nbeam1
        ASWING.KBJOIN[2,i] = asw.joints[i].Nbeam2
        ASWING.TJOIN[1,i] = asw.joints[i].t1
        ASWING.TJOIN[2,i] = asw.joints[i].t2
        ASWING.KJTYPE[i] = asw.joints[i].KJtype
    end

    # JANGLE BLOCK
    for i = 1:length(asw.jangles)
        kj = asw.jangles[i].Njoint
        nangj = length(asw.jangles[i].hinge_moment)
        ASWING.NANGJ[kj] = nangj
        ASWING.HJAX[1:3,kj] = asw.jangles[i].hinge_axis
        ASWING.MOMJ[1:nangj,kj] = asw.jangles[i].hinge_moment
        ASWING.ANGJ[1:nangj,kj] = asw.jangles[i].hinge_angle
    end

    # GROUNDS BLOCK
    ngrou = length(asw.grounds)
    ASWING.NGROU[1] = ngrou
    for i = 1:ngrou
        ASWING.KBGROU[i] = asw.grounds[i].Nbeam
        ASWING.TGROU[i] = asw.grounds[i].t
        ASWING.KGTYPE[i] = asw.grounds[i].KGtype
    end

    # BEAM DEFINITION BLOCKS
    nbeam = length(asw.beams)
    ASWING.NBEAM[1] = nbeam
    for ibeam = 1:nbeam
        ASWING.BNAME[ibeam][1:length(asw.beams[ibeam].name)] = Vector{Char}(asw.beams[ibeam].name)
        ASWING.KBNUM[ibeam] = asw.beams[ibeam].number
        ASWING.IBEAM[ibeam] = asw.beams[ibeam].physical_index
        for var in keys(beamvarval)
            j = beamvarval[var]
            varval = getfield(asw.beams[ibeam].spanwise_variables,Symbol(var))
            nb = size(varval,1)
            ASWING.NB[j, ibeam] = nb
            ASWING.TB[1:nb, j, ibeam] = varval[:,1]
            ASWING.QB[1:nb, j, ibeam] = varval[:,2]
        end
    end

    ccall((:input_, libaswing), Nothing, (Ref{Cchar},), ' ')
    ccall((:qmset_, libaswing), Nothing, ())
    ccall((:dscheck_, libaswing), Nothing, ())
    return nothing
end

"""
    setpnt(point)
    Inputs operating point(s) into ASWING
"""
function setpnt(point::AbstractArray{<:OperatingPoint,1})

    # set number of operating points
    npoint = length(point)
    ASWING.NPOINT[1] = npoint
    for ipnt = 1:npoint
        # set constraints
        setcons(point[ipnt].constraints, ipnt)
        # set parameter values
        setpars(point[ipnt].parameters, ipnt)
        # set other options and weights
        ASWING.LMACH[ipnt] = point[ipnt].mach_from_airspeed
        ASWING.IGRIM[ipnt] = point[ipnt].ground_image
        ASWING.WFLAP[:,ipnt] = point[ipnt].wflap
        ASWING.WPENG[:,ipnt] = point[ipnt].wpeng
        # solution is unconverged
        ASWING.LCONV[ipnt] = false
    end

    # set Mach number for Prandtl-Glauert correction
    for ipnt = 1:npoint
        for ip = 1:KPFREE
            ccall((:psp2par_, libaswing), Nothing, (Ref{Int32}, Ref{Int32}), ip, ipnt)
        end
        ASWING.PARAM[KPMACH, ipnt] =  point[ipnt].machpg
    end

    return nothing
end

"""
    setcons(pnt::dotpnt,ipnt=1)
    Inputs operating points contraints into ASWING
"""
function setcons(constraints, ipnt::Integer=1)
    ASWING.IPPAR[KPVACX:KPVACZ,ipnt] = constraints.linear_acceleration
    ASWING.IPPAR[KPRACX:KPRACZ,ipnt] = constraints.angular_acceleration
    ASWING.IPPAR[KPVELX:KPVELZ,ipnt] = constraints.velocity
    ASWING.IPPAR[KPROTX:KPROTZ,ipnt] = constraints.rotation_rate
    ASWING.IPPAR[KPPOSX:KPPOSZ,ipnt] = constraints.position
    ASWING.IPPAR[KPBANK,ipnt] = constraints.phi
    ASWING.IPPAR[KPELEV,ipnt] = constraints.theta
    ASWING.IPPAR[KPHEAD,ipnt] = constraints.psi
    ASWING.IPPAR[KPFLP1:KPFLP1+length(constraints.flap_defl_ctrl_var)-1,ipnt] = constraints.flap_defl_ctrl_var
    for ip = KPFLP1+length(constraints.flap_defl_ctrl_var):KPFLP1+NFLPX
        ASWING.IPPAR[ip,ipnt] = ip
    end
    ASWING.IPPAR[KPENG1:KPENG1+length(constraints.eng_pwr_ctrl_var)-1,ipnt] = constraints.eng_pwr_ctrl_var
    for ip = KPENG1+length(constraints.eng_pwr_ctrl_var):KPENG1+NENGX
        ASWING.IPPAR[ip,ipnt] = ip
    end
    for kf=1 : NFLPX
        kpflp1 = KPFLP1[1]
        ipflp1 = IPFLP1[1]
        if ASWING.LSFLAP[kf] == 1
            if ASWING.IPPAR[kpflp1-1+kf,ipnt] == 0
                ASWING.IPPAR[kpflp1-1+kf,ipnt] = ipflp1-1+kf
            end
        else
            ASWING.IPPAR[kpflp1-1+kf,ipnt] = 0
        end
    end
    for ke=1 : NENGX
        kpeng1 = KPENG1[1]
        ipeng1 = IPENG1[1]
        if ASWING.LSPENG[ke] == 1
            if ASWING.IPPAR[kpeng1-1+ke, ipnt] == 0
                ASWING.IPPAR[kpeng1-1+ke, ipnt] = ipeng1-1 + ke
            end
        else
            ASWING.IPPAR[kpeng1[1]-1+ke,ipnt] = 0
        end
    end
    ASWING.IPPAR[KPVIDT,ipnt] = constraints.err_int_Vinf
    ASWING.IPPAR[KPBEDT,ipnt] = constraints.err_int_beta
    ASWING.IPPAR[KPALDT,ipnt] = constraints.err_int_alpha
    ASWING.IPPAR[KPBADT,ipnt] = constraints.err_int_phi
    ASWING.IPPAR[KPELDT,ipnt] = constraints.err_int_theta
    ASWING.IPPAR[KPHEDT,ipnt] = constraints.err_int_psi
    ASWING.IPPAR[KPWDTX:KPWDTZ,ipnt] = constraints.err_int_ROTxyz
    ASWING.IPPAR[KPADTX:KPADTZ,ipnt] = constraints.err_int_VACxyz
    ASWING.LCONV[ipnt] = false
    return nothing
end

"""
    setpars(parameters, ipnt::Integer=1)
    Sets operating point parameters into ASWING
"""
function setpars(parameters, ipnt::Integer=1)

    ASWING.PSPEC[IPVACX:IPVACZ,ipnt] = parameters.linear_acceleration
    ASWING.PSPEC[IPRACX:IPRACZ,ipnt] = parameters.angular_acceleration
    ASWING.PSPEC[IPVIAS,ipnt] = parameters.velocity
    ASWING.PSPEC[IPBETA,ipnt] = parameters.beta
    ASWING.PSPEC[IPALFA,ipnt] = parameters.alpha
    ASWING.PSPEC[IPROTX:IPROTZ,ipnt] = parameters.rotation_rate
    ASWING.PSPEC[IPPOSX:IPPOSZ,ipnt] = parameters.position
    ASWING.PSPEC[IPBANK,ipnt] = parameters.phi
    ASWING.PSPEC[IPELEV,ipnt] = parameters.theta
    ASWING.PSPEC[IPHEAD,ipnt] = parameters.psi
    ASWING.PSPEC[IPFLP1:IPFLP1+length(parameters.flap_defl_ctrl_var)-1,ipnt] = parameters.flap_defl_ctrl_var
    for ip = IPFLP1+length(parameters.flap_defl_ctrl_var):IPFLP1+NFLPX
      ASWING.PSPEC[ip,ipnt] = 0.0
    end
    ASWING.PSPEC[IPENG1:IPENG1+length(parameters.eng_pwr_ctrl_var)-1,ipnt] = parameters.eng_pwr_ctrl_var
    for ip = IPENG1+length(parameters.eng_pwr_ctrl_var):IPENG1+NENGX
      ASWING.PSPEC[ip,ipnt] = 0.0
    end
    ASWING.PSPEC[IPFORX:IPFORZ,ipnt] = parameters.sum_force
    ASWING.PSPEC[IPMOMX:IPMOMZ,ipnt] = parameters.sum_mom
    ASWING.PSPEC[IPLIFT,ipnt] = parameters.lift
    ASWING.PSPEC[IPGAMM,ipnt] = parameters.climb_angle
    ASWING.PSPEC[IPRACC,ipnt] = parameters.radial_acceleration
    ASWING.PSPEC[IPUSR1,ipnt] = parameters.usr1
    ASWING.PSPEC[IPUSR2,ipnt] = parameters.usr2
    ASWING.PSPEC[IPLSQD,ipnt] = parameters.least_squared

    return nothing
end

"""
    solvesteady(;repeat::Integer=0)
    solvesteady(ipnt1::Integer; repeat::Integer=0)
    solvesteady(ipnt1::Integer, ipnt2::Integer; repeat::Integer=0)

    Quasi-steady ASWING solve. If no arguments are specified, all points are
    solved.
"""
function solvesteady(ipnt1::Integer, ipnt2::Integer; repeat::Integer=0)

    ASWING.STEADY[1] = true
    for ipnt in ipnt1:ipnt2
        # set operating point
        ASWING.ARGP1[1:4] .= Vector{Char}(rpad("$ipnt",4)) # hack to avoid string passing
        ccall((:operjl_, libaswing), Nothing, (Ref{Float64}, Ref{Int32}), 0.0, 0)
        for i = 1:repeat+1
            # converge operating point
            ASWING.ARGP1[1:4] .= Vector{Char}(rpad("X",4)) # hack to avoid string passing
            ccall((:operjl_, libaswing), Nothing, (Ref{Float64}, Ref{Int32}), 0.0, 0)
            if Bool(ASWING.LCONV[ipnt])
                break
            end
        end
    end

    # return formatted solution
    return getsolution(ipnt1,ipnt2)
end
solvesteady(; repeat::Integer=0) = solvesteady(1, ASWING.NPOINT[1], repeat=repeat)
solvesteady(ipnt1::Integer; repeat::Integer=0) = solvesteady(ipnt1, ipnt1, repeat=repeat)[ipnt1]

"""
    solveunsteady(deltat::Real, ntimes::Integer)
    Unsteady ASWING time-domain solve
"""
function solveunsteady(deltat::Real, ntimes::Integer, ipnt::Integer=1)

    # set operating point
    ASWING.ARGP1[1:4] .= Vector{Char}(rpad("$ipnt",4)) # hack to avoid string passing
    ccall((:operjl_, libaswing), Nothing, (Ref{Float64}, Ref{Int32}), 0.0, 0)

    # change to unsteady
    ASWING.STEADY[1] = false

    # solve unsteady
    ASWING.ARGP1[1:4] .= Vector{Char}(rpad("X",4)) # hack to avoid string passing
    ccall((:operjl_, libaswing), Nothing, (Ref{Float64}, Ref{Int32}), deltat, ntimes)

    # return formatted solution
    return getsolution(1, ntimes+1)
end

"""
    retainparam()
    retainparam(ipnt1::Integer)
    retainparam(ipnt1::Integer, ipnt2::Integer)
    Sets operating point parameters equivalent to those of the current state
"""
function retainparam(ipnt1::Integer, ipnt2::Integer=ipnt1)

    for ipnt in ipnt1:ipnt2
        # set operating point
        ASWING.ARGP1[1:4] .= Vector{Char}(rpad("$ipnt",4)) #hack to avoid string passing
        ccall((:operjl_, libaswing), Nothing, (Ref{Float64}, Ref{Int32}), 0.0, 0)
        # set parameters on operating point
        ASWING.ARGP1[1:4] .= Vector{Char}(rpad("R",4)) #hack to avoid string passing
        ccall((:operjl_, libaswing), Nothing, (Ref{Float64}, Ref{Int32}), 0.0, 0)
    end

    return nothing
end
retainparam() = retainparam(1, ASWING.NPOINT[1])

"""
    freeze(ipoint = 1)
    Freezes geometry at current state
"""
function freeze(ipoint = 1)

  ccall((:freeze_,libaswing), Nothing, (Ref{Int32},), ipoint)

  for i = 1 : ASWING.NPOINT[1]
    ASWING.LCONV[i] = false
  end

end

"""
    setgust(igust::Integer, params::AbstractArray{<:Real}=[-4.0,0.0,1.0,8.0,2.0,0.0])
    Sets gust type and corresponding parameters
"""
function setgust(igust::Integer, params::AbstractArray{<:Real}=[-4.0,0.0,1.0,8.0,2.0,0.0])

    gustparam = [-4.0,0.0,1.0,8.0,2.0,0.0]
    if length(params) > 6
        error("No more than six gust parameters may be specified")
    end
    gustparam[1:length(params)] = params
    ASWING.IGUST[1] = igust
    ASWING.VGCON[1:6] = gustparam

    return nothing
end

"""
    geteigs(neigen, zshift, ipnt; evmin = 1e-4, evtol = 1e-3)
    Returns eigenvalues of the system
"""
function geteigs(neig, zshift, ipnt; evmin = 1e-4, evtol = 1e-3)

    ASWING.STEADY[1] = false
    ASWING.LFGUST[1] = true

    # number of new modes to compute
    ASWING.NBEIGEN[1] = neig

    # clear current eigenmode counter, and start from new
    EIGEN.NEIGEN[1] = 0
    EIGEN.NROM[1] = 0

    # fix shift if too close to origin
    if abs(zshift) < 0.01
        zshift = -0.01 + 0.0im
    end

    # use shift as new default seed
    EIGEN.ZESEED[1] = zshift

    # compute only eigenvalues for specified operating points
    lrvec = true
    lgerr = false
    ccall((:evexec_, libaswing), Nothing, (Ref{Int32}, Ref{ComplexF64}, Ref{Int32},
        Ref{Int32}, Ref{Int32}, Ref{Float64}, Ref{Float64}, Ref{Int32}),
        ipnt, zshift, ASWING.NBEIGEN[1], lrvec, lgerr, evmin, evtol, 0)

    ccall((:wbcalc_, libaswing), Nothing, (Ref{Int32},), ipnt)

    zlamda = copy(EIGEN.ZLAMDA[1:EIGEN.NEIGEN[1]])

    return zlamda
end

"""
    stabilityderivatives(ipnt = 1, momref=Float64[])
    Calculates stability derivatives
"""
function stabilityderivatives(ipnt::Integer = 1; momref::AbstractArray{<:Real,1}=Float64[])

    if !isempty(momref)
        # assign new moment reference point
        ASWING.XYZREF[:,1] = momref
    end

    # get stability derivatives
    f_vba = zeros(Float64, 3, 3)
    m_vba = zeros(Float64, 3, 3)
    f_rot = zeros(Float64, 3, 3)
    m_rot = zeros(Float64, 3, 3)
    f_flap = zeros(Float64, 3, NFLPX)
    m_flap = zeros(Float64, 3, NFLPX)
    f_peng = zeros(Float64, 3, NENGX)
    m_peng = zeros(Float64, 3, NENGX)
    ccall((:dumpdm_, libaswing), Nothing,
    (Ref{Int32}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
    Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Int32}),
    6, f_vba, m_vba, f_rot, m_rot,
    f_flap, m_flap, f_peng, m_peng, ipnt)

    # limit output to defined flaps
    idx = findall(x->x!=0, ASWING.LSFLAP)
    f_flap = f_flap[:,idx]
    m_flap = m_flap[:,idx]
    # limit output to defined engines
    idx = findall(x->x!=0, ASWING.LSPENG)
    f_peng = f_peng[:,idx]
    m_peng = m_peng[:,idx]

  return StabilityDerivatives(f_vba, m_vba, f_rot, m_rot, f_flap, m_flap, f_peng, m_peng)
end

"""
    conclr()
    Clears all control laws
"""
function conclr()
    ASWING.CONLAW[1] = false
    ASWING.CONSET[1] = false
    ASWING.LDCON[:] .= false
    ASWING.LUCON[:] .= false
    ASWING.LQCON[:] .= false
    CONLAW.CU[:,:,:,:] .= 0.0
    CONLAW.CQ[:,:,:,:,:] .= 0.0
    CONLAW.DFREQ[:] .= 0.0
    CONLAW.DELTA[:] .= 0.0
    return nothing
end

"""
    conadd(i,j,ls,gfac,c)
    Sets up a proportional control law
"""
function conadd(i::Integer, j::Integer, ls::Integer, gfac::Real, c::Real)

    ASWING.CONLAW[1] = true
    if ls <= 0
        CONLAW.NUPAR1[i,j] = 2
        CONLAW.NUPAR2[i,j] = 2
        CONLAW.UPAR1[i,j,1:2] .= 0.0
        CONLAW.UPAR2[i,j,1:2] .= 0.0
        CONLAW.CU[i,j,1:2,1:2] .= c*gfac
        ASWING.LDCON[i] = true
        ASWING.LUCON[i] = true
    else
        CONLAW.NQPAR1[i,j,ls] = 2
        CONLAW.NQPAR2[i,j,ls] = 2
        CONLAW.QPAR1[i,j,ls,1:2] .= 0.0
        CONLAW.QPAR2[i,j,ls,1:2] .= 0.0
        CONLAW.CQ[i,j,ls,1:2,1:2] .= c*gfac
        ASWING.LDCON[i] = true
        ASWING.LQCON[j,ls] = true
    end
    ASWING.CONSET[1] = true

    return nothing
end

"""
    getintervals(ibeam::Integer)
    Gets number of panels between each break point
"""
function getintervals(ibeam::Integer)
    # get first beam index
    if ASWING.SBRK[1,ibeam] == ASWING.STIPL[ibeam]
        kbfrst = 1
    else
        kbfrst = 0
    end
    # get last beam index
    nbreak = ASWING.NBRK[ibeam]
    if ASWING.SBRK[nbreak,ibeam] == ASWING.STIPR[ibeam]
        kblast = nbreak
    else
        kblast = nbreak+1
    end
    # get spacing
    return ASWING.IBRK[kbfrst+1:kblast,ibeam].-ASWING.IBRK[kbfrst:kblast-1,ibeam].-1
end

"""
    nodeset(intervals::AbstractArray{<:AbstractArray{<:Integer, 1},1})

    Sets new number of nodes for ibeam.  A custom number of panels can be used
    between break points.
"""
function nodeset(intervals::AbstractArray{<:AbstractArray{<:Integer, 1},1})

    if length(intervals) != ASWING.NBEAM[1]
        error("length of intervals must equal ASWING.NBEAM")
    end

    for ibeam = 1:ASWING.NBEAM[1]
        # get first beam index
        if ASWING.SBRK[1,ibeam] == ASWING.STIPL[ibeam]
            kbfrst = 1
        else
            kbfrst = 0
        end

        # get last beam index
        nbreak = ASWING.NBRK[ibeam]
        if ASWING.SBRK[nbreak,ibeam] == ASWING.STIPR[ibeam]
            kblast = nbreak
        else
            kblast = nbreak+1
        end

        # assign new number of nodes to beam
        if !isempty(intervals[ibeam])
            nnodes = sum(intervals[ibeam])+length(intervals[ibeam])
            if nnodes < 2
                error("sum(intervals[$ibeam]) too small. nnodes must be >= 2")
            elseif nnodes > IIX
                error("sum(intervals[$ibeam]) too large. nnodes must be < IIX")
            end
            ASWING.II[ibeam] = nnodes
        end
        ccall((:iiset_, libaswing), Nothing, ())

        # assign new node distribution
        if !isempty(intervals[ibeam])
            THCALC.CUSTOMINTERVALS[1] = true
            THCALC.INTERVALS[kbfrst+1:kblast] = intervals[ibeam]
        else
            THCALC.CUSTOMINTERVALS[1] = false
        end
        ccall((:winit_, libaswing), Nothing, (Ref{Int32}, Ref{Int32}), ibeam, 0)
        ccall((:qinit_, libaswing), Nothing, (Ref{Int32}, Ref{Int32}, Ref{Float64}, Ref{Float64}),
            ASWING.IFRST[ibeam], ASWING.ILAST[ibeam], view(ASWING.Q,1:18,1:ASWING.IITOT[1],ASWING.IPOINT[1]), ASWING.Q0)
    end
    ccall((:spltset_, libaswing), Nothing, ())
    ccall((:micalc_, libaswing), Nothing, (Ref{Int32},), 1)
    ccall((:nnset_, libaswing), Nothing, ())

    # set to unconverged
    ASWING.LQINI[1:NPNTX] .= false
    ASWING.LCONV[1:NPNTX] .= false
    ASWING.LAINI[1:NPNTX] .= false

    # restore default node distribution settings
    THCALC.CUSTOMINTERVALS[1] = false
    return nothing
end

function getstabilityderivatives(ipnt::Integer=1)

    # no convergence failures yet
    fail = false

    # Get quasi-steady solution
    solution = solvesteady(ipnt)

    if solution.converged == false
        fail = true
    end

    # Retain parameters
    retainparam(ipnt)

    # Switch to anchored constraints
    setcons(Constraints("anchored"))

    # Get quasi-steady solution
    solution_qs = solvesteady(ipnt)

    # check if convergence failed
    if solution_qs.converged == false
        fail = true
    end

    # Get stability matrices using center of gravity as moment reference
    stabderivs_qs = stabilityderivatives(ipnt, momref=solution_qs.pnt_param.position_aircraft_cg)

    # rigidize aircraft at current deformed shape
    freeze(ipnt)

    # Get quasi-steady solution
    solution_rigid = solvesteady(ipnt)

    # check if convergence failed
    if solution_rigid.converged == false
        fail = true
    end

    # Get stability matrices using center of gravity as moment reference
    stabderivs_rigid = stabilityderivatives(ipnt, momref=solution_rigid.pnt_param.position_aircraft_cg)

    return stabderivs_qs, stabderivs_rigid, fail
end #getstabilityderivatives


"""
    getstaticmargin(ipnt::Integer=1)

    Returns quasi-steady static margin, rigidized static margin, and a solution
    failure flag.  Assumes constraints are set up for trimmed flight and follows
    the instructions in derivative_calc.txt. This function performs irreversible
    changes so you will need to re-input the geometry afterwards.
"""
function getstaticmargin(ipnt::Integer=1)

    stabderivs_qs, stabderivs_rigid, fail = getstabilityderivatives(ipnt)

    # calculate static margin
    sm_qs = -stabderivs_qs.Cma/stabderivs_qs.CLa*100

    # calculate static margin
    sm_rigid = -stabderivs_rigid.Cma/stabderivs_rigid.CLa*100

    return sm_qs, sm_rigid, fail
end #getstaticmargin
