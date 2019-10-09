"""
    Constraints(mode::String)
    Constraints(;
        linear_acceleration::AbstractArray{<:Integer,1} = [-IPVACX,IPVACY,IPVACZ],
        angular_acceleration::AbstractArray{<:Integer,1} = -[IPRACX,IPRACY,IPRACZ],
        velocity::AbstractArray{<:Integer,1} = -[IPVIAS,IPBETA,IPALFA],
        rotation_rate::AbstractArray{<:Integer,1} = -[IPROTX,IPROTY,IPROTZ],
        position::AbstractArray{<:Integer,1} = -[IPPOSX, IPPOSY, IPPOSZ],
        phi::Integer = -IPBANK,
        theta::Integer = -IPELEV,
        psi::Integer = -IPHEAD,
        flap_defl_ctrl_var::AbstractArray{<:Integer,1} =
            -(IPFLP1:(IPFLP1-1+NFLPX)),
        eng_pwr_ctrl_var::AbstractArray{<:Integer,1} =
            -(IPENG1:(IPENG1-1+NENGX))
        err_int_Vinf::Integer = IPVIAS,
        err_int_beta::Integer = IPBETA,
        err_int_alpha::Integer = IPALFA,
        err_int_phi::Integer = IPROTX,
        err_int_theta::Integer = IPROTY,
        err_int_psi::Integer = IPROTZ,
        err_int_ROTxyz::AbstractArray{<:Integer,1} = [0,0,0],
        err_int_VACxyz::AbstractArray{<:Integer,1} = [0,0,0])

    Defines operating point constraints as done within ASWING.
    Implemented modes: ["default", "anchored", "free", "static"]
"""
struct Constraints
    linear_acceleration::Array{Int,1}
    angular_acceleration::Array{Int,1}
    velocity::Array{Int,1}
    rotation_rate::Array{Int,1}
    position::Array{Int,1}
    phi::Int
    theta::Int
    psi::Int
    flap_defl_ctrl_var::Array{Int,1}
    eng_pwr_ctrl_var::Array{Int,1}
    err_int_Vinf::Int
    err_int_beta::Int
    err_int_alpha::Int
    err_int_phi::Int
    err_int_theta::Int
    err_int_psi::Int
    err_int_ROTxyz::Array{Int,1}
    err_int_VACxyz::Array{Int,1}
end

function Constraints(;
    linear_acceleration::AbstractArray{<:Integer,1} = -[IPVACX,IPVACY,IPVACZ],
    angular_acceleration::AbstractArray{<:Integer,1} = -[IPRACX,IPRACY,IPRACZ],
    velocity::AbstractArray{<:Integer,1} = -[IPVIAS,IPBETA,IPALFA],
    rotation_rate::AbstractArray{<:Integer,1} = -[IPROTX,IPROTY,IPROTZ],
    position::AbstractArray{<:Integer,1} = -[IPPOSX,IPPOSY,IPPOSZ],
    phi::Integer = -IPBANK,
    theta::Integer = -IPELEV,
    psi::Integer = -IPHEAD,
    flap_defl_ctrl_var::AbstractArray{<:Integer,1} =
        -(IPFLP1:(IPFLP1-1+NFLPX)),
    eng_pwr_ctrl_var::AbstractArray{<:Integer,1} =
        -(IPENG1:(IPENG1-1+NENGX)),
    err_int_Vinf::Integer = IPVIAS,
    err_int_beta::Integer = IPBETA,
    err_int_alpha::Integer = IPALFA,
    err_int_phi::Integer = IPROTX,
    err_int_theta::Integer = IPROTY,
    err_int_psi::Integer = IPROTZ,
    err_int_ROTxyz::AbstractArray{<:Integer,1} = [0,0,0],
    err_int_VACxyz::AbstractArray{<:Integer,1} = [0,0,0]) where Int<:Integer
    Constraints(linear_acceleration, angular_acceleration, velocity,
        rotation_rate, position, phi, theta, psi, flap_defl_ctrl_var,
        eng_pwr_ctrl_var, err_int_Vinf, err_int_beta, err_int_alpha,
        err_int_phi, err_int_theta, err_int_psi, err_int_ROTxyz, err_int_VACxyz)
end

