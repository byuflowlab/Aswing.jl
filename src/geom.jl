# defines geometry used in ASWING

# Dictionary of pointers to beam values
beamvarval = Dict{String,Int}(strip(VARS[i])=>i for i = 1:JBTOT)

"""
    Constants(;
        sea_level_air_density::Real = 1.225,
        sea_level_speed_of_sound::Real = 340.2778,
        gravity::Real = 9.81)

    Returns struct containing constants as defined in .asw file
"""
struct Constants{R<:Real}
    sea_level_air_density::R
    sea_level_speed_of_sound::R
    gravity::R
end

function Constants(;
    sea_level_air_density::Real = 1.225,
    sea_level_speed_of_sound::Real = 340.2778,
    gravity::Real = 9.81)

    Constants{Float64}(sea_level_air_density, sea_level_speed_of_sound, gravity)
end

function (::Type{Constants{R}})(;
    sea_level_air_density::Real = 1.225,
    sea_level_speed_of_sound::Real = 340.2778,
    gravity::Real = 9.81) where R<:Real

    Constants{R}(sea_level_air_density, sea_level_speed_of_sound, gravity)
end

"""
    ReferenceValues(;area::Real = 1.0, chord::Real = 1.0, span::Real = 1.0,
        momref::AbstractArray{<:Real,1} = zeros(R,3),
        velref::AbstractArray{<:Real,1} = zeros(R,3),
        accelref::AbstractArray{<:Real,1} = zeros(R,3))

    Returns struct containing reference values as defined in .asw file
"""
struct ReferenceValues{R<:Real}
    area::R
    chord::R
    span::R
    moments::Array{R,1}
    velocities::Array{R,1}
    accelerations::Array{R,1}
    function (::Type{ReferenceValues{R}})(area::Real, chord::Real, span::Real,
        momref::AbstractArray{<:Real,1}, velref::AbstractArray{<:Real,1},
        accelref::AbstractArray{<:Real,1}) where R<:Real

        if (length(momref) != 3) || (length(velref) != 3) || (length(accelref) != 3)
            error("Array inputs must be of length 3")
        end

        new{R}(area, chord, span, momref, velref, accelref)
    end
end

function ReferenceValues(area::Real, chord::Real, span::Real,
    momref::AbstractArray{<:Real,1}, velref::AbstractArray{<:Real,1},
    accelref::AbstractArray{<:Real,1})

    ReferenceValues{Float64}(area, chord, span, momref, velref, accelref)
end

function ReferenceValues(; area::Real = 1.0, chord::Real = 1.0, span::Real = 1.0,
    momref::AbstractArray{<:Real,1} = zeros(Float64,3),
    velref::AbstractArray{<:Real,1} = zeros(Float64,3),
    accelref::AbstractArray{<:Real,1} = zeros(Float64,3))

    ReferenceValues{Float64}(area, chord, span, momref, velref, accelref)
end

function (::Type{ReferenceValues{R}})(; area::Real = 1.0, chord::Real = 1.0, span::Real = 1.0,
    momref::AbstractArray{<:Real,1} = zeros(R,3),
    velref::AbstractArray{<:Real,1} = zeros(R,3),
    accelref::AbstractArray{<:Real,1} = zeros(R,3)) where R<:Real

    ReferenceValues{R}(area, chord, span, momref, velref, accelref)
end

"""
    Weight(;Nbeam::Integer=0, t::Real=0.0,
        location::AbstractArray{<:Real,1}=zeros(R,3), weight::Real=0.0,
        CDA::Real=0.0, vol::Real=0.0, Ho::AbstractArray{<:Real,1}=zeros(R,3),
        Ixx::Real=0, Iyy::Real=0, Izz::Real=0, Ixy::Real=0, Ixz::Real=0, Iyz::Real=0)

    Returns struct defining a single point mass as defined in .asw file
"""
struct Weight{R<:Real}
    Nbeam::Int
    t::R
    location::Array{R,1}
    weight::R
    CDA::R
    vol::R
    Ho::Array{R,1}
    Ixx::R
    Iyy::R
    Izz::R
    Ixy::R
    Ixz::R
    Iyz::R
    function (::Type{Weight{R}})(Nbeam::Integer, t::Real=0.0,
        location::AbstractArray{<:Real,1}=zeros(R,3), weight::Real=0.0,
        CDA::Real=0.0, vol::Real=0.0, Ho::AbstractArray{<:Real,1}=zeros(R,3),
        Ixx::Real=0, Iyy::Real=0, Izz::Real=0,
        Ixy::Real=0, Ixz::Real=0, Iyz::Real=0) where R<:Real

        if (length(location) != 3) || (length(Ho) != 3)
            error("Array inputs must be of length 3")
        end

        new{R}(Nbeam,t,location,weight,CDA,vol,Ho,Ixx,Iyy,Izz,Ixy,Ixz,Iyz)
    end
