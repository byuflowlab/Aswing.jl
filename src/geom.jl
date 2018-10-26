# defines geometry used in ASWING

# Dictionary of pointers to beam values
beamvarval = Dict{String,Int32}(strip(VARS[i])=>i for i = 1:JBTOT)

"""
    aswconsts(;
        sea_level_air_density::Real = 1.225,
        sea_level_speed_of_sound::Real = 340.2778,
        gravity::Real = 9.81)

    Returns struct containing constants as defined in .asw file
"""
struct aswconsts
    sea_level_air_density::Float64
    sea_level_speed_of_sound::Float64
    gravity::Float64
end
function aswconsts(;
    sea_level_air_density::Real = 1.225,
    sea_level_speed_of_sound::Real = 340.2778,
    gravity::Real = 9.81)
    aswconsts(sea_level_air_density, sea_level_speed_of_sound, gravity)
end

"""
    aswrefs(;area::Real = 1.0, chord::Real = 1.0, span::Real = 1.0,
        momref::AbstractArray{<:Real,1} = zeros(Float64,3),
        velref::AbstractArray{<:Real,1} = zeros(Float64,3),
        accelref::AbstractArray{<:Real,1} = zeros(Float64,3))

    Returns struct containing reference values as defined in .asw file
"""
struct aswrefs
    area::Float64
    chord::Float64
    span::Float64
    moments::Array{Float64,1}
    velocities::Array{Float64,1}
    accelerations::Array{Float64,1}
    function aswrefs(area::Real, chord::Real, span::Real,
        momref::AbstractArray{<:Real,1}, velref::AbstractArray{<:Real,1},
        accelref::AbstractArray{<:Real,1})

        if (length(momref) != 3) || (length(velref) != 3) || (length(accelref) != 3)
            error("Array inputs must be of length 3")
        end

        new(area, chord, span, momref, velref, accelref)
    end
end
function aswrefs(; area::Real = 1.0, chord::Real = 1.0, span::Real = 1.0,
    momref::AbstractArray{<:Real,1} = zeros(Float64,3),
    velref::AbstractArray{<:Real,1} = zeros(Float64,3),
    accelref::AbstractArray{<:Real,1} = zeros(Float64,3))
    aswrefs(area, chord, span, momref, velref, accelref)
end

"""
    aswweight(;Nbeam::Integer=0, t::Real=0.0,
        location::AbstractArray{<:Real,1}=zeros(Float64,3), weight::Real=0.0,
        CDA::Real=0.0, vol::Real=0.0, Ho::AbstractArray{<:Real,1}=zeros(Float64,3),
        Ixx::Real=0, Iyy::Real=0, Izz::Real=0, Ixy::Real=0, Ixz::Real=0, Iyz::Real=0)

    Returns struct defining a single point mass as defined in .asw file
"""
struct aswweight
    Nbeam::Int32
    t::Float64
    location::Array{Float64,1}
    weight::Float64
    CDA::Float64
    vol::Float64
    Ho::Array{Float64,1}
    Ixx::Float64
    Iyy::Float64
    Izz::Float64
    Ixy::Float64
    Ixz::Float64
    Iyz::Float64
    function aswweight(Nbeam::Integer, t::Real=0.0,
        location::AbstractArray{<:Real,1}=zeros(Float64,3), weight::Real=0.0,
        CDA::Real=0.0, vol::Real=0.0, Ho::AbstractArray{<:Real,1}=zeros(Float64,3),
        Ixx::Real=0, Iyy::Real=0, Izz::Real=0,
        Ixy::Real=0, Ixz::Real=0, Iyz::Real=0)

        if (length(location) != 3) || (length(Ho) != 3)
            error("Array inputs must be of length 3")
        end

        new(Nbeam,t,location,weight,CDA,vol,Ho,Ixx,Iyy,Izz,Ixy,Ixz,Iyz)
    end
