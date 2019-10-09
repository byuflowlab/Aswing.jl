# defines structures for holding ASWING Solution data

struct StabilityDerivatives
    CXu::Float64
    CYu::Float64
    CLu::Float64
    CXb::Float64
    CYb::Float64
    CLb::Float64
    CXa::Float64
    CYa::Float64
    CLa::Float64
    Clu::Float64
    Cmu::Float64
    Cnu::Float64
    Clb::Float64
    Cmb::Float64
    Cnb::Float64
    Cla::Float64
    Cma::Float64
    Cna::Float64
    CXp::Float64
    CYp::Float64
    CLp::Float64
    CXq::Float64
    CYq::Float64
    CLq::Float64
    CXr::Float64
    CYr::Float64
    CLr::Float64
    Clp::Float64
    Cmp::Float64
    Cnp::Float64
    Clq::Float64
    Cmq::Float64
    Cnq::Float64
    Clr::Float64
    Cmr::Float64
    Cnr::Float64
    CXdF::Array{Float64,1}
    CYdF::Array{Float64,1}
    CLdF::Array{Float64,1}
    CldF::Array{Float64,1}
    CmdF::Array{Float64,1}
    CndF::Array{Float64,1}
    CXdP::Array{Float64,1}
    CYdP::Array{Float64,1}
    CLdP::Array{Float64,1}
    CldP::Array{Float64,1}
    CmdP::Array{Float64,1}
    CndP::Array{Float64,1}
    function StabilityDerivatives(f_vba::AbstractArray{<:Real,2},
        m_vba::AbstractArray{<:Real,2}, f_rot::AbstractArray{<:Real,2},
        m_rot::AbstractArray{<:Real,2}, f_flap::AbstractArray{<:Real,2},
        m_flap::AbstractArray{<:Real,2}, f_peng::AbstractArray{<:Real,2},
        m_peng::AbstractArray{<:Real,2})

        new(f_vba[1,1], f_vba[2,1], -f_vba[3,1],
        f_vba[1,2], f_vba[2,2], -f_vba[3,2],
        f_vba[1,3], f_vba[2,3], -f_vba[3,3],
        m_vba[1,1], m_vba[2,1], m_vba[3,1],
        m_vba[1,2], m_vba[2,2], m_vba[3,2],
        m_vba[1,3], m_vba[2,3], m_vba[3,3],
        f_rot[1,1], f_rot[2,1], -f_rot[3,1],
        f_rot[1,2], f_rot[2,2], -f_rot[3,2],
        f_rot[1,3], f_rot[2,3], -f_rot[3,3],
        m_rot[1,1], m_rot[2,1], m_rot[3,1],
        m_rot[1,2], m_rot[2,2], m_rot[3,2],
        m_rot[1,3], m_rot[2,3], m_rot[3,3],
        f_flap[1,:], f_flap[2,:], -f_flap[3,:],
        m_flap[1,:], m_flap[2,:], m_flap[3,:],
        f_peng[1,:], f_peng[2,:], -f_peng[3,:],
        m_peng[1,:], m_peng[2,:], m_peng[3,:])
    end
end
eltype(::Type{StabilityDerivatives}) = Float64

# contains Solution information for an operating point
struct SolutionParameters
    linear_acceleration::Array{Float64,1}
    angular_acceleration::Array{Float64,1}
    velocity::Array{Float64,1}
    rotation_rate::Array{Float64,1}
    position_aircraft_origin::Array{Float64,1}
    phi::Float64
    theta::Float64
    psi::Float64
    flap_defl_ctrl_var::Array{Float64,1}
    eng_pwr_ctrl_var::Array{Float64,1}
    err_int_Vinf::Float64
    err_int_beta::Float64
    err_int_alpha::Float64
    err_int_phi::Float64
    err_int_theta::Float64
    err_int_psi::Float64
    err_int_ROTxyz::Array{Float64,1}
    err_int_VACxyz::Array{Float64,1}
    position_aircraft_cg::Array{Float64,1}
    freestream_speed::Float64
    freestream_sideslip_angle::Float64
    freestream_incidence_angle::Float64
    indicated_V::Float64
    indicated_beta::Float64
    indicated_alpha::Float64
    drag_force::Float64
    side_force::Float64
    lift_force::Float64
    induced_drag_coefficient::Float64
    drag_coefficient::Float64
    sideforce_coefficient::Float64
    lift_coefficient::Float64
    rolling_moment_coefficient::Float64
    pitching_moment_coefficient::Float64
    yawing_moment_coefficient::Float64
    span_efficiency::Float64
    aero_force::Array{Float64,1}
    aero_moment::Array{Float64,1}
    accel_reaction_force::Array{Float64,1}
    accel_reaction_moment::Array{Float64,1}
    ground_reaction_force::Array{Float64,1}
    ground_reaction_moment::Array{Float64,1}
    engine_force::Array{Float64,1}
    engine_moment::Array{Float64,1}
    trefftz_plane_aero_force::Array{Float64,1}
    trefftz_plane_aero_moment::Array{Float64,1}
    mach::Float64
    altitude::Float64
    density::Float64
    speed_of_sound::Float64
    viscosity::Float64
    gravitational_acceleration::Float64
    load_factor::Float64
    mass::Float64