end

function Weight(Nbeam::Integer, t::Real,
    location::AbstractArray{<:Real,1}, weight::Real,
    CDA::Real, vol::Real, Ho::AbstractArray{<:Real,1},
    Ixx::Real, Iyy::Real, Izz::Real, Ixy::Real, Ixz::Real, Iyz::Real)

    Weight{Float64}(Nbeam, t, location, weight, CDA, vol, Ho, Ixx, Iyy, Izz,
        Ixy, Ixz, Iyz)
end

function Weight(;Nbeam::Integer=0, t::Real=0.0,
    location::AbstractArray{<:Real,1}=zeros(Float64,3), weight::Real=0.0,
    CDA::Real=0.0, vol::Real=0.0, Ho::AbstractArray{<:Real,1}=zeros(Float64,3),
    Ixx::Real=0, Iyy::Real=0, Izz::Real=0, Ixy::Real=0, Ixz::Real=0, Iyz::Real=0)

    Weight{Float64}(Nbeam, t, location, weight, CDA, vol, Ho, Ixx, Iyy, Izz,
        Ixy, Ixz, Iyz)
end

function (::Type{Weight{R}})(;Nbeam::Integer=0, t::Real=0.0,
    location::AbstractArray{<:Real,1}=zeros(R,3), weight::Real=0.0,
    CDA::Real=0.0, vol::Real=0.0, Ho::AbstractArray{<:Real,1}=zeros(R,3),
    Ixx::Real=0, Iyy::Real=0, Izz::Real=0, Ixy::Real=0, Ixz::Real=0, Iyz::Real=0) where R<:Real

    Weight{R}(Nbeam, t, location, weight, CDA, vol, Ho, Ixx, Iyy, Izz,
        Ixy, Ixz, Iyz)
end

"""
    Sensor(;Ksens::Integer = 0, Nbeam::Integer = 0, t::Real=0.0,
        location::AbstractArray{<:Real,1} = zeros(R,3),
        V::AbstractArray{<:Real,1} = zeros(R,3),
        A::AbstractArray{<:Real,1} = zeros(R,3))

    Returns struct defining a single sensor as defined in .asw file
"""
struct Sensor{R<:Real}
    Ksens::Int
    Nbeam::Int
    t::R
    location::Array{R,1}
    V::Array{R,1}
    A::Array{R,1}
    function (::Type{Sensor{R}})(Ksens::Integer, Nbeam::Integer, t::Real=0.0,
        location::AbstractArray{<:Real,1} = zeros(R,3),
        V::AbstractArray{<:Real,1} = zeros(R,3),
        A::AbstractArray{<:Real,1} = zeros(R,3)) where R<:Real

        if (length(location) != 3) || (length(V) != 3) || (length(A) != 3)
            error("Array inputs must be of length 3")
        end

        new{R}(Ksens, Nbeam, t, location, V, A)
    end
end

function Sensor(Ksens::Integer, Nbeam::Integer, t::Real=0.0,
    location::AbstractArray{<:Real,1} = zeros(Float64,3),
    V::AbstractArray{<:Real,1} = zeros(Float64,3),
    A::AbstractArray{<:Real,1} = zeros(Float64,3))

    if (length(location) != 3) || (length(V) != 3) || (length(A) != 3)
        error("Array inputs must be of length 3")
    end

    Sensor{Float64}(Ksens, Nbeam, t, location, V, A)
end

function Sensor(;Ksens::Integer = 0, Nbeam::Integer = 0, t::Real=0.0,
    location::AbstractArray{<:Real,1} = zeros(Float64, 3),
    V::AbstractArray{<:Real,1} = zeros(Float64, 3),
    A::AbstractArray{<:Real,1} = zeros(Float64, 3))

    Sensor{Float64}(Ksens, Nbeam, t, location, V, A)