end
function aswweight(;Nbeam::Integer=0, t::Real=0.0,
    location::AbstractArray{<:Real,1}=zeros(Float64,3), weight::Real=0.0,
    CDA::Real=0.0, vol::Real=0.0, Ho::AbstractArray{<:Real,1}=zeros(Float64,3),
    Ixx::Real=0, Iyy::Real=0, Izz::Real=0, Ixy::Real=0, Ixz::Real=0, Iyz::Real=0)

    aswweight(Nbeam, t, location, weight, CDA, vol, Ho, Ixx, Iyy, Izz,
        Ixy, Ixz, Iyz)
end

"""
    aswsensor(;Ksens::Integer = 0, Nbeam::Integer = 0, t::Real=0.0,
        location::AbstractArray{<:Real,1} = zeros(Float64,3),
        V::AbstractArray{<:Real,1} = zeros(Float64,3),
        A::AbstractArray{<:Real,1} = zeros(Float64,3))

    Returns struct defining a single sensor as defined in .asw file
"""
struct aswsensor
    Ksens::Int32
    Nbeam::Int32
    t::Float64
    location::Array{Float64,1}
    V::Array{Float64,1}
    A::Array{Float64,1}
    function aswsensor(Ksens::Integer, Nbeam::Integer, t::Real=0.0,
        location::AbstractArray{<:Real,1} = zeros(Float64,3),
        V::AbstractArray{<:Real,1} = zeros(Float64,3),
        A::AbstractArray{<:Real,1} = zeros(Float64,3))

        if (length(location) != 3) || (length(V) != 3) || (length(A) != 3)
            error("Array inputs must be of length 3")
        end

        new(Ksens, Nbeam, t, location, V, A)
    end
end
function aswsensor(;Ksens::Integer = 0, Nbeam::Integer = 0, t::Real=0.0,
    location::AbstractArray{<:Real,1} = zeros(Float64, 3),
    V::AbstractArray{<:Real,1} = zeros(Float64, 3),
    A::AbstractArray{<:Real,1} = zeros(Float64, 3))

    aswsensor(Ksens, Nbeam, t, location, V, A)
end

"""
    aswengine(;Keng::Integer=0, IEtyp::Integer=0, Nbeam::Integer=0,
        t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(Float64,3),
        thrust_direction::AbstractArray{<:Real,1}=zeros(Float64,3), dFdPe::Real=0.0,
        dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0, cdA::Real=0.0,
        cl::Real=0.0, CLa::Real=0.0, S0::Real=0.0, C0::Real=0.0, S1::Real=0.0,
        C1::Real=0.0, S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0)

    Returns struct defining a single engine as defined in .asw file
"""
struct aswengine
    Keng::Int32
    IEtyp::Int32
    Nbeam::Int32
    t::Float64
    location::Array{Float64,1}
    thrust_direction::Array{Float64,1}
    dFdPe::Float64
    dMdPe::Float64
    Rdisk::Float64
    Omega::Float64
    cdA::Float64
    cl::Float64
    CLa::Float64
    S0::Float64
    C0::Float64
    S1::Float64
    C1::Float64
    S2::Float64
    C2::Float64
    S3::Float64
    C3::Float64
    function aswengine(Keng::Integer, IEtyp::Integer, Nbeam::Integer,
        t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(Float64,3),
        thrust_direction::AbstractArray{<:Real,1}=zeros(Float64, 3),
        dFdPe::Real=0.0, dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0,
        cdA::Real=0.0, cl::Real=0.0, CLa::Real=0.0,
        S0::Real=0.0, C0::Real=0.0, S1::Real=0.0, C1::Real=0.0,
        S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0)

        if (length(location) != 3) || (length(thrust_direction) != 3)
            error("Array inputs must be of length 3")
        end

        new(Keng, IEtyp, Nbeam, t, location, thrust_direction, dFdPe, dMdPe,
            Rdisk, Omega, cdA, cl, CLa, S0, C0, S1, C1, S2, C2, S3, C3)
    end
