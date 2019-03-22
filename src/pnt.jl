# defines operating points used in ASWING

# Dictionary of pointers to parameters
const dparam = Dict{String,Int}("accel_x"=>IPVACX, "accel_y"=>IPVACY,
"accel_z" =>  IPVACZ, "ang_accel_x" => IPRACX, "ang_accel_y" =>  IPRACY,
"ang_accel_z" =>  IPRACZ, "velocity" =>  IPVIAS, "beta" =>  IPBETA,
"alpha" =>  IPALFA, "ang_vel_x" => IPROTX, "ang_vel_y" => IPROTY,
"ang_vel_z" => IPROTZ, "position_x" => IPPOSX, "position_y" => IPPOSY,
"position_z" => IPPOSZ, "roll" => IPBANK, "pitch" => IPELEV, "yaw" => IPHEAD,
"flap_1" => IPFLP1, "flap_2" => IPFLP2, "flap_3" => IPFLP3,
"flap_4" => IPFLP4, "flap_5" => IPFLP5, "flap_6" => IPFLP6,
"flap_7" => IPFLP7, "flap_8" => IPFLP8, "flap_9" => IPFLP9,
"flap_10"=> IPFLP10, "flap_11"=> IPFLP11, "flap_12"=> IPFLP12,
"flap_13"=> IPFLP13, "flap_14"=> IPFLP14, "flap_15"=> IPFLP15,
"flap_16"=> IPFLP16, "flap_17"=> IPFLP17, "flap_18"=> IPFLP18,
"flap_19"=> IPFLP19, "flap_20"=> IPFLP20, "eng_1" => IPENG1,
"eng_2" => IPENG2, "eng_3" => IPENG3, "eng_4" => IPENG4, "eng_5" => IPENG5,
"eng_6" => IPENG6, "eng_7" => IPENG7, "eng_8" => IPENG8, "eng_9" => IPENG9,
"eng_10"=> IPENG10, "eng_11"=> IPENG11, "eng_12"=> IPENG12,
"force_x" => IPFORX, "force_y" => IPFORY, "force_z" => IPFORZ,
"moment_x" => IPMOMX, "moment_y" => IPMOMY, "moment_z" => IPMOMZ,
"lift" => IPLIFT, "climb_angle" => IPGAMM, "radial_acceleration" => IPRACC,
"usr1" => IPUSR1, "usr2" => IPUSR2, "least_squared" => IPLSQD)

