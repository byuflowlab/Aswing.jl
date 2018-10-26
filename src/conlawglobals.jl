const NUPDIM1 = 11
const NUPDIM2 = 10
const NQPDIM1 = 6
const NQPDIM2 = 5

struct CONLAW_s
    NUPAR1::Array{Int32,2}
    NUPAR2::Array{Int32,2}
    NQPAR1::Array{Int32,3}
    NQPAR2::Array{Int32,3}
    CU::Array{Float64,4}
    UPAR1::Array{Float64,3}
    UPAR2::Array{Float64,3}
    CQ::Array{Float64,5}
    QPAR1::Array{Float64,4}
    QPAR2::Array{Float64,4}
    DFREQ::Array{Float64,1}
    DELTA::Array{Float64,1}
    function CONLAW_s()
        as_cmati = cglobal((:as_cmati_, libaswing), Int32); as_cmati_idx = as_cmati
        NUPAR1   = unsafe_wrap(Array, as_cmati_idx, (NDDIM,NUDIM)); as_cmati_idx += sizeof(Int32)*NDDIM*NUDIM
        NUPAR2   = unsafe_wrap(Array, as_cmati_idx, (NDDIM,NUDIM)); as_cmati_idx += sizeof(Int32)*NDDIM*NUDIM
        NQPAR1   = unsafe_wrap(Array, as_cmati_idx, (NDDIM,NQDIM,NSENX)); as_cmati_idx += sizeof(Int32)*NDDIM*NQDIM*NSENX
        NQPAR2   = unsafe_wrap(Array, as_cmati_idx, (NDDIM,NQDIM,NSENX))

        as_cmatr = cglobal((:as_cmatr_, libaswing), Float64); as_cmatr_idx = as_cmatr
        CU       = unsafe_wrap(Array, as_cmatr_idx, (NDDIM,NUDIM,NUPDIM1,NUPDIM2)); as_cmatr_idx += sizeof(Float64)*NDDIM*NUDIM*NUPDIM1*NUPDIM2
        UPAR1    = unsafe_wrap(Array, as_cmatr_idx, (NDDIM,NUDIM,NUPDIM1)); as_cmatr_idx += sizeof(Float64)*NDDIM*NUDIM*NUPDIM1
        UPAR2    = unsafe_wrap(Array, as_cmatr_idx, (NDDIM,NUDIM,NUPDIM2)); as_cmatr_idx += sizeof(Float64)*NDDIM*NUDIM*NUPDIM2
        CQ       = unsafe_wrap(Array, as_cmatr_idx, (NDDIM,NQDIM,NSENX,NQPDIM1,NQPDIM2)); as_cmatr_idx += sizeof(Float64)*NDDIM*NQDIM*NSENX*NQPDIM1*NQPDIM2
        QPAR1    = unsafe_wrap(Array, as_cmatr_idx, (NDDIM,NQDIM,NSENX,NQPDIM1)); as_cmatr_idx += sizeof(Float64)*NDDIM*NQDIM*NSENX*NQPDIM1
        QPAR2    = unsafe_wrap(Array, as_cmatr_idx, (NDDIM,NQDIM,NSENX,NQPDIM2)); as_cmatr_idx += sizeof(Float64)*NDDIM*NQDIM*NSENX*NQPDIM2
        DFREQ    = unsafe_wrap(Array, as_cmatr_idx, (NDDIM)); as_cmatr_idx += sizeof(Float64)*NDDIM
        DELTA    = unsafe_wrap(Array, as_cmatr_idx, (NDDIM));

        new(NUPAR1, NUPAR2, NQPAR1, NQPAR2, CU, UPAR1, UPAR2, CQ, QPAR1, QPAR2,
            DFREQ, DELTA)
    end
end