end
function aswengine(;Keng::Integer=0, IEtyp::Integer=0, Nbeam::Integer=0,
    t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(Float64,3),
    thrust_direction::AbstractArray{<:Real,1}=zeros(Float64,3), dFdPe::Real=0.0,
    dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0, cdA::Real=0.0,
    cl::Real=0.0, CLa::Real=0.0, S0::Real=0.0, C0::Real=0.0, S1::Real=0.0,
    C1::Real=0.0, S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0)

    aswengine(Keng, IEtyp, Nbeam, t, location, thrust_direction, dFdPe, dMdPe,
        Rdisk, Omega, cdA, cl, CLa, S0, C0, S1, C1, S2, C2, S3, C3)
end

"""
    aswstrut(;Nbeam::Integer=0, t::Real=0.0,
        location::AbstractArray{<:Real,1}=zeros(Float64,3),
        anchor_location::AbstractArray{<:Real,1}=zeros(Float64,3), dLo::Real=0.0,
        EAw::Real=0.0)

    Returns struct defining a single strut as defined in .asw file
"""
struct aswstrut
    Nbeam::Int32
    t::Float64
    location::Array{Float64,1}
    anchor_location::Array{Float64,1}
    dLo::Float64
    EAw::Float64
    function aswstrut(Nbeam::Integer, t::Real=0.0,
        location::AbstractArray{<:Real,1}=zeros(Float64,3),
        anchor_location::AbstractArray{<:Real,1}=zeros(Float64,3),
        dLo::Real=0.0, EAw::Real=0.0)

        if (length(location) != 3) || (length(anchor_location) != 3)
            error("Array inputs must be of length 3")
        end

        new(Nbeam, t, location, anchor_location, dLo, EAw)
    end
end
function aswstrut(;Nbeam::Integer=0, t::Real=0.0,
    location::AbstractArray{<:Real,1}=zeros(Float64, 3),
    anchor_location::AbstractArray{<:Real,1}=zeros(Float64, 3), dLo::Real=0.0,
    EAw::Real=0.0)

    aswstrut(Nbeam, t, location, anchor_location, dLo, EAw)
end

"""
    aswjoint(;Nbeam1::Integer=0, Nbeam2::Integer=0, t1::Real=0.0,
        t2::Real=0.0, KJtype::Integer=0)

    Returns struct defining a single joint as defined in .asw file
"""
struct aswjoint
    Nbeam1::Int32
    Nbeam2::Int32
    t1::Float64
    t2::Float64
    KJtype::Int32
end
function aswjoint(;Nbeam1::Integer=0, Nbeam2::Integer=0, t1::Real=0.0,
    t2::Real=0.0, KJtype::Integer=0)

    aswjoint(Nbeam1,Nbeam2,t1,t2,KJtype)
end

"""
    aswjangle(;Njoint::Integer=0,
        hinge_axis::AbstractArray{<:Real,1} = zeros(Float64, 3),
        hinge_moment::AbstractArray{<:Real,1} = zeros(1),
        hinge_angle::AbstractArray{<:Real,1} = zeros(1))

    Returns struct defining a single jangle as defined in .asw file
"""
struct aswjangle
    Njoint::Int32
    hinge_axis::Array{Float64,1}
    hinge_moment::Array{Float64,1}
    hinge_angle::Array{Float64,1}
    function aswjangle(Njoint::Integer, hinge_axis::AbstractArray{<:Real,1},
        hinge_moment::AbstractArray{<:Real,1}, hinge_angle::AbstractArray{<:Real,1})

        if length(hinge_moment) != length(hinge_angle)
            error("hinge moment and angle vectors must be same length")
        end

        new(Njoint::Integer, hinge_axis::AbstractArray{<:Real,1},
            hinge_moment::AbstractArray{<:Real,1}, hinge_angle::AbstractArray{<:Real,1})
    end