"""
    Constraints(mode::String)
    Constraints(;
        linear_acceleration::AbstractArray{<:Integer,1} =
            -[dparam["accel_x"],dparam["accel_y"],dparam["accel_z"]],
        angular_acceleration::AbstractArray{<:Integer,1} =
            -[dparam["ang_accel_x"],dparam["ang_accel_y"],dparam["ang_accel_z"]],
        velocity::AbstractArray{<:Integer,1} =
            -[dparam["velocity"],dparam["beta"],dparam["alpha"]],
        rotation_rate::AbstractArray{<:Integer,1} =
            -[dparam["ang_vel_x"],dparam["ang_vel_y"],dparam["ang_vel_z"]],
        position::AbstractArray{<:Integer,1} =
            -[dparam["position_x"],dparam["position_y"],dparam["position_z"]],
        phi::Integer = -dparam["roll"],
        theta::Integer = -dparam["pitch"],
        psi::Integer = -dparam["yaw"],
        flap_defl_ctrl_var::AbstractArray{<:Integer,1} =
            -(dparam["flap_1"]:(dparam["flap_1"]-1+NFLPX)),
        eng_pwr_ctrl_var::AbstractArray{<:Integer,1} =
            -(dparam["eng_1"]:(dparam["eng_1"]-1+NENGX))
        err_int_Vinf::Integer = dparam["velocity"],
        err_int_beta::Integer = dparam["beta"],
        err_int_alpha::Integer = dparam["alpha"],
        err_int_phi::Integer = dparam["ang_vel_x"],
        err_int_theta::Integer = dparam["ang_vel_y"],
        err_int_psi::Integer = dparam["ang_vel_z"],
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
    linear_acceleration::AbstractArray{<:Integer,1} =
        -[dparam["accel_x"],dparam["accel_y"],dparam["accel_z"]],
    angular_acceleration::AbstractArray{<:Integer,1} =
        -[dparam["ang_accel_x"],dparam["ang_accel_y"],dparam["ang_accel_z"]],
    velocity::AbstractArray{<:Integer,1} =
        -[dparam["velocity"],dparam["beta"],dparam["alpha"]],
    rotation_rate::AbstractArray{<:Integer,1} =
        -[dparam["ang_vel_x"],dparam["ang_vel_y"],dparam["ang_vel_z"]],
    position::AbstractArray{<:Integer,1} =
        -[dparam["position_x"],dparam["position_y"],dparam["position_z"]],
    phi::Integer = -dparam["roll"],
    theta::Integer = -dparam["pitch"],
    psi::Integer = -dparam["yaw"],
    flap_defl_ctrl_var::AbstractArray{<:Integer,1} =
        -(dparam["flap_1"]:(dparam["flap_1"]-1+NFLPX)),
    eng_pwr_ctrl_var::AbstractArray{<:Integer,1} =
        -(dparam["eng_1"]:(dparam["eng_1"]-1+NENGX)),
    err_int_Vinf::Integer = dparam["velocity"],
    err_int_beta::Integer = dparam["beta"],
    err_int_alpha::Integer = dparam["alpha"],
    err_int_phi::Integer = dparam["ang_vel_x"],
    err_int_theta::Integer = dparam["ang_vel_y"],
    err_int_psi::Integer = dparam["ang_vel_z"],
    err_int_ROTxyz::AbstractArray{<:Integer,1} = [0,0,0],
    err_int_VACxyz::AbstractArray{<:Integer,1} = [0,0,0]) where Int<:Integer
    Constraints(linear_acceleration, angular_acceleration, velocity,
        rotation_rate, position, phi, theta, psi, flap_defl_ctrl_var,
        eng_pwr_ctrl_var, err_int_Vinf, err_int_beta, err_int_alpha,
        err_int_phi, err_int_theta, err_int_psi, err_int_ROTxyz, err_int_VACxyz)
end

function Constraints(mode::String) where Int<:Integer
    if lowercase(mode) == "default"
        linear_acceleration = -[dparam["accel_x"],dparam["accel_y"],dparam["accel_z"]]
        angular_acceleration = -[dparam["ang_accel_x"],dparam["ang_accel_y"],dparam["ang_accel_z"]]
        velocity = -[dparam["velocity"],dparam["beta"],dparam["alpha"]]
        rotation_rate = -[dparam["ang_vel_x"],dparam["ang_vel_y"],dparam["ang_vel_z"]]
        position = -[dparam["position_x"],dparam["position_y"],dparam["position_z"]]
        phi = -dparam["roll"]
        theta = -dparam["pitch"]
        psi = -dparam["yaw"]
        flap_defl_ctrl_var = -(dparam["flap_1"]:(dparam["flap_1"]-1+NFLPX))
        eng_pwr_ctrl_var = -(dparam["eng_1"]:(dparam["eng_1"]-1+NENGX))
    elseif lowercase(mode) == "anchored"
        linear_acceleration = [dparam["accel_x"],dparam["accel_y"],dparam["accel_z"]]
        angular_acceleration = [dparam["ang_accel_x"],dparam["ang_accel_y"],dparam["ang_accel_z"]]
        velocity = [dparam["velocity"],dparam["beta"],dparam["alpha"]]
        rotation_rate = [dparam["ang_vel_x"],dparam["ang_vel_y"],dparam["ang_vel_z"]]
        position = -[dparam["position_x"],dparam["position_y"],dparam["position_z"]]
        phi = -dparam["roll"]
        theta = -dparam["pitch"]
        psi = -dparam["yaw"]
        flap_defl_ctrl_var = dparam["flap_1"]:(dparam["flap_1"]-1+NFLPX)
        eng_pwr_ctrl_var = dparam["eng_1"]:(dparam["eng_1"]-1+NENGX)
    elseif lowercase(mode) == "free"
        linear_acceleration = [dparam["force_x"],dparam["force_y"],dparam["force_z"]]
        angular_acceleration = [dparam["moment_x"],dparam["moment_y"],dparam["moment_z"]]
        velocity = [dparam["velocity"],dparam["beta"],dparam["alpha"]]
        rotation_rate = [dparam["ang_vel_x"],dparam["ang_vel_y"],dparam["ang_vel_z"]]
        position = [dparam["position_x"],dparam["position_y"],dparam["position_z"]]
        phi = dparam["roll"]
        theta = dparam["pitch"]
        psi = dparam["yaw"]
        flap_defl_ctrl_var = dparam["flap_1"]:(dparam["flap_1"]-1+NFLPX)
        eng_pwr_ctrl_var = dparam["eng_1"]:(dparam["eng_1"]-1+NENGX)
    elseif lowercase(mode) == "static"
        linear_acceleration = [dparam["accel_x"],dparam["accel_y"],dparam["accel_z"]]
        angular_acceleration = [dparam["ang_accel_x"],dparam["ang_accel_y"],dparam["ang_accel_z"]]
        velocity = [dparam["force_x"],dparam["force_y"],dparam["force_z"]]
        rotation_rate = [dparam["moment_x"],dparam["moment_y"],dparam["moment_z"]]
        position = -[dparam["position_x"],dparam["position_y"],dparam["position_z"]]
        phi = -dparam["roll"]
        theta = -dparam["pitch"]
        psi = -dparam["yaw"]
        flap_defl_ctrl_var = dparam["flap_1"]:(dparam["flap_1"]-1+NFLPX)
        eng_pwr_ctrl_var = dparam["eng_1"]:(dparam["eng_1"]-1+NENGX)
    else
        error("Undefined default constraint set")
    end

    err_int_Vinf = dparam["velocity"]
    err_int_beta = dparam["beta"]
    err_int_alpha = dparam["alpha"]
    err_int_phi = dparam["ang_vel_x"]
    err_int_theta = dparam["ang_vel_y"]
    err_int_psi = dparam["ang_vel_z"]
    err_int_ROTxyz = [0,0,0]
    err_int_VACxyz = [0,0,0]

    Constraints(linear_acceleration, angular_acceleration, velocity,
        rotation_rate, position, phi, theta, psi, flap_defl_ctrl_var,
        eng_pwr_ctrl_var, err_int_Vinf, err_int_beta, err_int_alpha,
        err_int_phi, err_int_theta, err_int_psi, err_int_ROTxyz, err_int_VACxyz)
end

"""
    Parameters(;
        linear_acceleration::AbstractArray{<:Real,1} = zeros(R,3),
        angular_acceleration::AbstractArray{<:Real,1} = zeros(R,3),
        velocity::Real = 0.0,
        beta::Real = 0.0,
        alpha::Real = 0.0,
        rotation_rate::AbstractArray{<:Real,1} = zeros(R,3),
        position::AbstractArray{<:Real,1} = zeros(R,3),
        phi::Real = 0.0,
        theta::Real = 0.0,
        psi::Real = 0.0,
        flap_defl_ctrl_var::AbstractArray{<:Real,1} = zeros(R,NFLPX),
        eng_pwr_ctrl_var::AbstractArray{<:Real,1} = zeros(R,NENGX),
        sum_force::AbstractArray{<:Real,1} = zeros(R,3),
        sum_mom::AbstractArray{<:Real,1} = zeros(R,3),
        lift::Real = 0.0,
        climb_angle::Real = 0.0,
        radial_acceleration::Real = 0.0,
        usr1::Real = 0.0,
        usr2::Real = 0.0,
        least_squared::Real = 0.0)

    Defines operating point parameters as done within ASWING.