end

function (::Type{Sensor{R}})(;Ksens::Integer = 0, Nbeam::Integer = 0, t::Real=0.0,
    location::AbstractArray{<:Real,1} = zeros(R, 3),
    V::AbstractArray{<:Real,1} = zeros(R, 3),
    A::AbstractArray{<:Real,1} = zeros(R, 3)) where R<:Real

    Sensor{R}(Ksens, Nbeam, t, location, V, A)
end

"""
    Engine(;Keng::Integer=0, IEtyp::Integer=0, Nbeam::Integer=0,
        t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(R,3),
        thrust_direction::AbstractArray{<:Real,1}=zeros(R,3), dFdPe::Real=0.0,
        dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0, cdA::Real=0.0,
        cl::Real=0.0, CLa::Real=0.0, S0::Real=0.0, C0::Real=0.0, S1::Real=0.0,
        C1::Real=0.0, S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0)

    Returns struct defining a single engine as defined in .asw file
"""
struct Engine{R<:Real}
    Keng::Int
    IEtyp::Int
    Nbeam::Int
    t::R
    location::Array{R,1}
    thrust_direction::Array{R,1}
    dFdPe::R
    dMdPe::R
    Rdisk::R
    Omega::R
    cdA::R
    cl::R
    CLa::R
    S0::R
    C0::R
    S1::R
    C1::R
    S2::R
    C2::R
    S3::R
    C3::R
    function (::Type{Engine{R}})(Keng::Integer, IEtyp::Integer, Nbeam::Integer,
        t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(R,3),
        thrust_direction::AbstractArray{<:Real,1}=zeros(R, 3),
        dFdPe::Real=0.0, dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0,
        cdA::Real=0.0, cl::Real=0.0, CLa::Real=0.0,
        S0::Real=0.0, C0::Real=0.0, S1::Real=0.0, C1::Real=0.0,
        S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0) where R<:Real

        if (length(location) != 3) || (length(thrust_direction) != 3)
            error("Array inputs must be of length 3")
        end

        new{R}(Keng, IEtyp, Nbeam, t, location, thrust_direction, dFdPe, dMdPe,
            Rdisk, Omega, cdA, cl, CLa, S0, C0, S1, C1, S2, C2, S3, C3)
    end
end

function Engine(Keng::Integer, IEtyp::Integer, Nbeam::Integer,
    t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(Float64,3),
    thrust_direction::AbstractArray{<:Real,1}=zeros(Float64, 3),
    dFdPe::Real=0.0, dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0,
    cdA::Real=0.0, cl::Real=0.0, CLa::Real=0.0,
    S0::Real=0.0, C0::Real=0.0, S1::Real=0.0, C1::Real=0.0,
    S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0)

    if (length(location) != 3) || (length(thrust_direction) != 3)
        error("Array inputs must be of length 3")
    end

    Engine{Float64}(Keng, IEtyp, Nbeam, t, location, thrust_direction, dFdPe, dMdPe,
        Rdisk, Omega, cdA, cl, CLa, S0, C0, S1, C1, S2, C2, S3, C3)
end

function Engine(;Keng::Integer=0, IEtyp::Integer=0, Nbeam::Integer=0,
    t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(Float64,3),
    thrust_direction::AbstractArray{<:Real,1}=zeros(Float64,3), dFdPe::Real=0.0,
    dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0, cdA::Real=0.0,
    cl::Real=0.0, CLa::Real=0.0, S0::Real=0.0, C0::Real=0.0, S1::Real=0.0,
    C1::Real=0.0, S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0)

    Engine{Float64}(Keng, IEtyp, Nbeam, t, location, thrust_direction, dFdPe, dMdPe,
        Rdisk, Omega, cdA, cl, CLa, S0, C0, S1, C1, S2, C2, S3, C3)
end

function (::Type{Engine{R}})(;Keng::Integer=0, IEtyp::Integer=0, Nbeam::Integer=0,
    t::Real=0.0, location::AbstractArray{<:Real,1}=zeros(R,3),
    thrust_direction::AbstractArray{<:Real,1}=zeros(R,3), dFdPe::Real=0.0,
    dMdPe::Real=0.0, Rdisk::Real=0.0, Omega::Real=0.0, cdA::Real=0.0,
    cl::Real=0.0, CLa::Real=0.0, S0::Real=0.0, C0::Real=0.0, S1::Real=0.0,
    C1::Real=0.0, S2::Real=0.0, C2::Real=0.0, S3::Real=0.0, C3::Real=0.0) where R<:Real

    Engine{R}(Keng, IEtyp, Nbeam, t, location, thrust_direction, dFdPe, dMdPe,
        Rdisk, Omega, cdA, cl, CLa, S0, C0, S1, C1, S2, C2, S3, C3)