end
eltype(::Type{SolutionParameters}) = Float64

# contains spanwise input variable information interpolated to Solution nodes
struct SolutionGeometry
    s::Array{Float64,1}
    x::Array{Float64,1}
    y::Array{Float64,1}
    z::Array{Float64,1}
    twist::Array{Float64,1}
    EIcc::Array{Float64,1}
    EInn::Array{Float64,1}
    EIcn::Array{Float64,1}
    EIcs::Array{Float64,1}
    EIsn::Array{Float64,1}
    GJ::Array{Float64,1}
    EA::Array{Float64,1}
    GKc::Array{Float64,1}
    GKn::Array{Float64,1}
    mgcc::Array{Float64,1}
    mgnn::Array{Float64,1}
    mg::Array{Float64,1}
    Ccg::Array{Float64,1}
    Ncg::Array{Float64,1}
    Dmgcc::Array{Float64,1}
    Dmgnn::Array{Float64,1}
    Dmg::Array{Float64,1}
    DCcg::Array{Float64,1}
    DNcg::Array{Float64,1}
    Cea::Array{Float64,1}
    Nea::Array{Float64,1}
    Cta::Array{Float64,1}
    Nta::Array{Float64,1}
    tdeps::Array{Float64,1}
    tdgam::Array{Float64,1}
    Cshell::Array{Float64,1}
    Nshell::Array{Float64,1}
    Atshell::Array{Float64,1}
    radius::Array{Float64,1}
    Cdf::Array{Float64,1}
    Cdp::Array{Float64,1}
    chord::Array{Float64,1}
    Xax::Array{Float64,1}
    alpha::Array{Float64,1}
    Cm::Array{Float64,1}
    CLmax::Array{Float64,1}
    CLmin::Array{Float64,1}
    dCLda::Array{Float64,1}
    dCLdF::Array{Float64,2}
    dCMdF::Array{Float64,2}
    dCDdF::Array{Float64,2}
end
eltype(::Type{SolutionGeometry}) = Float64

# contains spanwise output variable information at Solution nodes
struct SolutionSpanwise
    x::Array{Float64,1}
    y::Array{Float64,1}
    z::Array{Float64,1}
    phi::Array{Float64,1}
    theta::Array{Float64,1}
    psi::Array{Float64,1}
    Mc::Array{Float64,1}
    Ms::Array{Float64,1}
    Mn::Array{Float64,1}
    Fc::Array{Float64,1}
    Fs::Array{Float64,1}
    Fn::Array{Float64,1}
    ux::Array{Float64,1}
    uy::Array{Float64,1}
    uz::Array{Float64,1}
    wx::Array{Float64,1}
    wy::Array{Float64,1}
    wz::Array{Float64,1}
    max_extensional_strain::Array{Float64,1}
    shear_stress::Array{Float64,1}
    chord::Array{Float64,1}
    cl::Array{Float64,1}
    cm::Array{Float64,1}
    f_aero::Array{Float64,1}
    f_reac::Array{Float64,1}
    da_eff::Array{Float64,1} # aeroelastic twist
    da_flp::Array{Float64,1} # additional twist due to flaps
end
eltype(::Type{SolutionSpanwise}) = Float64

# contains aswing solution data
struct Solution
    converged::Bool
    pnt_param::SolutionParameters
    span_geom::Array{SolutionGeometry,1}
    span_param::Array{SolutionSpanwise,1}
end
eltype(::Type{Solution}) = Float64