function Constraints(mode::String) where Int<:Integer
    if lowercase(mode) == "default"
        linear_acceleration = [-IPVACX,IPVACY,IPVACZ]
        angular_acceleration = -[IPRACX,IPRACY,IPRACZ]
        velocity = -[IPVIAS,IPBETA,IPALFA]
        rotation_rate = -[IPROTX,IPROTY,IPROTZ]
        position = -[IPPOSX,IPPOSY,IPPOSZ]
        phi = -IPBANK
        theta = -IPELEV
        psi = -IPHEAD
        flap_defl_ctrl_var = -(IPFLP1:(IPFLP1-1+NFLPX))
        eng_pwr_ctrl_var = -(IPENG1:(IPENG1-1+NENGX))
    elseif lowercase(mode) == "anchored"
        linear_acceleration = [IPVACX,IPVACY,IPVACZ]
        angular_acceleration = [IPRACX,IPRACY,IPRACZ]
        velocity = [IPVIAS,IPBETA,IPALFA]
        rotation_rate = [IPROTX,IPROTY,IPROTZ]
        position = -[IPPOSX,IPPOSY,IPPOSZ]
        phi = -IPBANK
        theta = -IPELEV
        psi = -IPHEAD
        flap_defl_ctrl_var = IPFLP1:(IPFLP1-1+NFLPX)
        eng_pwr_ctrl_var = IPENG1:(IPENG1-1+NENGX)
    elseif lowercase(mode) == "free"
        linear_acceleration = [IPFORX,IPFORY,IPFORZ]
        angular_acceleration = [IPMOMX,IPMOMY,IPMOMZ]
        velocity = [IPVIAS,IPBETA,IPALFA]
        rotation_rate = [IPROTX,IPROTY,IPROTZ]
        position = [IPPOSX,IPPOSY,IPPOSZ]
        phi = IPBANK
        theta = IPELEV
        psi = IPHEAD
        flap_defl_ctrl_var = IPFLP1:(IPFLP1-1+NFLPX)
        eng_pwr_ctrl_var = IPENG1:(IPENG1-1+NENGX)
    elseif lowercase(mode) == "static"
        linear_acceleration = [IPVACX,IPVACY,IPVACZ]
        angular_acceleration = [IPRACX,IPRACY,IPRACZ]
        velocity = [IPFORX,IPFORY,IPFORZ]
        rotation_rate = [IPMOMX,IPMOMY,IPMOMZ]
        position = -[IPPOSX,IPPOSY,IPPOSZ]
        phi = -IPBANK
        theta = -IPELEV
        psi = -IPHEAD
        flap_defl_ctrl_var = IPFLP1:(IPFLP1-1+NFLPX)
        eng_pwr_ctrl_var = IPENG1:(IPENG1-1+NENGX)
    else
        error("Undefined default constraint set")
    end

    err_int_Vinf = IPVIAS
    err_int_beta = IPBETA
    err_int_alpha = IPALFA
    err_int_phi = IPROTX
    err_int_theta = IPROTY
    err_int_psi = IPROTZ
    err_int_ROTxyz = [0,0,0]
    err_int_VACxyz = [0,0,0]

    Constraints(linear_acceleration, angular_acceleration, velocity,
        rotation_rate, position, phi, theta, psi, flap_defl_ctrl_var,
        eng_pwr_ctrl_var, err_int_Vinf, err_int_beta, err_int_alpha,
        err_int_phi, err_int_theta, err_int_psi, err_int_ROTxyz, err_int_VACxyz)
end

"""
    Parameters(;
        linear_acceleration::AbstractArray{<:Real,1} = zeros(Float64,3),
        angular_acceleration::AbstractArray{<:Real,1} = zeros(Float64,3),
        velocity::Real = 0.0,
        beta::Real = 0.0,
        alpha::Real = 0.0,
        rotation_rate::AbstractArray{<:Real,1} = zeros(Float64,3),
        position::AbstractArray{<:Real,1} = zeros(Float64,3),
        phi::Real = 0.0,
        theta::Real = 0.0,
        psi::Real = 0.0,
        flap_defl_ctrl_var::AbstractArray{<:Real,1} = zeros(Float64,NFLPX),
        eng_pwr_ctrl_var::AbstractArray{<:Real,1} = zeros(Float64,NENGX),
        sum_force::AbstractArray{<:Real,1} = zeros(Float64,3),
        sum_mom::AbstractArray{<:Real,1} = zeros(Float64,3),
        lift::Real = 0.0,
        climb_angle::Real = 0.0,
        radial_acceleration::Real = 0.0,
        usr1::Real = 0.0,
        usr2::Real = 0.0,
        least_squared::Real = 0.0)

    Defines operating point parameters as done within ASWING.
"""
struct Parameters
    linear_acceleration::Array{Float64,1}
    angular_acceleration::Array{Float64,1}
    velocity::Float64
    beta::Float64
    alpha::Float64
    rotation_rate::Array{Float64,1}
    position::Array{Float64,1}
    phi::Float64
    theta::Float64
    psi::Float64
    flap_defl_ctrl_var::Array{Float64,1}
    eng_pwr_ctrl_var::Array{Float64,1}
    sum_force::Array{Float64,1}
    sum_mom::Array{Float64,1}
    lift::Float64
    climb_angle::Float64
    radial_acceleration::Float64
    usr1::Float64
    usr2::Float64
    least_squared::Float64
    function Parameters(
        linear_acceleration::AbstractArray{<:Real,1},
        angular_acceleration::AbstractArray{<:Real,1},
        velocity::Real, beta::Real, alpha::Real,
        rotation_rate::AbstractArray{<:Real,1},
        position::AbstractArray{<:Real,1},
        phi::Real, theta::Real, psi::Real,
        flap_defl_ctrl_var::AbstractArray{<:Real,1},
        eng_pwr_ctrl_var::AbstractArray{<:Real,1},
        sum_force::AbstractArray{<:Real,1},
        sum_mom::AbstractArray{<:Real,1},
        lift::Real, climb_angle::Real, radial_acceleration::Real,
        usr1::Real, usr2::Real, least_squared::Real)

        if ((length(linear_acceleration) != 3) || (length(angular_acceleration) != 3) ||
            (length(rotation_rate) != 3) ||
            (length(position) != 3) || (length(flap_defl_ctrl_var) > NFLPX) ||
            (length(eng_pwr_ctrl_var) > NENGX) || (length(sum_force) != 3) ||
            (length(sum_mom) != 3))
            error("One or more input arrays are not the correct dimensions")
        end

        new(linear_acceleration, angular_acceleration, velocity, beta, alpha,
            rotation_rate, position, phi, theta, psi, flap_defl_ctrl_var,
            eng_pwr_ctrl_var, sum_force, sum_mom,lift, climb_angle,
            radial_acceleration, usr1, usr2, least_squared)
    end