end

"""
    Strut(;Nbeam::Integer=0, t::Real=0.0,
        location::AbstractArray{<:Real,1}=zeros(R,3),
        anchor_location::AbstractArray{<:Real,1}=zeros(R,3), dLo::Real=0.0,
        EAw::Real=0.0)

    Returns struct defining a single strut as defined in .asw file
"""
struct Strut{R<:Real}
    Nbeam::Int
    t::R
    location::Array{R,1}
    anchor_location::Array{R,1}
    dLo::R
    EAw::R
    function (::Type{Strut{R}})(Nbeam::Integer, t::Real=0.0,
        location::AbstractArray{<:Real,1}=zeros(R,3),
        anchor_location::AbstractArray{<:Real,1}=zeros(R,3),
        dLo::Real=0.0, EAw::Real=0.0) where R<:Real

        if (length(location) != 3) || (length(anchor_location) != 3)
            error("Array inputs must be of length 3")
        end

        new{R}(Nbeam, t, location, anchor_location, dLo, EAw)
    end
end

function Strut(;Nbeam::Integer=0, t::Real=0.0,
    location::AbstractArray{<:Real,1}=zeros(Float64, 3),
    anchor_location::AbstractArray{<:Real,1}=zeros(Float64, 3), dLo::Real=0.0,
    EAw::Real=0.0)

    Strut{Float64}(Nbeam, t, location, anchor_location, dLo, EAw)
end

function (::Type{Strut{R}})(;Nbeam::Integer=0, t::Real=0.0,
    location::AbstractArray{<:Real,1}=zeros(R, 3),
    anchor_location::AbstractArray{<:Real,1}=zeros(R, 3), dLo::Real=0.0,
    EAw::Real=0.0) where R<:Real

    Strut{R}(Nbeam, t, location, anchor_location, dLo, EAw)
end

"""
    Joint(;Nbeam1::Integer=0, Nbeam2::Integer=0, t1::Real=0.0,
        t2::Real=0.0, KJtype::Integer=0)

    Returns struct defining a single joint as defined in .asw file
"""
struct Joint{R<:Real}
    Nbeam1::Int
    Nbeam2::Int
    t1::R
    t2::R
    KJtype::Int
end

function Joint(;Nbeam1::Integer=0, Nbeam2::Integer=0, t1::Real=0.0,
    t2::Real=0.0, KJtype::Integer=0)

    Joint{Float64}(Nbeam1,Nbeam2,t1,t2,KJtype)
end

function (::Type{Joint{R}})(;Nbeam1::Integer=0, Nbeam2::Integer=0, t1::Real=0.0,
    t2::Real=0.0, KJtype::Integer=0) where R<:Real

    Joint{R}(Nbeam1,Nbeam2,t1,t2,KJtype)
end

"""
    Jangle(;Njoint::Integer=0,
        hinge_axis::AbstractArray{<:Real,1} = zeros(R, 3),
        hinge_moment::AbstractArray{<:Real,1} = zeros(1),
        hinge_angle::AbstractArray{<:Real,1} = zeros(1))

    Returns struct defining a single jangle as defined in .asw file
"""
struct Jangle{R<:Real}
    Njoint::Int
    hinge_axis::Array{R,1}
    hinge_moment::Array{R,1}
    hinge_angle::Array{R,1}
    function (::Type{Jangle{R}})(Njoint::Integer, hinge_axis::AbstractArray{<:Real,1},
        hinge_moment::AbstractArray{<:Real,1}, hinge_angle::AbstractArray{<:Real,1}) where R<:Real

        if length(hinge_moment) != length(hinge_angle)
            error("hinge moment and angle vectors must be same length")
        end

        new{R}(Njoint::Integer, hinge_axis::AbstractArray{<:Real,1},
            hinge_moment::AbstractArray{<:Real,1}, hinge_angle::AbstractArray{<:Real,1})
    end
end

