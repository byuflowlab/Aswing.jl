# wraps variables found in EIGEN.INC for use in Julia

const NEIGX = 300
const NFREQX = 120
const NZX = 18*IIX + NGVX + NGPX + NGFX
const NDFFX = NFLPX + NENGX + 2*NYGUSX-1

struct EIGEN_s
    LROM::Array{Bool,1}
    NVTOT::Array{Int32,1}
    NEIGEN::Array{Int32,1}
    NEIDAT::Array{Int32,1}
    IPEIG::OffsetArrays.OffsetArray{Int32,1,Array{Int32,1}}
    IPDAT::OffsetArrays.OffsetArray{Int32,1,Array{Int32,1}}
    IPFRQ::Array{Int32,1}
    NFREQ::Array{Int32,1}
    NFDAT::Array{Int32,1}
    NROM::Array{Int32,1}
    NROMC::Array{Int32,1}
    KROM::Array{Int32,1}
    ZESEED::Array{ComplexF64,1}
    ZLAMDA::OffsetArrays.OffsetArray{ComplexF64,1,Array{ComplexF64,1}}
    ZLADAT::OffsetArrays.OffsetArray{ComplexF64,1,Array{ComplexF64,1}}
    ZQEIG::OffsetArrays.OffsetArray{ComplexF64,2,Array{ComplexF64,2}}
    ZLEIG::OffsetArrays.OffsetArray{ComplexF64,2,Array{ComplexF64,2}}
    ZWB::Array{ComplexF64,2}
    ZWBC::Array{ComplexF64,2}
    ZROML::Array{ComplexF64,2}
    ZROMCL::Array{ComplexF64,2}
    ZROM::Array{ComplexF64,1}
    ZROMC::Array{ComplexF64,1}
    ZQ::Array{ComplexF64,2}
    ZPARAM::Array{ComplexF64,1}
    ZQSENS::Array{ComplexF64,2}
    ZQSENSF::Array{ComplexF64,3}
    ZAN::Array{ComplexF64,1}
    ZQJOIN::Array{ComplexF64,2}
    ZAFORCE::Array{ComplexF64,1}
    ZRFORCE::Array{ComplexF64,1}
    ZGFORCE::Array{ComplexF64,1}
    ZTFORCE::Array{ComplexF64,1}
    ZAMOMNT::Array{ComplexF64,1}
    ZRMOMNT::Array{ComplexF64,1}
    ZGMOMNT::Array{ComplexF64,1}
    ZTMOMNT::Array{ComplexF64,1}
    ZFLIFT::Array{ComplexF64,1}
    ZFDRAG::Array{ComplexF64,1}
    ZFUNS::OffsetArrays.OffsetArray{ComplexF64,3,Array{ComplexF64,3}}
    ZDATS::OffsetArrays.OffsetArray{ComplexF64,3,Array{ComplexF64,3}}
    ZQSFUNS::OffsetArrays.OffsetArray{ComplexF64,4,Array{ComplexF64,4}}
    ZQSDATS::OffsetArrays.OffsetArray{ComplexF64,4,Array{ComplexF64,4}}
    AQEIG::OffsetArrays.OffsetArray{Float64,1,Array{Float64,1}}
    EPHASE::Array{Float64,1}
    FREQ::OffsetArrays.OffsetArray{Float64,1,Array{Float64,1}}
    FDAT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    function EIGEN_s()
        as_eigl = cglobal((:as_eigl_, libaswing), Int32); as_eigl_idx = as_eigl
        LROM = unsafe_wrap(Array, as_eigl_idx, NEIGX)

        as_eigi = cglobal((:as_eigi_, libaswing), Int32); as_eigi_idx = as_eigi
        NVTOT = unsafe_wrap(Array, as_eigi_idx, 1); as_eigi_idx += sizeof(Int32)
        NEIGEN = unsafe_wrap(Array, as_eigi_idx, 1); as_eigi_idx += sizeof(Int32)
        NEIDAT = unsafe_wrap(Array, as_eigi_idx, 1); as_eigi_idx += sizeof(Int32)
        ipeig = unsafe_wrap(Array, as_eigi_idx, NEIGX+1); as_eigi_idx += sizeof(Int32)*(NEIGX+1)
        IPEIG = OffsetArrays.OffsetArray(ipeig, 0:NEIGX)
        ipdat = unsafe_wrap(Array, as_eigi_idx, NEIGX+1); as_eigi_idx += sizeof(Int32)*(NEIGX+1)
        IPDAT = OffsetArrays.OffsetArray(ipdat, 0:NEIGX)
        IPFRQ = unsafe_wrap(Array, as_eigi_idx, 1); as_eigi_idx += sizeof(Int32)
        NFREQ = unsafe_wrap(Array, as_eigi_idx, 1); as_eigi_idx += sizeof(Int32)
        NFDAT = unsafe_wrap(Array, as_eigi_idx, NDFFX); as_eigi_idx += sizeof(Int32)*NDFFX
        NROM = unsafe_wrap(Array, as_eigi_idx, 1); as_eigi_idx += sizeof(Int32)
        NROMC = unsafe_wrap(Array, as_eigi_idx, 1); as_eigi_idx += sizeof(Int32)
        KROM = unsafe_wrap(Array, as_eigi_idx, NEIGX)

        as_eigz = cglobal((:as_eigz_, libaswing), ComplexF64); as_eigz_idx = as_eigz
        ZESEED = unsafe_wrap(Array, as_eigz_idx, 1); as_eigz_idx += sizeof(ComplexF64)
        zlamda = unsafe_wrap(Array, as_eigz_idx, NEIGX+1); as_eigz_idx += sizeof(ComplexF64)*(NEIGX+1)
        ZLAMDA = OffsetArrays.OffsetArray(zlamda, 0:NEIGX)
        zladat = unsafe_wrap(Array, as_eigz_idx, NEIGX+1); as_eigz_idx += sizeof(ComplexF64)*(NEIGX+1)
        ZLADAT = OffsetArrays.OffsetArray(zladat, 0:NEIGX)
        zqeig = unsafe_wrap(Array, as_eigz_idx, (NZX, NEIGX+1)); as_eigz_idx += sizeof(ComplexF64)*NZX*(NEIGX+1)
        ZQEIG = OffsetArrays.OffsetArray(zqeig, 1:NZX, 0:NEIGX)
        zleig = unsafe_wrap(Array, as_eigz_idx, (NZX, NEIGX+1)); as_eigz_idx += sizeof(ComplexF64)*NZX*(NEIGX+1)
        ZLEIG = OffsetArrays.OffsetArray(zleig, 1:NZX, 0:NEIGX)
        ZWB = unsafe_wrap(Array, as_eigz_idx, (NEIGX, NFRPX)); as_eigz_idx += sizeof(ComplexF64)*NEIGX*NFRPX
        ZWBC = unsafe_wrap(Array, as_eigz_idx, (NEIGX, NFRPX)); as_eigz_idx += sizeof(ComplexF64)*NEIGX*NFRPX
        ZROML = unsafe_wrap(Array, as_eigz_idx, (NEIGX, NFRPX)); as_eigz_idx += sizeof(ComplexF64)*NEIGX*NFRPX
        ZROMCL = unsafe_wrap(Array, as_eigz_idx, (NEIGX, NFRPX)); as_eigz_idx += sizeof(ComplexF64)*NEIGX*NFRPX
        ZROM = unsafe_wrap(Array, as_eigz_idx, NEIGX); as_eigz_idx += sizeof(ComplexF64)*NEIGX
        ZROMC = unsafe_wrap(Array, as_eigz_idx, NEIGX); as_eigz_idx += sizeof(ComplexF64)*NEIGX
        ZQ = unsafe_wrap(Array, as_eigz_idx, (18, IIX)); as_eigz_idx += sizeof(ComplexF64)*18*IIX
        ZPARAM = unsafe_wrap(Array, as_eigz_idx, KPTOT); as_eigz_idx += sizeof(ComplexF64)*KPTOT
        ZQSENS = unsafe_wrap(Array, as_eigz_idx, (KSTOT, NSENX)); as_eigz_idx += sizeof(ComplexF64)*KSTOT*NSENX
        ZQSENSF = unsafe_wrap(Array, as_eigz_idx, (KSTOT, NSENX, NFRPX)); as_eigz_idx += sizeof(ComplexF64)*KSTOT*NSENX*NFRPX
        ZAN = unsafe_wrap(Array, as_eigz_idx, NNX); as_eigz_idx += sizeof(ComplexF64)*NNX
        ZQJOIN = unsafe_wrap(Array, as_eigz_idx, (12, NJX)); as_eigz_idx += sizeof(ComplexF64)*12*NJX
        ZAFORCE = unsafe_wrap(Array, as_eigz_idx, 3); as_eigz_idx += sizeof(ComplexF64)*3
        ZRFORCE = unsafe_wrap(Array, as_eigz_idx, 3); as_eigz_idx += sizeof(ComplexF64)*3
        ZGFORCE = unsafe_wrap(Array, as_eigz_idx, 3); as_eigz_idx += sizeof(ComplexF64)*3
        ZTFORCE = unsafe_wrap(Array, as_eigz_idx, 3); as_eigz_idx += sizeof(ComplexF64)*3
        ZAMOMNT = unsafe_wrap(Array, as_eigz_idx, 3); as_eigz_idx += sizeof(ComplexF64)*3
        ZRMOMNT = unsafe_wrap(Array, as_eigz_idx, 3); as_eigz_idx += sizeof(ComplexF64)*3
        ZGMOMNT = unsafe_wrap(Array, as_eigz_idx, 3); as_eigz_idx += sizeof(ComplexF64)*3
        ZTMOMNT = unsafe_wrap(Array, as_eigz_idx, 3); as_eigz_idx += sizeof(ComplexF64)*3
        ZFLIFT = unsafe_wrap(Array, as_eigz_idx, 1); as_eigz_idx += sizeof(ComplexF64)
        ZFDRAG = unsafe_wrap(Array, as_eigz_idx, 1); as_eigz_idx += sizeof(ComplexF64)
        zfuns = unsafe_wrap(Array, as_eigz_idx, (NFREQX+1, KPTOT, NDFFX)); as_eigz_idx += sizeof(ComplexF64)*(NFREQX+1)*KPTOT*NDFFX
        ZFUNS = OffsetArrays.OffsetArray(zfuns, 0:NFREQX, 1:KPTOT, 1:NDFFX)
        zdats = unsafe_wrap(Array, as_eigz_idx, (NFREQX+1, KPTOT, NDFFX)); as_eigz_idx += sizeof(ComplexF64)*(NFREQX+1)*KPTOT*NDFFX
        ZDATS = OffsetArrays.OffsetArray(zdats, 0:NFREQX, 1:KPTOT, 1:NDFFX)
        zqsfuns = unsafe_wrap(Array, as_eigz_idx, (NFREQX+1, KSTOT, NSENX, NDFFX)); as_eigz_idx += sizeof(ComplexF64)*(NFREQX+1)*KSTOT*NSENX*NDFFX
        ZQSFUNS = OffsetArrays.OffsetArray(zqsfuns, 0:NFREQX, 1:KSTOT, 1:NSENX, 1:NDFFX)
        zqsdats = unsafe_wrap(Array, as_eigz_idx, (NFREQX+1, KSTOT, NSENX, NDFFX)); as_eigz_idx += sizeof(ComplexF64)*(NFREQX+1)*KSTOT*NSENX*NDFFX
        ZQSDATS = OffsetArrays.OffsetArray(zqsdats, 0:NFREQX, 1:KSTOT, 1:NSENX, 1:NDFFX)

        as_eigr = cglobal((:as_eigr_, libaswing), Float64); as_eigr_idx = as_eigr
        aqeig = unsafe_wrap(Array, as_eigr_idx, (NEIGX+1)); as_eigr_idx += sizeof(Float64)*(NEIGX+1)
        AQEIG = OffsetArrays.OffsetArray(aqeig, 0:NEIGX)
        EPHASE = unsafe_wrap(Array, as_eigr_idx, 1); as_eigr_idx += sizeof(Float64)
        freq = unsafe_wrap(Array, as_eigr_idx, (NFREQX+1)); as_eigr_idx += sizeof(Float64)*(NFREQX+1)
        FREQ = OffsetArrays.OffsetArray(freq, 0:NFREQX)
        fdat = unsafe_wrap(Array, as_eigr_idx, (NFREQX+1, NDFFX))
        FDAT = OffsetArrays.OffsetArray(fdat, 0:NFREQX, 1:NDFFX)

        return new(LROM, NVTOT, NEIGEN, NEIDAT, IPEIG,
            IPDAT, IPFRQ, NFREQ, NFDAT, NROM, NROMC, KROM, ZESEED, ZLAMDA,
            ZLADAT, ZQEIG, ZLEIG, ZWB, ZWBC, ZROML, ZROMCL, ZROM, ZROMC, ZQ,
            ZPARAM, ZQSENS, ZQSENSF, ZAN, ZQJOIN, ZAFORCE, ZRFORCE, ZGFORCE,
            ZTFORCE, ZAMOMNT, ZRMOMNT, ZGMOMNT, ZTMOMNT, ZFLIFT, ZFDRAG, ZFUNS,
            ZDATS, ZQSFUNS, ZQSDATS, AQEIG, EPHASE, FREQ, FDAT)
    end
end