end

function Parameters(;
    linear_acceleration::AbstractArray{<:Real,1} = zeros(Float64,3),
    angular_acceleration::AbstractArray{<:Real,1} = zeros(Float64,3),
    velocity::Real = 0.0,
    beta::Real = 0.0,
    alpha::Real = 0.0,
    rotation_rate::AbstractArray{<:Real,1} = zeros(Float64,3),
    position::AbstractArray{<:Real,1} = zeros(Float64,3),
    phi::Real = 0.0,
    theta::Real = 0.0,
    psi::Real = 0.0,
    flap_defl_ctrl_var::AbstractArray{<:Real,1} = zeros(Float64,NFLPX),
    eng_pwr_ctrl_var::AbstractArray{<:Real,1} = zeros(Float64,NENGX),
    sum_force::AbstractArray{<:Real,1} = zeros(Float64,3),
    sum_mom::AbstractArray{<:Real,1} = zeros(Float64,3),
    lift::Real = 0.0,
    climb_angle::Real = 0.0,
    radial_acceleration::Real = 0.0,
    usr1::Real = 0.0,
    usr2::Real = 0.0,
    least_squared::Real = 0.0)

    if ((length(linear_acceleration) != 3) || (length(angular_acceleration) != 3) ||
        (length(rotation_rate) != 3) ||
        (length(position) != 3) || (length(flap_defl_ctrl_var) > NFLPX) ||
        (length(eng_pwr_ctrl_var) > NENGX) || (length(sum_force) != 3) ||
        (length(sum_mom) != 3))
        error("One or more input arrays are not the correct dimensions")
    end

    Parameters(linear_acceleration, angular_acceleration, velocity, beta, alpha,
        rotation_rate, position, phi, theta, psi, flap_defl_ctrl_var,
        eng_pwr_ctrl_var, sum_force, sum_mom,lift, climb_angle,
        radial_acceleration, usr1, usr2, least_squared)
end

"""
    OperatingPoint(;
        constraints::Constraints=Constraints(),
        mach_from_airspeed::Bool = false,
        machpg::Real = 0.0,
        ground_image::Real = 0,
        parameters::Parameters = Parameters(),
        wflap::AbstractArray{<:Real,1} = ones(Float64,NFLPX),
        wpeng::AbstractArray{<:Real,1} = ones(Float64,NENGX))

    contains operating point inputs
"""
struct OperatingPoint
    constraints::Constraints # Solution constraints
    mach_from_airspeed::Bool # Set Prandtl-Glauert Mach based on airspeed?
    machpg::Float64 # Prandtl-Glauert Mach
    ground_image::Int # ground image flag, 0 no image,+1 solid ground, -1 free surface (anti-image)
    parameters::Parameters
    wflap::Array{Float64,1} # flap weights for least squared constraint
    wpeng::Array{Float64,1} # engine weights for least squared constraint
end

function OperatingPoint(;
    constraints::Constraints=Constraints(),
    mach_from_airspeed::Bool = false,
    machpg::Real = 0.0,
    ground_image::Real = 0,
    parameters::Parameters = Parameters(),
    wflap::AbstractArray{<:Real,1} = ones(Float64,NFLPX),
    wpeng::AbstractArray{<:Real,1} = ones(Float64,NENGX))

    OperatingPoint(constraints, mach_from_airspeed, machpg, ground_image,
        parameters, wflap, wpeng)
end

function OperatingPoint(;
    constraints::Constraints=Constraints(),
    mach_from_airspeed::Bool = false,
    machpg::Real = 0.0,
    ground_image::Real = 0,
    parameters::Parameters = Parameters(),
    wflap::AbstractArray{<:Real,1} = ones(Float64,NFLPX),
    wpeng::AbstractArray{<:Real,1} = ones(Float64,NENGX))

    OperatingPoint(constraints, mach_from_airspeed, machpg, ground_image,
        parameters, wflap, wpeng)
end
