# contains functions for file i/o

"""
    aswsav(file)
    Saves ASWING geometry state to a file
"""
function aswsav(file)
    # split filepath and filename
    filepath, filename = splitdir(file)

    # create path to file and change working directory
    wd = pwd()
    if !isempty(filepath)
        if !isfile(filepath)
            mkpath(filepath)
        end
        cd(filepath)
    end

    # add .asw extension if not already present
    if length(filename) <= 4 || filename[end-3:end] != ".asw"
        filename *= ".asw"
    end
    # write file
    ccall((:outputjl_,libaswing), Nothing,(Ptr{Cchar},Ref{Int32}),filename,length(filename))
    # change back to working directory
    cd(wd)
    return nothing
end

"""
    pntsav(file, ipnt1=1, ipnt2=ASWING.NPOINT)
    Saves ASWING operating point state to a file
"""
function pntsav(file::String, ipnt1=1, ipnt2=ASWING.NPOINT)
    # split filepath and filename
    filepath, filename = splitdir(file)
    # create path to file and change working directory
    wd = pwd()
    if !isempty(filepath)
        if !isfile(filepath)
            mkpath(filepath)
        end
        cd(filepath)
    end
    # add .pnt extension if not already present
    if length(filename) <= 4 || filename[end-3:end] != ".pnt"
        filename *= ".pnt"
    end
    # write file
    ccall((:pntsavjl_, libaswing), Nothing, (Ptr{Cchar}, Ref{Int32}, Ref{Int32},
        Ref{Int32}), filename, length(filename), ipnt1, ipnt2)
    # change back to working directory
    cd(wd)
    return nothing
end

"""
    setsav(file)
    Saves ASWING operating point state to a file
"""
function setsav(file)
    # split filepath and filename
    filepath, filename = splitdir(file)
    # create path to file and change working directory
    wd = pwd()
    if !isempty(filepath)
        if !isfile(filepath)
            mkpath(filepath)
        end
        cd(filepath)
    end
    # add .set extension if not already present
    if length(filename) <= 4 || filename[end-4:end] != ".set"
        filename *= ".set"
    end
    # write file
    ccall((:setsavjl_,libaswing), Nothing,(Ptr{Cchar},Ref{Int32}),filename,length(filename))
    # change back to working directory
    cd(wd)
    return nothing
end