"""
struct Parameters{R<:Real}
    linear_acceleration::Array{R,1}
    angular_acceleration::Array{R,1}
    velocity::R
    beta::R
    alpha::R
    rotation_rate::Array{R,1}
    position::Array{R}
    phi::R
    theta::R
    psi::R
    flap_defl_ctrl_var::Array{R,1}
    eng_pwr_ctrl_var::Array{R,1}
    sum_force::Array{R,1}
    sum_mom::Array{R,1}
    lift::R
    climb_angle::R
    radial_acceleration::R
    usr1::R
    usr2::R
    least_squared::R
    function (::Type{Parameters{R}})(
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
        usr1::Real, usr2::Real, least_squared::Real) where R<:Real

        if ((length(linear_acceleration) != 3) || (length(angular_acceleration) != 3) ||
            (length(rotation_rate) != 3) ||
            (length(position) != 3) || (length(flap_defl_ctrl_var) != NFLPX) ||
            (length(eng_pwr_ctrl_var) != NENGX) || (length(sum_force) != 3) ||
            (length(sum_mom) != 3))
            error("One or more input arrays are not the correct dimensions")
        end

        new{R}(linear_acceleration, angular_acceleration, velocity, beta, alpha,
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
        (length(position) != 3) || (length(flap_defl_ctrl_var) != NFLPX) ||
        (length(eng_pwr_ctrl_var) != NENGX) || (length(sum_force) != 3) ||
        (length(sum_mom) != 3))
        error("One or more input arrays are not the correct dimensions")
    end

    Parameters{Float64}(linear_acceleration, angular_acceleration, velocity, beta, alpha,
        rotation_rate, position, phi, theta, psi, flap_defl_ctrl_var,
        eng_pwr_ctrl_var, sum_force, sum_mom,lift, climb_angle,
        radial_acceleration, usr1, usr2, least_squared)
end

function (::Type{Parameters{R}})(;
    linear_acceleration::AbstractArray{<:Real,1} = zeros(R,3),
    angular_acceleration::AbstractArray{<:Real,1} = zeros(R,3),
    velocity::Real = 0.0,
    beta::Real = 0.0,
    alpha::Real = 0.0,
    rotation_rate::AbstractArray{<:Real,1} = zeros(R,3),
    position::AbstractArray{<:Real,1} = zeros(R,3),
    phi::Real = 0.0,
    theta::Real = 0.0,
    psi::Real = 0.0,
    flap_defl_ctrl_var::AbstractArray{<:Real,1} = zeros(R,NFLPX),
    eng_pwr_ctrl_var::AbstractArray{<:Real,1} = zeros(R,NENGX),
    sum_force::AbstractArray{<:Real,1} = zeros(R,3),
    sum_mom::AbstractArray{<:Real,1} = zeros(R,3),
    lift::Real = 0.0,
    climb_angle::Real = 0.0,
    radial_acceleration::Real = 0.0,
    usr1::Real = 0.0,
    usr2::Real = 0.0,
    least_squared::Real = 0.0
    ) where R<:Real

    if ((length(linear_acceleration) != 3) || (length(angular_acceleration) != 3) ||
        (length(rotation_rate) != 3) ||
        (length(position) != 3) || (length(flap_defl_ctrl_var) != NFLPX) ||
        (length(eng_pwr_ctrl_var) != NENGX) || (length(sum_force) != 3) ||
        (length(sum_mom) != 3))
        error("One or more input arrays are not the correct dimensions")
    end

    Parameters{R}(linear_acceleration, angular_acceleration, velocity, beta, alpha,
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
        wflap::AbstractArray{<:Real,1} = ones(R,NFLPX),
        wpeng::AbstractArray{<:Real,1} = ones(R,NENGX))

    contains operating point inputs
"""
struct OperatingPoint{R<:Real}
    constraints::Constraints # Solution constraints
    mach_from_airspeed::Bool # Set Prandtl-Glauert Mach based on airspeed?
    machpg::R # Prandtl-Glauert Mach
    ground_image::Int # ground image flag, 0 no image,+1 solid ground, -1 free surface (anti-image)
    parameters::Parameters{R}
    wflap::Array{R,1} # flap weights for least squared constraint
    wpeng::Array{R,1} # engine weights for least squared constraint
end

function OperatingPoint(;
    constraints::Constraints=Constraints(),
    mach_from_airspeed::Bool = false,
    machpg::Real = 0.0,
    ground_image::Real = 0,
    parameters::Parameters = Parameters{Float64}(),
    wflap::AbstractArray{<:Real,1} = ones(Float64,NFLPX),
    wpeng::AbstractArray{<:Real,1} = ones(Float64,NENGX))

    OperatingPoint{Float64}(constraints, mach_from_airspeed, machpg, ground_image,
        parameters, wflap, wpeng)
end

function OperatingPoint{R}(;
    constraints::Constraints=Constraints(),
    mach_from_airspeed::Bool = false,
    machpg::Real = 0.0,
    ground_image::Real = 0,
    parameters::Parameters = Parameters{R}(),
    wflap::AbstractArray{<:Real,1} = ones(R,NFLPX),
    wpeng::AbstractArray{<:Real,1} = ones(R,NENGX)) where {R<:Real}

    OperatingPoint{R}(constraints, mach_from_airspeed, machpg, ground_image,
        parameters, wflap, wpeng)
end