function Jangle(;Njoint::Integer=0,
    hinge_axis::AbstractArray{<:Real,1} = zeros(Float64, 3),
    hinge_moment::AbstractArray{<:Real,1} = zeros(Float64, 1),
    hinge_angle::AbstractArray{<:Real,1} = zeros(Float64, 1))

    Jangle{Float64}(Njoint, hinge_axis, hinge_moment, hinge_angle)
end

function (::Type{Jangle{R}})(;Njoint::Integer=0,
    hinge_axis::AbstractArray{<:Real,1} = zeros(R, 3),
    hinge_moment::AbstractArray{<:Real,1} = zeros(R, 1),
    hinge_angle::AbstractArray{<:Real,1} = zeros(R, 1)) where R<:Real

    Jangle{R}(Njoint, hinge_axis, hinge_moment, hinge_angle)
end

"""
    Ground(;Nbeam::Integer=0, t::Real=0.0, KGtype::Integer=0)

    Returns struct defining a single ground as defined in .asw file
"""
struct Ground{R<:Real}
    Nbeam::Int
    t::R
    KGtype::Int
end

function Ground(;Nbeam::Integer=0, t::Real=0.0, KGtype::Integer=0)
    Ground{Float64}(Nbeam, t, KGtype)
end

function (::Type{Ground{R}})(;Nbeam::Integer=0, t::Real=0.0, KGtype::Integer=0) where R<:Real
    Ground{R}(Nbeam, t, KGtype)
end

"""
    SpanwiseVariables(; <keyword arguments>)

    Returns struct defining the spanwise properties of a beam as defined in
        .asw file
    The first column of each variable is the t-value
    The second column is the variable value corresponding to that t-value
"""
struct SpanwiseVariables{R<:Real}
    x::Array{R,2}
    y::Array{R,2}
    z::Array{R,2}
    twist::Array{R,2}
    EIcc::Array{R,2}
    EInn::Array{R,2}
    EIcn::Array{R,2}
    EIcs::Array{R,2}
    EIsn::Array{R,2}
    GJ::Array{R,2}
    EA::Array{R,2}
    GKc::Array{R,2}
    GKn::Array{R,2}
    mgcc::Array{R,2}
    mgnn::Array{R,2}
    mg::Array{R,2}
    Ccg::Array{R,2}
    Ncg::Array{R,2}
    Dmgcc::Array{R,2}
    Dmgnn::Array{R,2}
    Dmg::Array{R,2}
    DCcg::Array{R,2}
    DNcg::Array{R,2}
    Cea::Array{R,2}
    Nea::Array{R,2}
    Cta::Array{R,2}
    Nta::Array{R,2}
    tdeps::Array{R,2}
    tdgam::Array{R,2}
    Cshell::Array{R,2}
    Nshell::Array{R,2}
    Atshell::Array{R,2}
    radius::Array{R,2}
    Cdf::Array{R,2}
    Cdp::Array{R,2}
    chord::Array{R,2}
    Xax::Array{R,2}
    alpha::Array{R,2}
    Cm::Array{R,2}
    CLmax::Array{R,2}
    CLmin::Array{R,2}
    dCLda::Array{R,2}
    dCLdF1::Array{R,2}
    dCLdF2::Array{R,2}
    dCLdF3::Array{R,2}
    dCLdF4::Array{R,2}
    dCLdF5::Array{R,2}
    dCLdF6::Array{R,2}
    dCLdF7::Array{R,2}
    dCLdF8::Array{R,2}
    dCLdF9::Array{R,2}
    dCLdF10::Array{R,2}
    dCLdF11::Array{R,2}
    dCLdF12::Array{R,2}
    dCLdF13::Array{R,2}
    dCLdF14::Array{R,2}
    dCLdF15::Array{R,2}
    dCLdF16::Array{R,2}
    dCLdF17::Array{R,2}
    dCLdF18::Array{R,2}
    dCLdF19::Array{R,2}
    dCLdF20::Array{R,2}
    dCMdF1::Array{R,2}
    dCMdF2::Array{R,2}
    dCMdF3::Array{R,2}
    dCMdF4::Array{R,2}
    dCMdF5::Array{R,2}
    dCMdF6::Array{R,2}
    dCMdF7::Array{R,2}
    dCMdF8::Array{R,2}
    dCMdF9::Array{R,2}
    dCMdF10::Array{R,2}
    dCMdF11::Array{R,2}
    dCMdF12::Array{R,2}
    dCMdF13::Array{R,2}
    dCMdF14::Array{R,2}
    dCMdF15::Array{R,2}
    dCMdF16::Array{R,2}
    dCMdF17::Array{R,2}
    dCMdF18::Array{R,2}
    dCMdF19::Array{R,2}
    dCMdF20::Array{R,2}
    dCDdF1::Array{R,2}
    dCDdF2::Array{R,2}
    dCDdF3::Array{R,2}
    dCDdF4::Array{R,2}
    dCDdF5::Array{R,2}
    dCDdF6::Array{R,2}
    dCDdF7::Array{R,2}
    dCDdF8::Array{R,2}
    dCDdF9::Array{R,2}
    dCDdF10::Array{R,2}
    dCDdF11::Array{R,2}
    dCDdF12::Array{R,2}
    dCDdF13::Array{R,2}
    dCDdF14::Array{R,2}
    dCDdF15::Array{R,2}
    dCDdF16::Array{R,2}
    dCDdF17::Array{R,2}
    dCDdF18::Array{R,2}
    dCDdF19::Array{R,2}
    dCDdF20::Array{R,2}
