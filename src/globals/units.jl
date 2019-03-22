# wraps variables found in UNITS.INC for use in Julia

struct UNITS_s
    UNITL::Array{Float64,1}
    UNITM::Array{Float64,1}
    UNITT::Array{Float64,1}
    UNITF::Array{Float64,1}
    UNITP::Array{Float64,1}
    UNITH::Array{Float64,1}
    UNITE::Array{Float64,1}
    UNITV::Array{Float64,1}
    UNITA::Array{Float64,1}
    UNITS::Array{Float64,1}
    UNITI::Array{Float64,1}
    UNITB::Array{Float64,1}
    UNITD::Array{Float64,1}
    UNITR::Array{Float64,1}
    UNITQ::Array{Float64,1}
    UNITG::Array{Float64,1}
    UNITC::Array{Float64,1}
    UNCHL::Array{Cchar,1}
    UNCHM::Array{Cchar,1}
    UNCHT::Array{Cchar,1}
    UNCHF::Array{Cchar,1}
    UNCHP::Array{Cchar,1}
    UNCHH::Array{Cchar,1}
    UNCHE::Array{Cchar,1}
    UNCHV::Array{Cchar,1}
    UNCHA::Array{Cchar,1}
    UNCHS::Array{Cchar,1}
    UNCHI::Array{Cchar,1}
    UNCHB::Array{Cchar,1}
    UNCHD::Array{Cchar,1}
    UNCHR::Array{Cchar,1}
    UNCHQ::Array{Cchar,1}
    UNCHG::Array{Cchar,1}
    UNCHC::Array{Cchar,1}
    NUL::Array{Int32,1}
    NUM::Array{Int32,1}
    NUT::Array{Int32,1}
    NUF::Array{Int32,1}
    NUP::Array{Int32,1}
    NUH::Array{Int32,1}
    NUE::Array{Int32,1}
    NUV::Array{Int32,1}
    NUA::Array{Int32,1}
    NUS::Array{Int32,1}
    NUI::Array{Int32,1}
    NUB::Array{Int32,1}
    NUD::Array{Int32,1}
    NUR::Array{Int32,1}
    NUQ::Array{Int32,1}
    NUG::Array{Int32,1}
    NUC::Array{Int32,1}
    function UNITS_s()
        as_unr = cglobal((:as_unr_, libaswing), Float64); as_unr_idx = as_unr
        UNITL  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITM  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITT  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITF  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITP  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITH  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITE  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITV  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITA  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITS  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITI  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITB  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITD  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITR  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITQ  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITG  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)
        UNITC  = unsafe_wrap(Array, as_unr_idx, 1); as_unr_idx += sizeof(Float64)

        as_unc = cglobal((:as_unc_, libaswing), Cchar); as_unc_idx = as_unc
        UNCHL  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHM  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHT  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHF  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHP  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHH  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHE  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHV  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHA  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHS  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHI  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHB  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHD  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHR  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHQ  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHG  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32
        UNCHC  = unsafe_wrap(Array, as_unc_idx, 32); as_unc_idx += sizeof(Cchar)*32

        as_uni = cglobal((:as_uni_, libaswing), Int32); as_uni_idx = as_uni
        NUL  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUM  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUT  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUF  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUP  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUH  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUE  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUV  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUA  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUS  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUI  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUB  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUD  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUR  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUQ  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUG  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)
        NUC  = unsafe_wrap(Array, as_uni_idx, 1); as_uni_idx += sizeof(Int32)

        return new(UNITL, UNITM, UNITT, UNITF, UNITP, UNITH, UNITE,
            UNITV, UNITA, UNITS, UNITI, UNITB, UNITD, UNITR,
            UNITQ, UNITG, UNITC,
            UNCHL, UNCHM, UNCHT, UNCHF, UNCHP, UNCHH, UNCHE,
            UNCHV, UNCHA, UNCHS, UNCHI, UNCHB, UNCHD, UNCHR,
            UNCHQ, UNCHG, UNCHC,
            NUL,   NUM,   NUT,   NUF,   NUP,   NUH,   NUE,
            NUV,   NUA,   NUS,   NUI,   NUB,   NUD,   NUR,
            NUQ,   NUG,   NUC)
    end
end