# converts ASWING output arrays to Solution struct
function getsolution(ipnt1::Integer=1, ipnt2::Integer=ASWING.NPOINT[1])

    sol = Array{Solution,1}(undef, max(ipnt2-ipnt1+1,0))
    for ipnt = ipnt1:ipnt2
        # Process converged boolean
        converged = ASWING.LCONV[ipnt]
        # Process operating point parameters
        linear_acceleration = ASWING.PARAM[KPVACX:KPVACZ,ipnt]
        angular_acceleration = ASWING.PARAM[KPRACX:KPRACZ,ipnt]
        velocity = ASWING.PARAM[KPVELX:KPVELZ,ipnt]
        rotation_rate = ASWING.PARAM[KPROTX:KPROTZ,ipnt]
        position_aircraft_origin = ASWING.PARAM[KPPOSX:KPPOSZ,ipnt]
        phi = ASWING.PARAM[KPBANK,ipnt]
        theta = ASWING.PARAM[KPELEV,ipnt]
        psi = ASWING.PARAM[KPHEAD,ipnt]
        flap_defl_ctrl_var = ASWING.PARAM[KPFLP1:KPFLP1+NFLPX-1,ipnt]
        eng_pwr_ctrl_var = ASWING.PARAM[KPENG1:KPENG1+NENGX-1,ipnt]
        err_int_Vinf = ASWING.PARAM[KPVIDT,ipnt]
        err_int_beta = ASWING.PARAM[KPBEDT,ipnt]
        err_int_alpha =ASWING.PARAM[KPALDT,ipnt]
        err_int_phi = ASWING.PARAM[KPBADT,ipnt]
        err_int_theta = ASWING.PARAM[KPELDT,ipnt]
        err_int_psi = ASWING.PARAM[KPHEDT,ipnt]
        err_int_ROTxyz = ASWING.PARAM[KPWDTX:KPWDTZ,ipnt]
        err_int_VACxyz = ASWING.PARAM[KPADTX:KPADTZ,ipnt]
        position_aircraft_cg = ASWING.PARAM[KPRCGX:KPRCGZ,ipnt]
        freestream_speed = ASWING.PARAM[KPVINF,ipnt]
        freestream_sideslip_angle = ASWING.PARAM[KPBETA,ipnt]
        freestream_incidence_angle = ASWING.PARAM[KPALFA,ipnt]
        indicated_V = ASWING.PARAM[KPVIAS,ipnt]
        indicated_beta = ASWING.PARAM[KPBREF,ipnt]
        indicated_alpha = ASWING.PARAM[KPAREF,ipnt]
        drag_force = ASWING.PARAM[KPDRAG,ipnt]
        side_force = ASWING.PARAM[KPSIDE,ipnt]
        lift_force = ASWING.PARAM[KPLIFT,ipnt]
        induced_drag_coefficient = ASWING.PARAM[KPCDIN,ipnt]
        drag_coefficient = ASWING.PARAM[KPCDRG,ipnt]
        sideforce_coefficient = ASWING.PARAM[KPCSID,ipnt]
        lift_coefficient = ASWING.PARAM[KPCLIF,ipnt]
        rolling_moment_coefficient = ASWING.PARAM[KPCROL,ipnt]
        pitching_moment_coefficient = ASWING.PARAM[KPCMOM,ipnt]
        yawing_moment_coefficient = ASWING.PARAM[KPCYAW,ipnt]
        span_efficiency = ASWING.PARAM[KPSEFF,ipnt]
        aero_force = ASWING.PARAM[KPAFOX:KPAFOZ,ipnt]
        aero_moment = ASWING.PARAM[KPAMOX:KPAMOZ,ipnt]
        accel_reaction_force = ASWING.PARAM[KPRFOX:KPRFOZ,ipnt]
        accel_reaction_moment = ASWING.PARAM[KPRMOX:KPRMOZ,ipnt]
        ground_reaction_force = ASWING.PARAM[KPGFOX:KPGFOZ,ipnt]
        ground_reaction_moment = ASWING.PARAM[KPGMOX:KPGMOZ,ipnt]
        engine_force = ASWING.PARAM[KPEFOX:KPEFOZ,ipnt]
        engine_moment = ASWING.PARAM[KPEMOX:KPEMOZ,ipnt]
        trefftz_plane_aero_force = ASWING.PARAM[KPTFOX:KPTFOZ,ipnt]
        trefftz_plane_aero_moment = ASWING.PARAM[KPTMOX:KPTMOZ,ipnt]
        mach = ASWING.PARAM[KPMACH,ipnt]
        altitude = ASWING.PARAM[KPALTK,ipnt]
        density = ASWING.PARAM[KPDENS,ipnt]
        speed_of_sound = ASWING.PARAM[KPVSOU,ipnt]
        viscosity = ASWING.PARAM[KPVISC,ipnt]
        gravitational_acceleration = ASWING.PARAM[KPGRAV,ipnt]
        load_factor = ASWING.PARAM[KPLOAD,ipnt]
        pnt_param = SolutionParameters(linear_acceleration,angular_acceleration,velocity,rotation_rate,
        position_aircraft_origin,phi,theta,psi,flap_defl_ctrl_var,eng_pwr_ctrl_var,
        err_int_Vinf,err_int_beta,err_int_alpha,err_int_phi,err_int_theta,err_int_psi,
        err_int_ROTxyz,err_int_VACxyz,position_aircraft_cg,freestream_speed,
        freestream_sideslip_angle,freestream_incidence_angle,indicated_V,
        indicated_beta,indicated_alpha,drag_force,side_force,lift_force,
        induced_drag_coefficient,drag_coefficient,sideforce_coefficient,
        lift_coefficient,rolling_moment_coefficient,pitching_moment_coefficient,
        yawing_moment_coefficient,span_efficiency,aero_force,aero_moment,
        accel_reaction_force,accel_reaction_moment,ground_reaction_force,
        ground_reaction_moment,engine_force,engine_moment,trefftz_plane_aero_force,
        trefftz_plane_aero_moment,mach,altitude,density,speed_of_sound,viscosity,
        gravitational_acceleration,load_factor,ASWING.MASS[1])
        #Process spanwise geometry and Solution
        span_geom = Array{SolutionGeometry,1}(undef, ASWING.NBEAM[1])
        span_sol = Array{SolutionSpanwise,1}(undef, ASWING.NBEAM[1])
        for ibeam = 1:ASWING.NBEAM[1]
            i1 = convert(Int,ASWING.IFRST[ibeam])
            i2 = convert(Int,ASWING.ILAST[ibeam])
            # spanwise geometry
            sgeom = ASWING.S[i1:i2]
            x = ASWING.QPAR[i1:i2,JXA]
            y = ASWING.QPAR[i1:i2,JYA]
            z = ASWING.QPAR[i1:i2,JZA]
            twist = ASWING.QPAR[i1:i2,JTW]
            EIcc = ASWING.QPAR[i1:i2,JECC]
            EInn = ASWING.QPAR[i1:i2,JENN]
            EIcn = ASWING.QPAR[i1:i2,JECN]
            EIcs = ASWING.QPAR[i1:i2,JECS]
            EIsn = ASWING.QPAR[i1:i2,JESN]
            GJ = ASWING.QPAR[i1:i2,JGJ]
            EA = ASWING.QPAR[i1:i2,JEA]
            GKc = ASWING.QPAR[i1:i2,JGKC]
            GKn = ASWING.QPAR[i1:i2,JGKN]
            mgcc = ASWING.QPAR[i1:i2,JMCC1]
            mgnn = ASWING.QPAR[i1:i2,JMNN1]
            mg = ASWING.QPAR[i1:i2,JMG1]
            Ccg = ASWING.QPAR[i1:i2,JCCG1]
            Ncg = ASWING.QPAR[i1:i2,JNCG1]
            Dmgcc = ASWING.QPAR[i1:i2,JMCC2]
            Dmgnn = ASWING.QPAR[i1:i2,JMNN2]
            Dmg = ASWING.QPAR[i1:i2,JMG2]
            DCcg = ASWING.QPAR[i1:i2,JCCG2]
            DNcg = ASWING.QPAR[i1:i2,JNCG2]
            Cea = ASWING.QPAR[i1:i2,JCEA]
            Nea = ASWING.QPAR[i1:i2,JNEA]
            Cta = ASWING.QPAR[i1:i2,JCTA]
            Nta = ASWING.QPAR[i1:i2,JNTA]
            tdeps = ASWING.QPAR[i1:i2,JTDE]
            tdgam = ASWING.QPAR[i1:i2,JTDG]
            Cshell = ASWING.QPAR[i1:i2,JCSH]
            Nshell = ASWING.QPAR[i1:i2,JNSH]
            Atshell = ASWING.QPAR[i1:i2,JASH]
            radius = ASWING.QPAR[i1:i2,JRAD]
            Cdf = ASWING.QPAR[i1:i2,JCDF]
            Cdp = ASWING.QPAR[i1:i2,JCDP]
            chord = ASWING.QPAR[i1:i2,JCH]
            Xax = ASWING.QPAR[i1:i2,JXAX]
            alpha = ASWING.QPAR[i1:i2,JAL]
            Cm = ASWING.QPAR[i1:i2,JCM]
            CLmax = ASWING.QPAR[i1:i2,JCMX]
            CLmin = ASWING.QPAR[i1:i2,JCMN]
            dCLda = ASWING.QPAR[i1:i2,JDCL]
            dCLdF = ASWING.QPAR[i1:i2,JCLF1:JCLF1+NFLPX-1]
            dCMdF = ASWING.QPAR[i1:i2,JCMF1:JCMF1+NFLPX-1]
            dCDdF = ASWING.QPAR[i1:i2,JCDF1:JCDF1+NFLPX-1]
            span_geom[ibeam] = SolutionGeometry(sgeom,x,y,z,twist,EIcc,EInn,EIcn,EIcs,EIsn,GJ,
            EA,GKc,GKn,mgcc,mgnn,mg,Ccg,Ncg,Dmgcc,Dmgnn,Dmg,DCcg,DNcg,Cea,Nea,Cta,Nta,
            tdeps,tdgam,Cshell,Nshell,Atshell,radius,Cdf,Cdp,chord,Xax,alpha,Cm,CLmax,
            CLmin,dCLda,dCLdF, dCMdF, dCDdF)
            # spanwise Solution
            x=ASWING.QPNT[i1:i2,1,ipnt]
            y=ASWING.QPNT[i1:i2,2,ipnt]
            z=ASWING.QPNT[i1:i2,3,ipnt]
            psi=ASWING.QPNT[i1:i2,4,ipnt]
            theta=ASWING.QPNT[i1:i2,5,ipnt]
            phi=ASWING.QPNT[i1:i2,6,ipnt]
            Mc=ASWING.QPNT[i1:i2,7,ipnt]
            Ms=ASWING.QPNT[i1:i2,8,ipnt]
            Mn=ASWING.QPNT[i1:i2,9,ipnt]
            Fc=ASWING.QPNT[i1:i2,10,ipnt]
            Fs=ASWING.QPNT[i1:i2,11,ipnt]
            Fn=ASWING.QPNT[i1:i2,12,ipnt]
            ux=ASWING.QPNT[i1:i2,13,ipnt]
            uy=ASWING.QPNT[i1:i2,14,ipnt]
            uz=ASWING.QPNT[i1:i2,15,ipnt]
            wx=ASWING.QPNT[i1:i2,16,ipnt]
            wy=ASWING.QPNT[i1:i2,17,ipnt]
            wz=ASWING.QPNT[i1:i2,18,ipnt]
            max_extensional_strain=ASWING.QPNT[i1:i2,19,ipnt]
            shear_stress=ASWING.QPNT[i1:i2,20,ipnt]
            chord=ASWING.QPNT[i1:(i2-1),21,ipnt]
            cl=ASWING.QPNT[i1:(i2-1),22,ipnt]
            cm=ASWING.QPNT[i1:(i2-1),23,ipnt]
            f_aero=ASWING.QPNT[i1:(i2-1),24,ipnt]
            f_reac=ASWING.QPNT[i1:(i2-1),25,ipnt]
            da_eff=ASWING.QPNT[i1:(i2-1),26,ipnt]
            da_flp=ASWING.QPNT[i1:(i2-1),27,ipnt]
            span_sol[ibeam] = SolutionSpanwise(x,y,z,psi,theta,phi,Mc,Ms,Mn,Fc,Fs,Fn,
            ux,uy,uz,wx,wy,wz,max_extensional_strain,shear_stress,chord,cl,cm,f_aero,
            f_reac,da_eff,da_flp)
        end

        # Create combined Solution
        sol[ipnt] = Solution(converged,pnt_param,span_geom,span_sol)
    end
    return sol
end