end

function SpanwiseVariables(;
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

    SpanwiseVariables{Float64}(x, y, z, twist, EIcc, EInn, EIcn, EIcs, EIsn, GJ, EA, GKc,
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

function (::Type{SpanwiseVariables{R}})(;
    x::AbstractArray{<:Real,2} = Array{R}(undef, 0, 2),
    y::AbstractArray{<:Real,2} = Array{R}(undef, 0, 2),
    z::AbstractArray{<:Real,2} = Array{R}(undef, 0, 2),
    twist::AbstractArray{<:Real,2} = Array{R}(undef, 0, 2),
    EIcc::AbstractArray{<:Real,2} = Array{R}(undef, 0, 2),
    EIcn::AbstractArray{<:Real,2} = Array{R}(undef, 0, 2),
    EInn::AbstractArray{<:Real,2} = Array{R}(undef, 0, 2),
    EIcs::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    EIsn::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    GJ::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    EA::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    GKc::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    GKn::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    mgcc::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    mgnn::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    mg::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Ccg::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Ncg::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Dmgcc::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Dmgnn::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Dmg::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    DCcg::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    DNcg::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Cea::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Nea::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Cta::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Nta::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    tdeps::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    tdgam::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Cshell::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Nshell::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Atshell::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    radius::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Cdf::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Cdp::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    chord::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Xax::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    alpha::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    Cm::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    CLmax::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    CLmin::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLda::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF::AbstractArray{<:AbstractArray{<:Real,2},1}=Array{Array{R,2},1}(undef, 20),
    dCMdF::AbstractArray{<:AbstractArray{<:Real,2},1}=Array{Array{R,2},1}(undef, 20),
    dCDdF::AbstractArray{<:AbstractArray{<:Real,2},1}=Array{Array{R,2},1}(undef, 20),
    dCLdF1::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF2::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF3::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF4::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF5::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF6::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF7::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF8::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF9::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF10::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF11::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF12::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF13::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF14::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF15::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF16::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF17::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF18::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF19::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCLdF20::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF1::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF2::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF3::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF4::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF5::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF6::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF7::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF8::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF9::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF10::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF11::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF12::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF13::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF14::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF15::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF16::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF17::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF18::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF19::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCMdF20::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF1::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF2::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF3::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF4::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF5::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF6::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF7::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF8::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF9::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF10::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF11::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF12::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF13::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF14::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF15::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF16::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF17::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF18::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF19::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2),
    dCDdF20::AbstractArray{<:Real,2}=Array{R}(undef, 0, 2)) where R<:Real

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

    SpanwiseVariables{R}(x, y, z, twist, EIcc, EInn, EIcn, EIcs, EIsn, GJ, EA, GKc,
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
    Beam(;number::Integer = 0, physical_index::Integer = 0, name::String = "",
        spanwise_variables::SpanwiseVariables = SpanwiseVariables())

    Returns struct defining a beam as defined in .asw file
"""
struct Beam{R<:Real}
    number::Int
    physical_index::Int
    name::String
    spanwise_variables::SpanwiseVariables{R}
end

function Beam(number::Integer, physical_index::Integer,
    name::AbstractString, spanwise_variables::SpanwiseVariables)

    Beam{Float64}(number, physical_index, name, spanwise_variables)
end

function Beam(;number::Integer = 0, physical_index::Integer = 0,
    name::AbstractString = "", spanwise_variables::SpanwiseVariables = SpanwiseVariables{Float64}())

    Beam{Float64}(number, physical_index, name, spanwise_variables)
end

function (::Type{Beam{R}})(;number::Integer = 0, physical_index::Integer = 0,
    name::AbstractString = "", spanwise_variables::SpanwiseVariables = SpanwiseVariables{R}()) where R<:Real

    Beam{R}(number, physical_index, name, spanwise_variables)
end

"""
    Configuration

    Returns struct containing contents of .asw configuration file
"""
struct Configuration{R<:Real}
    namein::String
    si_units::Bool
    constants::Constants{R}
    refvals::ReferenceValues{R}
    weights::Array{Weight{R},1}
    sensors::Array{Sensor{R},1}
    engines::Array{Engine{R},1}
    struts::Array{Strut{R},1}
    joints::Array{Joint{R},1}
    jangles::Array{Jangle{R},1}
    grounds::Array{Ground{R},1}
    beams::Array{Beam{R},1}
end

function Configuration(
    namein::AbstractString,
    si_units::Bool,
    constants::Constants,
    refvals::ReferenceValues,
    weights::AbstractArray{<:Weight,1},
    sensors::AbstractArray{<:Sensor,1},
    engines::AbstractArray{<:Engine,1},
    struts::AbstractArray{<:Strut,1},
    joints::AbstractArray{<:Joint,1},
    jangles::AbstractArray{<:Jangle,1},
    grounds::AbstractArray{<:Ground,1},
    beams::AbstractArray{<:Beam,1})

    Configuration{Float64}(namein, si_units, constants, refvals, weights, sensors,
        engines, struts, joints, jangles, grounds, beams)
end

function Configuration(;
    namein::AbstractString = "Aircraft",
    si_units::Bool = true,
    constants::Constants = Constants{Float64}(),
    refvals::ReferenceValues = ReferenceValues{Float64}(),
    weights::AbstractArray{<:Weight,1} = Array{Weight{Float64},1}(undef, 0),
    sensors::AbstractArray{<:Sensor,1} = Array{Sensor{Float64},1}(undef, 0),
    engines::AbstractArray{<:Engine,1} = Array{Engine{Float64},1}(undef, 0),
    struts::AbstractArray{<:Strut,1} = Array{Strut{Float64},1}(undef, 0),
    joints::AbstractArray{<:Joint,1} = Array{Joint{Float64},1}(undef, 0),
    jangles::AbstractArray{<:Jangle,1} = Array{Jangle{Float64},1}(undef, 0),
    grounds::AbstractArray{<:Ground,1} = Array{Ground{Float64},1}(undef, 0),
    beams::AbstractArray{<:Beam,1} = Array{Beam{Float64},1}(undef, 0))

    Configuration{Float64}(namein, si_units, constants, refvals, weights, sensors,
        engines, struts, joints, jangles, grounds, beams)
end

function (::Type{Configuration{R}})(;
    namein::AbstractString = "Aircraft",
    si_units::Bool = true,
    constants::Constants = Constants{R}(),
    refvals::ReferenceValues = ReferenceValues{R}(),
    weights::AbstractArray{<:Weight,1} = Array{Weight{R},1}(undef, 0),
    sensors::AbstractArray{<:Sensor,1} = Array{Sensor{R},1}(undef, 0),
    engines::AbstractArray{<:Engine,1} = Array{Engine{R},1}(undef, 0),
    struts::AbstractArray{<:Strut,1} = Array{Strut{R},1}(undef, 0),
    joints::AbstractArray{<:Joint,1} = Array{Joint{R},1}(undef, 0),
    jangles::AbstractArray{<:Jangle,1} = Array{Jangle{R},1}(undef, 0),
    grounds::AbstractArray{<:Ground,1} = Array{Ground{R},1}(undef, 0),
    beams::AbstractArray{<:Beam,1} = Array{Beam{R},1}(undef, 0)) where R<:Real

    Configuration{R}(namein, si_units, constants, refvals, weights, sensors,
        engines, struts, joints, jangles, grounds, beams)
end