end
function aswjangle(;Njoint::Integer=0,
    hinge_axis::AbstractArray{<:Real,1} = zeros(Float64, 3),
    hinge_moment::AbstractArray{<:Real,1} = zeros(1),
    hinge_angle::AbstractArray{<:Real,1} = zeros(1))
    aswjangle(Njoint, hinge_axis, hinge_moment, hinge_angle)
end

"""
    aswground(;Nbeam::Integer=0, t::Real=0.0, KGtype::Integer=0)

    Returns struct defining a single ground as defined in .asw file
"""
struct aswground
    Nbeam::Int32
    t::Float64
    KGtype::Int32
end
function aswground(;Nbeam::Integer=0, t::Real=0.0, KGtype::Integer=0)
    new(Nbeam, t, KGtype)
end

"""
    aswbeamspanwise(; <keyword arguments>)

    Returns struct defining the spanwise properties of a beam as defined in
        .asw file
    The first column of each variable is the t-value
    The second column is the variable value corresponding to that t-value
"""
struct aswbeamspanwise
    x::Array{Float64,2}
    y::Array{Float64,2}
    z::Array{Float64,2}
    twist::Array{Float64,2}
    EIcc::Array{Float64,2}
    EInn::Array{Float64,2}
    EIcn::Array{Float64,2}
    EIcs::Array{Float64,2}
    EIsn::Array{Float64,2}
    GJ::Array{Float64,2}
    EA::Array{Float64,2}
    GKc::Array{Float64,2}
    GKn::Array{Float64,2}
    mgcc::Array{Float64,2}
    mgnn::Array{Float64,2}
    mg::Array{Float64,2}
    Ccg::Array{Float64,2}
    Ncg::Array{Float64,2}
    Dmgcc::Array{Float64,2}
    Dmgnn::Array{Float64,2}
    Dmg::Array{Float64,2}
    DCcg::Array{Float64,2}
    DNcg::Array{Float64,2}
    Cea::Array{Float64,2}
    Nea::Array{Float64,2}
    Cta::Array{Float64,2}
    Nta::Array{Float64,2}
    tdeps::Array{Float64,2}
    tdgam::Array{Float64,2}
    Cshell::Array{Float64,2}
    Nshell::Array{Float64,2}
    Atshell::Array{Float64,2}
    radius::Array{Float64,2}
    Cdf::Array{Float64,2}
    Cdp::Array{Float64,2}
    chord::Array{Float64,2}
    Xax::Array{Float64,2}
    alpha::Array{Float64,2}
    Cm::Array{Float64,2}
    CLmax::Array{Float64,2}
    CLmin::Array{Float64,2}
    dCLda::Array{Float64,2}
    dCLdF1::Array{Float64,2}
    dCLdF2::Array{Float64,2}
    dCLdF3::Array{Float64,2}
    dCLdF4::Array{Float64,2}
    dCLdF5::Array{Float64,2}
    dCLdF6::Array{Float64,2}
    dCLdF7::Array{Float64,2}
    dCLdF8::Array{Float64,2}
    dCLdF9::Array{Float64,2}
    dCLdF10::Array{Float64,2}
    dCLdF11::Array{Float64,2}
    dCLdF12::Array{Float64,2}
    dCLdF13::Array{Float64,2}
    dCLdF14::Array{Float64,2}
    dCLdF15::Array{Float64,2}
    dCLdF16::Array{Float64,2}
    dCLdF17::Array{Float64,2}
    dCLdF18::Array{Float64,2}
    dCLdF19::Array{Float64,2}
    dCLdF20::Array{Float64,2}
    dCMdF1::Array{Float64,2}
    dCMdF2::Array{Float64,2}
    dCMdF3::Array{Float64,2}
    dCMdF4::Array{Float64,2}
    dCMdF5::Array{Float64,2}
    dCMdF6::Array{Float64,2}
    dCMdF7::Array{Float64,2}
    dCMdF8::Array{Float64,2}
    dCMdF9::Array{Float64,2}
    dCMdF10::Array{Float64,2}
    dCMdF11::Array{Float64,2}
    dCMdF12::Array{Float64,2}
    dCMdF13::Array{Float64,2}
    dCMdF14::Array{Float64,2}
    dCMdF15::Array{Float64,2}
    dCMdF16::Array{Float64,2}
    dCMdF17::Array{Float64,2}
    dCMdF18::Array{Float64,2}
    dCMdF19::Array{Float64,2}
    dCMdF20::Array{Float64,2}
    dCDdF1::Array{Float64,2}
    dCDdF2::Array{Float64,2}
    dCDdF3::Array{Float64,2}
    dCDdF4::Array{Float64,2}
    dCDdF5::Array{Float64,2}
    dCDdF6::Array{Float64,2}
    dCDdF7::Array{Float64,2}
    dCDdF8::Array{Float64,2}
    dCDdF9::Array{Float64,2}
    dCDdF10::Array{Float64,2}
    dCDdF11::Array{Float64,2}
    dCDdF12::Array{Float64,2}
    dCDdF13::Array{Float64,2}
    dCDdF14::Array{Float64,2}
    dCDdF15::Array{Float64,2}
    dCDdF16::Array{Float64,2}
    dCDdF17::Array{Float64,2}
    dCDdF18::Array{Float64,2}
    dCDdF19::Array{Float64,2}
    dCDdF20::Array{Float64,2}