"""
    readasw(filename::AbstractString, R::Type{<:Real}=Float64)

    Reads a .asw file
"""
function readasw(filename::AbstractString, R::Type{<:Real}=Float64)
    local aswname, si_units, constants, refvals
    sensors = Sensor{R}[]
    engines = Engine{R}[]
    weights = Weight{R}[]
    struts = Strut{R}[]
    joints = Joint{R}[]
    jangles = Jangle{R}[]
    grounds = Ground{R}[]
    beams = Beam{R}[]
    # Open File
    f = open(filename)
    line = 0
    nbeam = 0
    njang = 0
    # Loop through file line by line
    while !eof(f)
        str = readline(f)
        line = line+1
        if isinline(lowercase(str),"end",1:3)
            break
        elseif isinline(str,"!",1:1) || isinline(str,"#",1:1) || isinline(str,"%",1:1)
        elseif strip(str) == ""
            # Check for and read name block
        elseif isinline(lowercase(str),"name",1:4)
            # println("Reading Name")
            while !eof(f)
                str = readline(f)
                line = line+1
                if isinline(lowercase(str),"end",1:3)
                    break
                elseif isinline(str,"!",1:1) || isinline(str,"#",1:1) || isinline(str,"%",1:1)
                else
                    aswname = chomp(str)
                end
            end
            # Check for and read unit block
        elseif isinline(lowercase(str),"unit",1:4)
            # println("Reading Units")
            while !eof(f)
                str = readline(f)
                line = line+1
                if isinline(lowercase(str),"end",1:3)
                    break
                elseif isinline(str,"!",1:1) || isinline(str,"#",1:1) || isinline(str,"%",1:1)
                elseif strip(str) == ""
                else
                    substr = split(str)
                    if lowercase(substr[1]) == "l" && lowercase(substr[3]) == "ft"
                        si_units = false
                    elseif lowercase(substr[1]) == "m"
                    elseif lowercase(substr[1]) == "f" && lowercase(substr[3]) == "lb"
                        si_units = false
                    elseif lowercase(substr[1]) == "t"
                    else
                        si_units = true
                    end
                end
            end
        # Check for and read constant block
        elseif isinline(lowercase(str),"cons",1:4)
            # println("Reading Constants")
            nvalue = 3
            skip = 0
            constin, line = parseblock(f, line, nvalue, skip)
            constants = Constants{R}(;
                gravity = constin[1],
                sea_level_air_density = constin[2],
                sea_level_speed_of_sound = constin[3])
            # Check for and read reference block
        elseif isinline(lowercase(str),"refe",1:4)
            # println("Reading Reference Values")
            nvalue = 3
            skip = 0
            refin,line = parseblock(f, line, nvalue, skip)
            area = refin[1,1]
            chord = refin[1,2]
            span = refin[1,3]
            moments = zeros(R,3)
            accelerations = zeros(R,3)
            velocities = zeros(R,3)
            for i = 1:3
                moments[i] = refin[2,i]
                accelerations[i] = refin[3,i]
                velocities[i] = refin[4,i]
            end
            refvals = ReferenceValues{R}(area, chord, span, moments, accelerations,
                velocities)
            # Check for and read sensor block
        elseif isinline(lowercase(str), "sens", 1:4)
            # println("Reading Sensor Values")
            nvalue = 12
            skip = 2
            sensin,line = parseblock(f, line, nvalue, skip)
            for i = 1:size(sensin,1)
                sensor = Sensor{R}(Int(sensin[i,1]), Int(sensin[i,2]), sensin[i,3],
                    [sensin[i,4], sensin[i,5], sensin[i,6]],
                    [sensin[i,7], sensin[i,8], sensin[i,9]],
                    [sensin[i,10], sensin[i,11], sensin[i,12]])
                push!(sensors, sensor)
            end
            # Check for and read engine block
        elseif isinline(lowercase(str), "engi", 1:4)
            # println("Reading Engine Values")
            nvalue = 25
            skip = 3
            enginein, line = parseblock(f, line, nvalue, skip)
            for i = 1:size(enginein, 1)
                engine = Engine{R}(Int(enginein[i,1]),
                    Int(enginein[i,2]), Int(enginein[i,3]),
                    enginein[i,4], [enginein[i,5], enginein[i,6], enginein[i,7]],
                    [enginein[i,8], enginein[i,9], enginein[i,10]],
                    enginein[i,11], enginein[i,12], enginein[i,13], enginein[i,14],
                    enginein[i,15], enginein[i,16], enginein[i,17], enginein[i,18],
                    enginein[i,19], enginein[i,20], enginein[i,21], enginein[i,22],
                    enginein[i,23], enginein[i,24], enginein[i,25])
                push!(engines,engine)
            end
            # Check for and read weight block
        elseif isinline(lowercase(str), "weig", 1:4)
            # println("Reading Weight Values")
            nvalue = 17
            skip = 1
            weightin, line = parseblock(f, line, nvalue, skip)
            for i = 1:size(weightin, 1)
                weight = Weight{R}(Int(weightin[i,1]), weightin[i,2],
                    [weightin[i,3], weightin[i,4], weightin[i,5]],
                    weightin[i,6], weightin[i,7], weightin[i,8],
                    [weightin[i,9], weightin[i,10], weightin[i,11]],
                    weightin[i,12], weightin[i,13], weightin[i,14],
                    weightin[i,15], weightin[i,16], weightin[i,17])
                push!(weights, weight)
            end
            # Check for and read strut block
        elseif isinline(lowercase(str), "stru", 1:4)
            # println("Reading Strut Block")
            nvalue = 10
            skip = 1
            strutin,line = parseblock(f, line, nvalue, skip)
            for i = 1:size(strutin, 1)
                strut = Strut{R}(strutin[i,1], strutin[i,2],
                    [strutin[i,3], strutin[i,4], strutin[i,5]],
                    [strutin[i,6], strutin[i,7], strutin[i,8]],
                    strutin[i,9], strutin[i,10])
                push!(struts,strut)
            end
            # Check for and read joint block
        elseif isinline(lowercase(str), "join", 1:4)
            # println("Reading Joint Block")
            nvalue = 5
            skip = 2
            jointin, line = parseblock(f, line, nvalue, skip)
            for i = 1:size(jointin,1)
                joint = Joint{R}(Int(jointin[i,1]), Int(jointin[i,2]), jointin[i,3],
                    jointin[i,4], Int(jointin[i,5]))
                push!(joints, joint)
            end
            # Check for and read jangle block
        elseif isinline(lowercase(str), "jang", 1:4)
            # println("Reading Jangle Block")
            nvalue = 4
            njang = njang+1
            while !eof(f)
                str = readline(f)
                line = line + 1
                if lowercase(str[1:3]) == "end"
                    break
                elseif (str[1] == "!" || str[1] == "#" || str[1] == "%")
                elseif strip(str) == ""
                else
                    substr = split(str)
                    rdat = zeros(nvalue)
                    for i = 1:length(substr)
                        rdat[i] = Meta.parse(substr[i])
                    end
                    Njoint = rdat[1]
                    hinge_axis = [rdat[2], rdat[3], rdat[4]]
                    nvalue = 2
                    skip = 0
                    jangle_data, line = parseblock(f, line, nvalue, skip)
                    for i = 1:size(jangle_data,1)
                        hinge_moment[i] = jangle_data[i,1]
                        hinge_angle[i] = jangle_data[i,2]
                    end
                    jangle = Jangle{R}(Njoint, hinge_axis, hinge_moment, hinge_angle)
                    push!(jangles, jangle)
                    break
                end
            end
            # Check for and read ground block
        elseif lowercase(str[1:4]) == "grou"
            # println("Reading Ground Block")
            nvalue = 3
            skip = 1
            groundin,line = parseblock(f, line, nvalue, skip)
            for i = 1:size(groundin,1)
                ground = Ground{R}(groundin[i,1], groundin[i,2], groundin[i,3])
                push!(grounds, ground)
            end
            # Check for and read new beam
        elseif lowercase(str[1:4]) == "beam"
            # println("Reading Beam Blocks")
            nbeam = nbeam+1
            beamvars = [Array{R}(undef, 0, 2) for idx in 1:length(beamvarval)]
            # Read beam number and physical index
            substr = split(chomp(str))
            beam_number = Meta.parse(substr[2])
            if length(substr) > 2
                physical_index = Meta.parse(substr[3])
            else
                physical_index = beam_number
            end
            # Read beam name
            str = readline(f)
            line = line+1
            beam_name = chomp(str)
            # Read beam data
            str = readline(f)
            line = line+1
            beam_data_end = false
            while !eof(f) && !beam_data_end
                if isinline(lowercase(str),"end",1:3)
                    break
                elseif isinline(str,"!",1:1) || isinline(str,"#",1:1) || isinline(str,"%",1:1)
                    str = readline(f)
                elseif strip(str) == ""
                    str = readline(f)
                else
                    bvar = split(chomp(str))
                    if bvar[1] != "t"
                        error("First variable must be \"t\"")
                    end
                    for i = 2:length(bvar)
                        if ~haskey(beamvarval, bvar[i])
                            @warn("Variable ", bvar[i] , " is not a valid variable", )
                        end
                    end
                    nvalue = length(split(str))
                    qadd = zeros(nvalue)
                    qfac = ones(nvalue)
                    iline = 1
                    while !eof(f)
                        str = readline(f)
                        idx = findfirst(isequal('!'), str[2:end])
                        if idx != nothing
                            str = str[1:idx]
                        end
                        line = line + 1
                        if occursin("end", lowercase(str))
                            beam_data_end = true
                            break
                        elseif isinline(strip(str), "t", 1:1)
                            break
                        elseif isinline(str,"!",1:1) || isinline(str,"#",1:1) || isinline(str,"%",1:1)
                        elseif strip(str) == ""
                        elseif isinline(str,"*",1:1)
                            substr = split(str[2:end])
                            for i = 1:length(substr)
                                qfac[i] = Meta.parse(substr[i])
                            end
                        elseif isinline(str, "+", 1:1)
                            substr = split(str[2:end])
                            for i = 1:length(substr)
                                qadd[i] = Meta.parse(substr[i])
                            end
                        else
                            substr = split(str)
                            rdat = zeros(nvalue)
                            for i = 1:length(substr)
                                rdat[i] = Meta.parse(substr[i])
                            end
                            clbvalin = rdat.*qfac+qadd
                            for i = 2:length(bvar)
                                for var in keys(beamvarval)
                                    if bvar[i] == var
                                        beamvars[beamvarval[var]] = vcat(beamvars[beamvarval[var]],
                                            [clbvalin[1] clbvalin[i]])
                                    end
                                end
                            end
                            iline = iline+1
                        end
                    end
                end
            end
            spanwise_variables = SpanwiseVariables{R}(beamvars...)
            beam = Beam{R}(beam_number, physical_index, beam_name, spanwise_variables)
            push!(beams, beam)
        else
            error("Undefined input on line $line:\n
            $str")
        end
    end
    close(f)
    asw = Configuration{R}(aswname, si_units, constants, refvals, weights,
        sensors, engines, struts, joints, jangles, grounds, beams)
    return asw
end

"""
    parseblock(f, line, nvalue, skip)

    parses common input blocks, used in readasw
"""
function parseblock(f, line, nvalue, skip)
    qadd = zeros(nvalue)
    qfac = ones(nvalue)
    fdata = zeros(1,nvalue)
    iline = 1
    while !eof(f)
        str = readline(f)
        idx = findfirst(isequal('!'), str[2:end])
        if idx != nothing
            str = str[1:idx]
        end
        line = line + 1
        if isinline(lowercase(str),"end",1:3)
            break
        elseif isinline(str,"!",1:1) || isinline(str,"#",1:1) || isinline(str,"%",1:1)
        elseif strip(str) == ""
        elseif isinline(str,"*",1:1)
            substr = split(str[2:end])
            for i = 1:length(substr)
                qfac[i] = Meta.parse(substr[i])
            end
        elseif isinline(str,"+",1:1)
            substr = split(str[2:end])
            for i = 1:length(substr)
                qadd[i] = Meta.parse(substr[i])
            end
        else
            substr = split(str)
            rdat = zeros(nvalue)
            for i = 1:length(substr)
                rdat[i] = Meta.parse(substr[i])
            end
            flinedata = zeros(1,nvalue)
            for i = 1:length(substr)
                if i<=skip
                    flinedata[1,i] = rdat[i]
                else
                    flinedata[1,i] = rdat[i]*qfac[i-skip]+qadd[i-skip]
                end
            end
            if iline == 1
                fdata = flinedata
            else
                fdata = vcat(fdata,flinedata)
            end
            iline = iline+1
        end
    end
    return fdata,line
end


"""
    isinline(line, stringtofind, range)

    checks for string within line, used in readasw
"""
function isinline(line, stringtofind, range)
    if length(line) < maximum(range)
        return false
    else
        return occursin(line[range], stringtofind)
    end
end

"""
    readpnt(filename::String)

    Reads a .pnt file
"""
function readpnt(filename::AbstractString)
    local constraints, mach_from_airspeed, ground_image, parameters
    open(filename) do f
        oper_pnts = Array{OperatingPoint,1}(undef, 0)
        str = readline(f)
        substr = split(str)
        iptot0 = Meta.parse(substr[1])
        kptot0 = Meta.parse(substr[2])
        kpfree0 = Meta.parse(substr[3])

        if (iptot0 != IPTOT) || (kptot0 != KPTOT) || (kpfree0 != KPFREE)
            error("Dimensions have changed. Point file not read.")
        end

        point = 0
        while !eof(f)
            point = point+1

            # Read constraints
            str = readline(f)
            substr = split(str)

            idx = 0

            linear_acceleration = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            angular_acceleration = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            velocity = Meta.parse(substr[idx+1])
            idx += 1

            beta = Meta.parse(substr[idx+1])
            idx += 1

            alpha = Meta.parse(substr[idx+1])
            idx += 1

            rotation_rate = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            position = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            phi = Meta.parse(substr[idx+1])
            idx += 1

            theta = Meta.parse(substr[idx+1])
            idx += 1

            psi = Meta.parse(substr[idx+1])
            idx += 1

            flap_defl_ctrl_var = zeros(Int, NFLPX)
            for i = 1:NFLPX
                flap_defl_ctrl_var[i] = Meta.parse(substr[idx+i])
            end
            idx += NFLPX

            eng_pwr_ctrl_var = zeros(Int, NENGX)
            for i = 1:NENGX
                eng_pwr_ctrl_var[i] = Meta.parse(substr[idx+i])
            end
            idx += NENGX

            err_int_Vinf = Meta.parse(substr[idx+1])
            idx += 1

            err_int_beta = Meta.parse(substr[idx+1])
            idx += 1

            err_int_alpha = Meta.parse(substr[idx+1])
            idx += 1

            err_int_phi = Meta.parse(substr[idx+1])
            idx += 1

            err_int_theta = Meta.parse(substr[idx+1])
            idx += 1

            err_int_psi = Meta.parse(substr[idx+1])
            idx += 1

            err_int_ROTxyz = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            err_int_VACxyz = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            constraints = Constraints(linear_acceleration,
                angular_acceleration, [velocity, beta, alpha], rotation_rate,
                position, phi, theta, psi, flap_defl_ctrl_var, eng_pwr_ctrl_var,
                err_int_Vinf, err_int_beta, err_int_alpha, err_int_phi,
                err_int_theta, err_int_psi, err_int_ROTxyz, err_int_VACxyz)

            # Read mach_from_airspeed boolean and ground image integer
            str = readline(f)
            substr = split(str)
            if substr[1] == "T"
                mach_from_airspeed = true
            else
                mach_from_airspeed = false
            end
            ground_image = Meta.parse(substr[2])

            # Read specified parameters
            str = readline(f)
            substr = split(str)

            idx = 0

            linear_acceleration = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            angular_acceleration = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            velocity = Meta.parse(substr[idx+1])
            idx += 1

            beta = Meta.parse(substr[idx+1])
            idx += 1

            alpha = Meta.parse(substr[idx+1])
            idx += 1

            rotation_rate = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            position = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            phi = Meta.parse(substr[idx+1])
            idx += 1

            theta = Meta.parse(substr[idx+1])
            idx += 1

            psi = Meta.parse(substr[idx+1])
            idx += 1

            flap_defl_ctrl_var = zeros(Float64, NFLPX)
            for i = 1:NFLPX
                flap_defl_ctrl_var[i] = Meta.parse(substr[idx+i])
            end
            idx += NFLPX

            eng_pwr_ctrl_var = zeros(Float64, NENGX)
            for i = 1:NENGX
                eng_pwr_ctrl_var[i] = Meta.parse(substr[idx+i])
            end
            idx += NENGX

            sum_force = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            sum_mom = [Meta.parse(substr[idx+1]), Meta.parse(substr[idx+2]), Meta.parse(substr[idx+3])]
            idx += 3

            lift = Meta.parse(substr[idx+1])
            idx += 1

            climb_angle = Meta.parse(substr[idx+1])
            idx += 1

            radial_acceleration = Meta.parse(substr[idx+1])
            idx += 1

            usr1 = Meta.parse(substr[idx+1])
            idx += 1

            usr2 = Meta.parse(substr[idx+1])
            idx += 1

            least_squared = Meta.parse(substr[idx+1])
            idx += 1

            parameters = Parameters(
                linear_acceleration = linear_acceleration,
                angular_acceleration = angular_acceleration,
                velocity = velocity,
                beta = beta,
                alpha = alpha,
                rotation_rate = rotation_rate,
                position = position,
                phi = phi,
                theta = theta,
                psi = psi,
                flap_defl_ctrl_var = flap_defl_ctrl_var,
                eng_pwr_ctrl_var = eng_pwr_ctrl_var,
                sum_force = sum_force,
                sum_mom = sum_mom,
                lift = lift,
                climb_angle = climb_angle,
                radial_acceleration = radial_acceleration,
                usr1 = usr1,
                usr2 = usr2,
                least_squared = least_squared)
            # Global parameters set inside ASWING when solved so these are not needed
            str = readline(f)
            # Read flap weights for least squares
            str = readline(f)
            substr = split(str)
            wflap = zeros(Float64, NFLPX)
            for i = 1:min(length(substr), NFLPX)
                wflap[i] = Meta.parse(substr[i])
            end
            # Read engine weights for least squares
            str = readline(f)
            substr = split(str)
            wpeng = zeros(Float64, NENGX)
            for i = 1:min(length(substr), NENGX)
                wpeng[i] = Meta.parse(substr[i])
            end
            oper_pnt = OperatingPoint(constraints, mach_from_airspeed, 0.0,
                ground_image, parameters, wflap, wpeng)
            push!(oper_pnts,oper_pnt)
        end
        return oper_pnts
    end
end