end

function aswbeamspanwise(;
    x::AbstractArray{<:Real,2} = Array{Float64}(undef, 0, 2),
    y::AbstractArray{<:Real,2} = Array{Float64}(undef, 0, 2),
    z::AbstractArray{<:Real,2} = Array{Float64}(undef, 0, 2),
    twist::AbstractArray{<:Real,2} = Array{Float64}(undef, 0, 2),
    EIcc::AbstractArray{<:Real,2} = Array{Float64}(undef, 0, 2),
    EIcn::AbstractArray{<:Real,2} = Array{Float64}(undef, 0, 2),
    EInn::AbstractArray{<:Real,2} = Array{Float64}(undef, 0, 2),
    EIcs::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    EIsn::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    GJ::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    EA::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    GKc::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    GKn::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    mgcc::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    mgnn::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    mg::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Ccg::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Ncg::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Dmgcc::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Dmgnn::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Dmg::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    DCcg::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    DNcg::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Cea::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Nea::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Cta::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Nta::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    tdeps::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    tdgam::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Cshell::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Nshell::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Atshell::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    radius::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Cdf::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Cdp::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    chord::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Xax::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    alpha::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    Cm::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    CLmax::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    CLmin::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLda::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF::AbstractArray{<:AbstractArray{<:Real,2},1}=Array{Array{Float64,2},1}(undef, 20),
    dCMdF::AbstractArray{<:AbstractArray{<:Real,2},1}=Array{Array{Float64,2},1}(undef, 20),
    dCDdF::AbstractArray{<:AbstractArray{<:Real,2},1}=Array{Array{Float64,2},1}(undef, 20),
    dCLdF1::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF2::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF3::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF4::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF5::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF6::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF7::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF8::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF9::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF10::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF11::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF12::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF13::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF14::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF15::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF16::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF17::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF18::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF19::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCLdF20::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF1::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF2::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF3::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF4::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF5::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF6::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF7::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF8::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF9::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF10::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF11::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF12::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF13::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF14::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF15::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF16::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF17::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF18::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF19::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCMdF20::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF1::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF2::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF3::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF4::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF5::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF6::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF7::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF8::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF9::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF10::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF11::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF12::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF13::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF14::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF15::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF16::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF17::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF18::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF19::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2),
    dCDdF20::AbstractArray{<:Real,2}=Array{Float64}(undef, 0, 2))

    dCLdF1 = isempty(dCLdF1) && isassigned(dCLdF, 1) ? dCLdF[1] : dCLdF1
    dCLdF2 = isempty(dCLdF2) && isassigned(dCLdF, 2) ? dCLdF[2] : dCLdF2
    dCLdF3 = isempty(dCLdF3) && isassigned(dCLdF, 3) ? dCLdF[3] : dCLdF3
    dCLdF4 = isempty(dCLdF4) && isassigned(dCLdF, 4) ? dCLdF[4] : dCLdF4
    dCLdF5 = isempty(dCLdF5) && isassigned(dCLdF, 5) ? dCLdF[5] : dCLdF5
    dCLdF6 = isempty(dCLdF6) && isassigned(dCLdF, 6) ? dCLdF[6] : dCLdF6
    dCLdF7 = isempty(dCLdF7) && isassigned(dCLdF, 7) ? dCLdF[7] : dCLdF7
    dCLdF8 = isempty(dCLdF8) && isassigned(dCLdF, 8) ? dCLdF[8] : dCLdF8
    dCLdF9 = isempty(dCLdF9) && isassigned(dCLdF, 9) ? dCLdF[9] : dCLdF9
    dCLdF10 = isempty(dCLdF10) && isassigned(dCLdF, 10) ? dCLdF[10] : dCLdF10
    dCLdF11 = isempty(dCLdF11) && isassigned(dCLdF, 11) ? dCLdF[11] : dCLdF11
    dCLdF12 = isempty(dCLdF12) && isassigned(dCLdF, 12) ? dCLdF[12] : dCLdF12
    dCLdF13 = isempty(dCLdF13) && isassigned(dCLdF, 13) ? dCLdF[13] : dCLdF13
    dCLdF14 = isempty(dCLdF14) && isassigned(dCLdF, 14) ? dCLdF[14] : dCLdF14
    dCLdF15 = isempty(dCLdF15) && isassigned(dCLdF, 15) ? dCLdF[15] : dCLdF15
    dCLdF16 = isempty(dCLdF16) && isassigned(dCLdF, 16) ? dCLdF[16] : dCLdF16
    dCLdF17 = isempty(dCLdF17) && isassigned(dCLdF, 17) ? dCLdF[17] : dCLdF17
    dCLdF18 = isempty(dCLdF18) && isassigned(dCLdF, 18) ? dCLdF[18] : dCLdF18
    dCLdF19 = isempty(dCLdF19) && isassigned(dCLdF, 19) ? dCLdF[19] : dCLdF19
    dCLdF20 = isempty(dCLdF20) && isassigned(dCLdF, 20) ? dCLdF[20] : dCLdF20

    dCMdF1 = isempty(dCMdF1) && isassigned(dCMdF, 1) ? dCMdF[1] : dCMdF1
    dCMdF2 = isempty(dCMdF2) && isassigned(dCMdF, 2) ? dCMdF[2] : dCMdF2
    dCMdF3 = isempty(dCMdF3) && isassigned(dCMdF, 3) ? dCMdF[3] : dCMdF3
    dCMdF4 = isempty(dCMdF4) && isassigned(dCMdF, 4) ? dCMdF[4] : dCMdF4
    dCMdF5 = isempty(dCMdF5) && isassigned(dCMdF, 5) ? dCMdF[5] : dCMdF5
    dCMdF6 = isempty(dCMdF6) && isassigned(dCMdF, 6) ? dCMdF[6] : dCMdF6
    dCMdF7 = isempty(dCMdF7) && isassigned(dCMdF, 7) ? dCMdF[7] : dCMdF7
    dCMdF8 = isempty(dCMdF8) && isassigned(dCMdF, 8) ? dCMdF[8] : dCMdF8
    dCMdF9 = isempty(dCMdF9) && isassigned(dCMdF, 9) ? dCMdF[9] : dCMdF9
    dCMdF10 = isempty(dCMdF10) && isassigned(dCMdF, 10) ? dCMdF[10] : dCMdF10
    dCMdF11 = isempty(dCMdF11) && isassigned(dCMdF, 11) ? dCMdF[11] : dCMdF11
    dCMdF12 = isempty(dCMdF12) && isassigned(dCMdF, 12) ? dCMdF[12] : dCMdF12
    dCMdF13 = isempty(dCMdF13) && isassigned(dCMdF, 13) ? dCMdF[13] : dCMdF13
    dCMdF14 = isempty(dCMdF14) && isassigned(dCMdF, 14) ? dCMdF[14] : dCMdF14
    dCMdF15 = isempty(dCMdF15) && isassigned(dCMdF, 15) ? dCMdF[15] : dCMdF15
    dCMdF16 = isempty(dCMdF16) && isassigned(dCMdF, 16) ? dCMdF[16] : dCMdF16
    dCMdF17 = isempty(dCMdF17) && isassigned(dCMdF, 17) ? dCMdF[17] : dCMdF17
    dCMdF18 = isempty(dCMdF18) && isassigned(dCMdF, 18) ? dCMdF[18] : dCMdF18
    dCMdF19 = isempty(dCMdF19) && isassigned(dCMdF, 19) ? dCMdF[19] : dCMdF19
    dCMdF20 = isempty(dCMdF20) && isassigned(dCMdF, 20) ? dCMdF[20] : dCMdF20

    dCDdF1 = isempty(dCDdF1) && isassigned(dCDdF, 1) ? dCDdF[1] : dCDdF1
    dCDdF2 = isempty(dCDdF2) && isassigned(dCDdF, 2) ? dCDdF[2] : dCDdF2
    dCDdF3 = isempty(dCDdF3) && isassigned(dCDdF, 3) ? dCDdF[3] : dCDdF3
    dCDdF4 = isempty(dCDdF4) && isassigned(dCDdF, 4) ? dCDdF[4] : dCDdF4
    dCDdF5 = isempty(dCDdF5) && isassigned(dCDdF, 5) ? dCDdF[5] : dCDdF5
    dCDdF6 = isempty(dCDdF6) && isassigned(dCDdF, 6) ? dCDdF[6] : dCDdF6
    dCDdF7 = isempty(dCDdF7) && isassigned(dCDdF, 7) ? dCDdF[7] : dCDdF7
    dCDdF8 = isempty(dCDdF8) && isassigned(dCDdF, 8) ? dCDdF[8] : dCDdF8
    dCDdF9 = isempty(dCDdF9) && isassigned(dCDdF, 9) ? dCDdF[9] : dCDdF9
    dCDdF10 = isempty(dCDdF10) && isassigned(dCDdF, 10) ? dCDdF[10] : dCDdF10
    dCDdF11 = isempty(dCDdF11) && isassigned(dCDdF, 11) ? dCDdF[11] : dCDdF11
    dCDdF12 = isempty(dCDdF12) && isassigned(dCDdF, 12) ? dCDdF[12] : dCDdF12
    dCDdF13 = isempty(dCDdF13) && isassigned(dCDdF, 13) ? dCDdF[13] : dCDdF13
    dCDdF14 = isempty(dCDdF14) && isassigned(dCDdF, 14) ? dCDdF[14] : dCDdF14
    dCDdF15 = isempty(dCDdF15) && isassigned(dCDdF, 15) ? dCDdF[15] : dCDdF15
    dCDdF16 = isempty(dCDdF16) && isassigned(dCDdF, 16) ? dCDdF[16] : dCDdF16
    dCDdF17 = isempty(dCDdF17) && isassigned(dCDdF, 17) ? dCDdF[17] : dCDdF17
    dCDdF18 = isempty(dCDdF18) && isassigned(dCDdF, 18) ? dCDdF[18] : dCDdF18
    dCDdF19 = isempty(dCDdF19) && isassigned(dCDdF, 19) ? dCDdF[19] : dCDdF19
    dCDdF20 = isempty(dCDdF20) && isassigned(dCDdF, 20) ? dCDdF[20] : dCDdF20

    aswbeamspanwise(x, y, z, twist, EIcc, EInn, EIcn, EIcs, EIsn, GJ, EA, GKc,
        GKn, mgcc, mgnn, mg, Ccg, Ncg, Dmgcc, Dmgnn, Dmg, DCcg, DNcg, Cea, Nea,
        Cta, Nta, tdeps, tdgam, Cshell, Nshell, Atshell, radius, Cdf, Cdp,
        chord, Xax, alpha, Cm, CLmax, CLmin, dCLda, dCLdF1, dCLdF2, dCLdF3,
        dCLdF4, dCLdF5, dCLdF6, dCLdF7, dCLdF8, dCLdF9, dCLdF10, dCLdF11,
        dCLdF12, dCLdF13, dCLdF14, dCLdF15, dCLdF16, dCLdF17, dCLdF18, dCLdF19,
        dCLdF20, dCMdF1, dCMdF2, dCMdF3, dCMdF4, dCMdF5, dCMdF6, dCMdF7, dCMdF8,
        dCMdF9, dCMdF10, dCMdF11, dCMdF12, dCMdF13, dCMdF14, dCMdF15, dCMdF16,
        dCMdF17, dCMdF18, dCMdF19, dCMdF20, dCDdF1, dCDdF2, dCDdF3, dCDdF4,
        dCDdF5, dCDdF6, dCDdF7, dCDdF8, dCDdF9, dCDdF10, dCDdF11, dCDdF12,
        dCDdF13, dCDdF14, dCDdF15, dCDdF16, dCDdF17, dCDdF18, dCDdF19, dCDdF20)
end

"""
    aswbeam(;number::Integer = 0, physical_index::Integer = 0, name::String = "",
        spanwise_variables::aswbeamspanwise = aswbeamspanwise())

    Returns struct defining a beam as defined in .asw file
"""
struct aswbeam
    number::Int32
    physical_index::Int32
    name::String
    spanwise_variables::aswbeamspanwise
end
function aswbeam(;number::Integer = 0, physical_index::Integer = 0,
    name::String = "", spanwise_variables::aswbeamspanwise = aswbeamspanwise())

    aswbeam(number, physical_index, name, spanwise_variables)
end

"""
    aswbeam(;number::Integer = 0, physical_index::Integer = 0, name::String = "",
        spanwise_variables::aswbeamspanwise = aswbeamspanwise())

    Returns struct containing contents of .asw file
"""
struct aswgeominput
    namein::String #Geometry Name
    si_units::Bool #SI Units
    constants::aswconsts
    refvals::aswrefs
    weights::Array{aswweight,1}
    sensors::Array{aswsensor,1}
    engines::Array{aswengine,1}
    struts::Array{aswstrut,1}
    joints::Array{aswjoint,1}
    jangles::Array{aswjangle,1}
    grounds::Array{aswground,1}
    beams::Array{aswbeam,1}
end
function aswgeominput(;
    namein::String = "Aircraft",
    si_units::Bool = true,
    constants::aswconsts = aswconsts(),
    refvals::aswrefs = aswrefs(),
    weights::AbstractArray{aswweight,1} = Array{aswweight,1}(undef, 0),
    sensors::AbstractArray{aswsensor,1} = Array{aswsensor,1}(undef, 0),
    engines::AbstractArray{aswengine,1} = Array{aswengine,1}(undef, 0),
    struts::AbstractArray{aswstrut,1} = Array{aswstrut,1}(undef, 0),
    joints::AbstractArray{aswjoint,1} = Array{aswjoint,1}(undef, 0),
    jangles::AbstractArray{aswjangle,1} = Array{aswjangle,1}(undef, 0),
    grounds::AbstractArray{aswground,1} = Array{aswground,1}(undef, 0),
    beams::AbstractArray{aswbeam,1} = Array{aswbeam,1}(undef, 0))
    aswgeominput(namein, si_units, constants, refvals, weights, sensors,
        engines, struts, joints, jangles, grounds, beams)
end
