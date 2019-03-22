# wraps variables found in ASWING.INC for use in Julia

struct ASWING_s
    PI::Array{Float64,1}
    DTOR::Array{Float64,1}
    VERSION::Array{Float64,1}
    STIPL::Array{Float64,1}
    STIPR::Array{Float64,1}
    TBTIPL::Array{Float64,1}
    TBTIPR::Array{Float64,1}
    MACHPG::Array{Float64,1}
    GEEW::Array{Float64,1}
    SREF::Array{Float64,1}
    CREF::Array{Float64,1}
    BREF::Array{Float64,1}
    XYZREF::Array{Float64,2}
    BGREFX::Array{Float64,1}
    BGREFY::Array{Float64,1}
    BGREFZ::Array{Float64,1}
    ULCON::Array{Float64,1}
    GRNORM::Array{Float64,1}
    VSOSL::Array{Float64,1}
    VSO_SI::Array{Float64,1}
    VSOSL_SI::Array{Float64,1}
    RHOSL::Array{Float64,1}
    RHO_SI::Array{Float64,1}
    RHOSL_SI::Array{Float64,1}
    RMUSL::Array{Float64,1}
    RMU_SI::Array{Float64,1}
    RMUSL_SI::Array{Float64,1}
    EXPII::Array{Float64,1}
    EXPNN::Array{Float64,1}
    LALTKM::Array{Int32,1}
    AUTSCL::Array{Int32,1}
    LTERSE::Array{Int32,1}
    LVLFIX::Array{Int32,1}
    LAELAG::Array{Int32,1}
    LLEVEC::Array{Int32,1}
    STEADY::Array{Int32,1}
    CONLAW::Array{Int32,1}
    CONSET::Array{Int32,1}
    LFGUST::Array{Int32,1}
    LROMFR::Array{Int32,1}
    LVISEN::Array{Int32,1}
    LLGROU::Array{Int32,1}
    LLREFP::Array{Int32,1}
    LAXPLT::Array{Int32,1}
    LELIST::Array{Int32,1}
    LENGLI::Array{Int32,1}
    LESPEC::Array{Int32,1}
    LNODES::Array{Int32,1}
    LUNSWP::Array{Int32,1}
    LPLRIB::Array{Int32,1}
    LPLZLO::Array{Int32,1}
    LPLBAR::Array{Int32,1}
    LFRPAN::Array{Int32,1}
    LFRROT::Array{Int32,1}
    LGEOM::Array{Int32,1}
    LLRHS::Array{Int32,1}
    LVAIC::Array{Int32,1}
    LWSET::Array{Int32,1}
    LCSET::Array{Int32,1}
    LQBDEF::Array{Int32,2}
    LBSYMM::OffsetArrays.OffsetArray{Int32,2,Array{Int32,2}}
    LSFLAP::Array{Int32,1}
    LSPENG::Array{Int32,1}
    LSSENS::Array{Int32,1}
    LQINI::Array{Int32,1}
    LAINI::Array{Int32,1}
    LCONV::Array{Int32,1}
    LMACH::Array{Int32,1}
    PSTEADY::Array{Int32,1}
    LPBEAM::Array{Int32,1}
    LPWAKE::Array{Int32,1}
    LDCON::Array{Int32,1}
    LUCON::Array{Int32,1}
    LQCON::Array{Int32,2}
    NQ::Array{Int32,1}
    NCP::Array{Int32,1}
    IBEAM::Array{Int32,1}
    IICON::Array{Int32,1}
    II::Array{Int32,1}
    IFRST::Array{Int32,1}
    ILAST::Array{Int32,1}
    IITOT::Array{Int32,1}
    NNCON::Array{Int32,1}
    NN::Array{Int32,1}
    NFRST::Array{Int32,1}
    NLAST::Array{Int32,1}
    NNTOT::Array{Int32,1}
    KEQ0::Array{Int32,2}
    KEQ::Array{Int32,2}
    NRHS::Array{Int32,1}
    NGVAR::Array{Int32,1}
    NGPAR::Array{Int32,1}
    NGFOR::Array{Int32,1}
    NGFEQ::Array{Int32,1}
    NFRP::Array{Int32,1}
    NFRPF::Array{Int32,1}
    NFRPR::Array{Int32,1}
    NBEAM::Array{Int32,1}
    NFUSE::Array{Int32,1}
    NSURF::Array{Int32,1}
    ICOORD::Array{Int32,1}
    IENGTYP::Array{Int32,1}
    IGUSDIR::Array{Int32,1}
    NXGUST::Array{Int32,1}
    NYGUST::Array{Int32,1}
    NZGUST::Array{Int32,1}
    NFGUST::Array{Int32,1}
    IGRIM::Array{Int32,1}
    LRES::Array{Int32,1}
    LQJOIN::Array{Int32,2}
    LAN::Array{Int32,1}
    LHEAD::Array{Int32,1}
    LELEV::Array{Int32,1}
    LBANK::Array{Int32,1}
    LVAC::Array{Int32,1}
    LRAC::Array{Int32,1}
    LVEL::Array{Int32,1}
    LROT::Array{Int32,1}
    LPOS::Array{Int32,1}
    LFLAP::Array{Int32,1}
    LPENG::Array{Int32,1}
    LVIDT::Array{Int32,1}
    LALDT::Array{Int32,1}
    LBEDT::Array{Int32,1}
    LHEDT::Array{Int32,1}
    LELDT::Array{Int32,1}
    LBADT::Array{Int32,1}
    LWDT::Array{Int32,1}
    LADT::Array{Int32,1}
    LVIDTS::Array{Int32,1}
    LALDTS::Array{Int32,1}
    LBEDTS::Array{Int32,1}
    LHEDTS::Array{Int32,1}
    LELDTS::Array{Int32,1}
    LBADTS::Array{Int32,1}
    LWDTS::Array{Int32,2}
    LADTS::Array{Int32,2}
    LFRPK::Array{Int32,1}
    KFRPL::Array{Int32,1}
    LFLAPF::Array{Int32,1}
    LPENGF::Array{Int32,1}
    LGUS1F::Array{Int32,1}
    LGUS2F::Array{Int32,1}
    LGUS3F::Array{Int32,1}
    LGUS4F::Array{Int32,1}
    VGI_FRP::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    AFORCE::Array{Float64,1}
    RFORCE::Array{Float64,1}
    EFORCE::Array{Float64,1}
    GFORCE::Array{Float64,1}
    TFORCE::Array{Float64,1}
    AMOMNT::Array{Float64,1}
    RMOMNT::Array{Float64,1}
    EMOMNT::Array{Float64,1}
    GMOMNT::Array{Float64,1}
    TMOMNT::Array{Float64,1}
    AFOR_Q::Array{Float64,3}
    AFOR_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    AFOR_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    AMOM_Q::Array{Float64,3}
    AMOM_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    AMOM_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    RFOR_Q::Array{Float64,3}
    RFOR_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    RFOR_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    RMOM_Q::Array{Float64,3}
    RMOM_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    RMOM_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    EFOR_Q::Array{Float64,3}
    EFOR_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    EFOR_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    EMOM_Q::Array{Float64,3}
    EMOM_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    EMOM_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GFOR_Q::Array{Float64,3}
    GFOR_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GFOR_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GMOM_Q::Array{Float64,3}
    GMOM_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GMOM_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    AFOR_UT::Array{Float64,3}
    AFOR_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    AMOM_UT::Array{Float64,3}
    AMOM_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    RFOR_UT::Array{Float64,3}
    RFOR_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    RMOM_UT::Array{Float64,3}
    RMOM_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    EFOR_UT::Array{Float64,3}
    EFOR_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    EMOM_UT::Array{Float64,3}
    EMOM_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GFOR_UT::Array{Float64,3}
    GFOR_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GMOM_UT::Array{Float64,3}
    GMOM_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    FAERO::Array{Float64,1}
    FAERO_Q::Array{Float64,3}
    FAERO_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    FAERO_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    FAERO_UT::Array{Float64,3}
    FAERO_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    MAERO::Array{Float64,1}
    MAERO_Q::Array{Float64,3}
    MAERO_GL::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    MAERO_FRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    MAERO_UT::Array{Float64,3}
    MAERO_GLT::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    DVENG::Array{Float64,2}
    XENG::Array{Float64,3}
    XENG_ANG::Array{Float64,3}
    RENG::Array{Float64,3}
    RENG_ANG::Array{Float64,3}
    VENG::Array{Float64,3}
    VENG_Q::Array{Float64,3}
    VENG_GL::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    FENG::Array{Float64,3}
    FENG_Q::Array{Float64,3}
    FENG_GL::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    MENG::Array{Float64,3}
    MENG_Q::Array{Float64,3}
    MENG_GL::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    MASS::Array{Float64,1}
    MASSP::Array{Float64,1}
    MASSB::Array{Float64,1}
    AREAB::Array{Float64,1}
    RCGXYZ0::Array{Float64,1}
    RMASST0::Array{Float64,2}
    RINERT0::Array{Float64,2}
    RCGXYZ::Array{Float64,2}
    RMASST::Array{Float64,3}
    RINERT::Array{Float64,3}
    PCGXYZ0::Array{Float64,1}
    PMASST0::Array{Float64,2}
    PINERT0::Array{Float64,2}
    PCGXYZ::Array{Float64,2}
    PMASST::Array{Float64,3}
    PINERT::Array{Float64,3}
    AMASST0::Array{Float64,2}
    AINERT0::Array{Float64,2}
    AMASST::Array{Float64,3}
    AINERT::Array{Float64,3}
    RCGXYZB0::Array{Float64,2}
    RMASSTB0::Array{Float64,3}
    AMASSTB0::Array{Float64,3}
    RINERTB0::Array{Float64,3}
    AINERTB0::Array{Float64,3}
    RCGXYZB::Array{Float64,3}
    RMASSTB::Array{Float64,4}
    RINERTB::Array{Float64,4}
    AMASSTB::Array{Float64,4}
    AINERTB::Array{Float64,4}
    QPYLO::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    TB::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    QB::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    QBT::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    TJOIN::Array{Float64,2}
    TGROU::Array{Float64,1}
    SBRK::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    TBFIL::Array{Float64,1}
    QBFIL::Array{Float64,1}
    QBTFIL::Array{Float64,1}
    ANGJ::Array{Float64,2}
    ANGJM::Array{Float64,2}
    MOMJ::Array{Float64,2}
    HJAX::Array{Float64,2}
    NB::OffsetArrays.OffsetArray{Int32,2,Array{Int32,2}}
    KBTYPE::Array{Int32,1}
    KBNUM::Array{Int32,1}
    KBPYLO::Array{Int32,1}
    KBJOIN::Array{Int32,2}
    KBGROU::Array{Int32,1}
    NPYLO::Array{Int32,1}
    ISPYLO::Array{Int32,1}
    IPYLO::Array{Int32,1}
    KPTYPE::Array{Int32,1}
    ISSENS::Array{Int32,1}
    ISENS::Array{Int32,1}
    NJOIN::Array{Int32,1}
    ISJOIN::Array{Int32,2}
    IJOIN::Array{Int32,2}
    KJTYPE::Array{Int32,1}
    NGROU::Array{Int32,1}
    ISGROU::Array{Int32,1}
    IGROU::Array{Int32,1}
    KGTYPE::Array{Int32,1}
    NCORN::Array{Int32,1}
    ISCORN::Array{Int32,1}
    ICORN::Array{Int32,1}
    JBCORN::Array{Int32,1}
    IBCORN::Array{Int32,1}
    NBRK::Array{Int32,1}
    IBRK::OffsetArrays.OffsetArray{Int32,2,Array{Int32,2}}
    JFIL::Array{Int32,1}
    ISFIL::Array{Int32,1}
    NBFIL::Array{Int32,1}
    NANGJ::Array{Int32,1}
    QSNSP::Array{Float64,3}
    QSENS::Array{Float64,3}
    QSENS_Q::Array{Float64,3}
    QSENS_QT::Array{Float64,3}
    QSENS_GL::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    QSENS_GLT::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    QSENS_FRP::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    TPMAT::Array{Float64,3}
    VIWIND::Array{Float64,1}
    ALWIND::Array{Float64,1}
    BEWIND::Array{Float64,1}
    VIW_VEL::Array{Float64,1}
    ALW_VEL::Array{Float64,1}
    BEW_VEL::Array{Float64,1}
    Q::Array{Float64,3}
    Q0::Array{Float64,2}
    QPAR::Array{Float64,2}
    S::Array{Float64,1}
    THET::Array{Float64,1}
    SPLT::Array{Float64,1}
    TBI::Array{Float64,1}
    SCP::Array{Float64,1}
    XYZTFZ::Array{Float64,2}
    XYZTFZI::Array{Float64,2}
    PARAM::Array{Float64,2}
    AN::Array{Float64,2}
    PSPEC::Array{Float64,2}
    PSPECSET::Array{Float64,2}
    WFLAP::Array{Float64,2}
    WPENG::Array{Float64,2}
    QJOIN::Array{Float64,3}
    QPNT::Array{Float64,3}
    DTIME::Array{Float64,1}
    TIME::Array{Float64,1}
    QTWT::OffsetArrays.OffsetArray{Float64,1,Array{Float64,1}}
    RDOT::Array{Float64,2}
    UDOT::Array{Float64,2}
    PSDOT::Array{Float64,1}
    ANDOT::Array{Float64,1}
    QSDOT::Array{Float64,2}
    AKGUST::Array{Float64,2}
    ALGUST::Array{Float64,2}
    VFGUST::Array{Float64,3}
    NPOINT::Array{Int32,1}
    IPOINT::Array{Int32,1}
    NPTIME::Array{Int32,1}
    IPNTD::Array{Int32,1}
    IPNTVL::Array{Int32,1}
    KCSET::Array{Int32,1}
    IQEXP::Array{Int32,3}
    IPPAR::Array{Int32,2}
    IPPARSET::Array{Int32,2}
    ANF::Array{Float64,2}
    RCCORE::Array{Float64,1}
    VIB::Array{Float64,2}
    WIB::Array{Float64,2}
    VEB::Array{Float64,2}
    VIC::Array{Float64,2}
    WIC::Array{Float64,2}
    VEC::Array{Float64,2}
    VIP::Array{Float64,2}
    WIP::Array{Float64,2}
    VEP::Array{Float64,2}
    VIB_MA::Array{Float64,2}
    WIB_MA::Array{Float64,2}
    VIC_MA::Array{Float64,2}
    WIC_MA::Array{Float64,2}
    VIP_MA::Array{Float64,2}
    WIP_MA::Array{Float64,2}
    VIB_AL::Array{Float64,2}
    WIB_AL::Array{Float64,2}
    VEB_AL::Array{Float64,2}
    VIC_AL::Array{Float64,2}
    WIC_AL::Array{Float64,2}
    VEC_AL::Array{Float64,2}
    VIP_AL::Array{Float64,2}
    WIP_AL::Array{Float64,2}
    VEP_AL::Array{Float64,2}
    VIB_BE::Array{Float64,2}
    WIB_BE::Array{Float64,2}
    VEB_BE::Array{Float64,2}
    VIC_BE::Array{Float64,2}
    WIC_BE::Array{Float64,2}
    VEC_BE::Array{Float64,2}
    VIP_BE::Array{Float64,2}
    WIP_BE::Array{Float64,2}
    VEP_BE::Array{Float64,2}
    VIB_POS::Array{Float64,3}
    WIB_POS::Array{Float64,3}
    VIC_POS::Array{Float64,3}
    WIC_POS::Array{Float64,3}
    VIP_POS::Array{Float64,3}
    WIP_POS::Array{Float64,3}
    VIB_EUL::Array{Float64,3}
    WIB_EUL::Array{Float64,3}
    VIC_EUL::Array{Float64,3}
    WIC_EUL::Array{Float64,3}
    VIP_EUL::Array{Float64,3}
    WIP_EUL::Array{Float64,3}
    VIB_AN::Array{Float64,3}
    WIB_VI::Array{Float64,2}
    VIC_AN::Array{Float64,3}
    WIC_VI::Array{Float64,2}
    VIP_AN::Array{Float64,3}
    WIP_VI::Array{Float64,2}
    VEB_XENG::Array{Float64,4}
    VEB_RENG::Array{Float64,4}
    VEC_XENG::Array{Float64,4}
    VEC_RENG::Array{Float64,4}
    VEP_XENG::Array{Float64,4}
    VEP_RENG::Array{Float64,4}
    VEB_VENG::Array{Float64,4}
    VEC_VENG::Array{Float64,4}
    VEP_VENG::Array{Float64,4}
    VEB_FENG::Array{Float64,4}
    VEB_MENG::Array{Float64,4}
    VEC_FENG::Array{Float64,4}
    VEC_MENG::Array{Float64,4}
    VEP_FENG::Array{Float64,4}
    VEP_MENG::Array{Float64,4}
    VIB_AN_MA::Array{Float64,3}
    WIB_VI_MA::Array{Float64,2}
    VIC_AN_MA::Array{Float64,3}
    WIC_VI_MA::Array{Float64,2}
    VIP_AN_MA::Array{Float64,3}
    WIP_VI_MA::Array{Float64,2}
    VIB_AN_AL::Array{Float64,3}
    WIB_VI_AL::Array{Float64,2}
    VIC_AN_AL::Array{Float64,3}
    WIC_VI_AL::Array{Float64,2}
    VIP_AN_AL::Array{Float64,3}
    WIP_VI_AL::Array{Float64,2}
    VIB_AN_BE::Array{Float64,3}
    WIB_VI_BE::Array{Float64,2}
    VIC_AN_BE::Array{Float64,3}
    WIC_VI_BE::Array{Float64,2}
    VIP_AN_BE::Array{Float64,3}
    WIP_VI_BE::Array{Float64,2}
    VIB_AN_POS::Array{Float64,4}
    WIB_VI_POS::Array{Float64,3}
    VIC_AN_POS::Array{Float64,4}
    WIC_VI_POS::Array{Float64,3}
    VIP_AN_POS::Array{Float64,4}
    WIP_VI_POS::Array{Float64,3}
    VIB_AN_EUL::Array{Float64,4}
    WIB_VI_EUL::Array{Float64,3}
    VIC_AN_EUL::Array{Float64,4}
    WIC_VI_EUL::Array{Float64,3}
    VIP_AN_EUL::Array{Float64,4}
    WIP_VI_EUL::Array{Float64,3}
    VEB_GL::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    VEC_GL::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    VEP_GL::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    AJSAV::Array{Float64,3}
    CJSAV::Array{Float64,3}
    RJSAV::Array{Float64,3}
    ATJSAV::Array{Float64,3}
    CTJSAV::Array{Float64,3}
    RTJSAV::Array{Float64,3}
    RFRPJSAV::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    A::Array{Float64,3}
    B::Array{Float64,3}
    C::Array{Float64,3}
    R::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    AT::Array{Float64,3}
    BT::Array{Float64,3}
    CT::Array{Float64,3}
    RT::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    RFRP::OffsetArrays.OffsetArray{Float64,3,Array{Float64,3}}
    GVSYS::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GPSYS::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GFSYS::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GVSYST::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GPSYST::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GFSYST::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GVQ::Array{Float64,2}
    GPQ::Array{Float64,2}
    GFQ::Array{Float64,2}
    GVQT::Array{Float64,2}
    GPQT::Array{Float64,2}
    GFQT::Array{Float64,2}
    GVFRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GPFRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GFFRP::OffsetArrays.OffsetArray{Float64,2,Array{Float64,2}}
    GFLSQ::Array{Float64,2}
    WLSQ::Array{Float64,1}
    ZA::Array{ComplexF64,3}
    ZB::Array{ComplexF64,3}
    ZC::Array{ComplexF64,3}
    ZR::OffsetArrays.OffsetArray{ComplexF64,3,Array{ComplexF64,3}}
    ZGVSYS::OffsetArrays.OffsetArray{ComplexF64,2,Array{ComplexF64,2}}
    ZGPSYS::OffsetArrays.OffsetArray{ComplexF64,2,Array{ComplexF64,2}}
    ZGFSYS::OffsetArrays.OffsetArray{ComplexF64,2,Array{ComplexF64,2}}
    ZGVQ::Array{ComplexF64,2}
    ZGPQ::Array{ComplexF64,2}
    ZGFQ::Array{ComplexF64,2}
    NGVQ::Array{Int32,1}
    KGVQ::Array{Int32,1}
    IGVQ::Array{Int32,1}
    NGPQ::Array{Int32,1}
    KGPQ::Array{Int32,1}
    IGPQ::Array{Int32,1}
    NGFQ::Array{Int32,1}
    KGFQ::Array{Int32,1}
    IGFQ::Array{Int32,1}
    NGVQZ::Array{Int32,1}
    KGVQZ::Array{Int32,1}
    IGVQZ::Array{Int32,1}
    NGPQZ::Array{Int32,1}
    KGPQZ::Array{Int32,1}
    IGPQZ::Array{Int32,1}
    NGFQZ::Array{Int32,1}
    KGFQZ::Array{Int32,1}
    IGFQZ::Array{Int32,1}
    NGVQ1::Array{Int32,1}
    NGPQ1::Array{Int32,1}
    NGFQ1::Array{Int32,1}
    IGVPIV::Array{Int32,1}
    IGPPIV::Array{Int32,1}
    IGFPIV::Array{Int32,1}
    ITER::Array{Int32,1}
    ITMAX::Array{Int32,1}
    NEIGIT::Array{Int32,1}
    EPS::Array{Float64,1}
    DELRMS::Array{Float64,1}
    DELMAX::Array{Float64,1}
    DGLOB::OffsetArrays.OffsetArray{Float64,1,Array{Float64,1}}
    DQ::Array{Float64,2}
    ARGP1::Array{Cchar,1}
    ARGP2::Array{Cchar,1}
    PREFIX::Array{Cchar,1}
    NAME::Array{Cchar,1}
    ANAME::Array{Array{Cchar,1}}
    BNAME::Array{Array{Cchar,1}}
    CNAME::Array{Array{Cchar,1}}
    CUNIT::Array{Array{Cchar,1}}
    CKEY::Array{Array{Cchar,1}}
    RNAME::Array{Array{Cchar,1}}
    RUNIT::Array{Array{Cchar,1}}
    RKEY::Array{Array{Cchar,1}}
    IDEV::Array{Int32,1}
    IDEVRP::Array{Int32,1}
    IDEVM::Array{Int32,1}
    IPSLU::Array{Int32,1}
    NCOLOR::Array{Int32,1}
    NBFREQ::Array{Int32,1}
    NBEIGEN::Array{Int32,1}
    NFRAME::Array{Int32,1}
    IVGCUT::Array{Int32,1}
    IVGFUN::Array{Int32,1}
    ILINE::Array{Int32,1}
    ICOLOR::Array{Int32,1}
    ICOLB::Array{Int32,1}
    ICOLF::Array{Int32,1}
    LPLOT::Array{Int32,1}
    LPGRID::Array{Int32,1}
    LCEDPL::Array{Int32,1}
    LSVMOV::Array{Int32,1}
    SCRNFL::Array{Float64,1}
    SCRNFP::Array{Float64,1}
    SIZE::Array{Float64,1}
    CSIZ::Array{Float64,1}
    XWIND::Array{Float64,1}
    YWIND::Array{Float64,1}
    AZIMOB::Array{Float64,1}
    ELEVOB::Array{Float64,1}
    ROBINV::Array{Float64,1}
    XYZUP::Array{Float64,1}
    WAKLFR::Array{Float64,1}
    SAXLFR::Array{Float64,1}
    SLOMOF::Array{Float64,1}
    EIGENF::Array{Float64,1}
    TMOVIE::Array{Float64,1}
    TIME1::Array{Float64,1}
    TIME2::Array{Float64,1}
    DPHASE::Array{Float64,1}
    SCALEF::Array{Float64,1}
    DTDUMP::Array{Float64,1}
    BFREQ1::Array{Float64,1}
    BFREQ2::Array{Float64,1}
    VGCXYZ::Array{Float64,1}
    VGCLIM::Array{Float64,2}
    CL_VEL::Array{Float64,2}
    CM_VEL::Array{Float64,2}
    CN_VEL::Array{Float64,2}
    CR_VEL::Array{Float64,2}
    CL_ROT::Array{Float64,2}
    CM_ROT::Array{Float64,2}
    CN_ROT::Array{Float64,2}
    CR_ROT::Array{Float64,2}
    FOR_VEL::Array{Float64,3}
    MOM_VEL::Array{Float64,3}
    FOR_ROT::Array{Float64,3}
    MOM_ROT::Array{Float64,3}
    FOR_FLAP::Array{Float64,3}
    MOM_FLAP::Array{Float64,3}
    FOR_PENG::Array{Float64,3}
    MOM_PENG::Array{Float64,3}
    JEDIT::Array{Int32,1}
    ISEDIT::Array{Int32,1}
    LSLOPE::Array{Int32,1}
    LEDSYM::OffsetArrays.OffsetArray{Int32,2,Array{Int32,2}}
    EDPAR::Array{Float64,1}
    TOFFE::Array{Float64,1}
    TFACE::Array{Float64,1}
    QOFFE::Array{Float64,1}
    QFACE::Array{Float64,1}
    TBMIN::Array{Float64,1}
    TBMAX::Array{Float64,1}
    DELTB::Array{Float64,1}
    QBMIN::Array{Float64,1}
    QBMAX::Array{Float64,1}
    DELQB::Array{Float64,1}
    IGUST::Array{Int32,1}
    VGCON::Array{Float64,1}
    function ASWING_s()
        as_con = cglobal((:as_con_, libaswing), Float64); as_con_idx = as_con
        PI      = unsafe_wrap(Array, as_con_idx, 1); as_con_idx += sizeof(Float64)
        DTOR    = unsafe_wrap(Array, as_con_idx, 1); as_con_idx += sizeof(Float64)
        VERSION = unsafe_wrap(Array, as_con_idx, 1)

        as_par = cglobal((:as_par_, libaswing), Float64); as_par_idx = as_par
        STIPL  = unsafe_wrap(Array, as_par_idx, NBX); as_par_idx += sizeof(Float64)*NBX
        STIPR  = unsafe_wrap(Array, as_par_idx, NBX); as_par_idx += sizeof(Float64)*NBX
        TBTIPL = unsafe_wrap(Array, as_par_idx, NBX); as_par_idx += sizeof(Float64)*NBX
        TBTIPR = unsafe_wrap(Array, as_par_idx, NBX); as_par_idx += sizeof(Float64)*NBX
        MACHPG = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        GEEW   = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        SREF   = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        CREF   = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        BREF   = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        XYZREF = unsafe_wrap(Array, as_par_idx, (3,3)); as_par_idx += sizeof(Float64)*3*3
        BGREFX = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        BGREFY = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        BGREFZ = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        ULCON = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        GRNORM = unsafe_wrap(Array, as_par_idx, 3); as_par_idx += sizeof(Float64)*3
        VSOSL = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        VSO_SI = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        VSOSL_SI = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        RHOSL = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        RHO_SI = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        RHOSL_SI = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        RMUSL = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        RMU_SI = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        RMUSL_SI = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        EXPII = unsafe_wrap(Array, as_par_idx, 1); as_par_idx += sizeof(Float64)
        EXPNN = unsafe_wrap(Array, as_par_idx, 1)

        as_log = cglobal((:as_log_, libaswing), Int32); as_log_idx = as_log
        LALTKM  = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        AUTSCL  = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LTERSE = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LVLFIX = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LAELAG = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LLEVEC   = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        STEADY   = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        CONLAW   = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        CONSET   = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LFGUST = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LROMFR = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LVISEN = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LLGROU = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LLREFP = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LAXPLT = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LELIST = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LENGLI = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LESPEC = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LNODES = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LUNSWP = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LPLRIB = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LPLZLO = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LPLBAR = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LFRPAN = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LFRROT = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LGEOM = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LLRHS = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LVAIC = unsafe_wrap(Array, as_log_idx, 1); as_log_idx += sizeof(Int32)
        LWSET = unsafe_wrap(Array, as_log_idx, NBX); as_log_idx += sizeof(Int32)*NBX
        LCSET = unsafe_wrap(Array, as_log_idx, NSETX); as_log_idx += sizeof(Int32)*NSETX
        LQBDEF = unsafe_wrap(Array, as_log_idx, (JBX, NBX)); as_log_idx += sizeof(Int32)*JBX*NBX
        lbsymm = unsafe_wrap(Array, as_log_idx, (JBX+1, NBX)); as_log_idx += sizeof(Int32)*(JBX+1)*NBX
        LBSYMM = OffsetArrays.OffsetArray(lbsymm,0:JBX,1:NBX)
        LSFLAP = unsafe_wrap(Array, as_log_idx, NFLPX); as_log_idx += sizeof(Int32)*NFLPX
        LSPENG = unsafe_wrap(Array, as_log_idx, NENGX); as_log_idx += sizeof(Int32)*NENGX
        LSSENS = unsafe_wrap(Array, as_log_idx, NSENX); as_log_idx += sizeof(Int32)*NSENX
        LQINI = unsafe_wrap(Array, as_log_idx, NPNTX); as_log_idx += sizeof(Int32)*NPNTX
        LAINI = unsafe_wrap(Array, as_log_idx, NPNTX); as_log_idx += sizeof(Int32)*NPNTX
        LCONV = unsafe_wrap(Array, as_log_idx, NPNTX); as_log_idx += sizeof(Int32)*NPNTX
        LMACH = unsafe_wrap(Array, as_log_idx, NPNTX); as_log_idx += sizeof(Int32)*NPNTX
        PSTEADY = unsafe_wrap(Array, as_log_idx, NPNTX); as_log_idx += sizeof(Int32)*NPNTX
        LPBEAM = unsafe_wrap(Array, as_log_idx, NBX); as_log_idx += sizeof(Int32)*NBX
        LPWAKE = unsafe_wrap(Array, as_log_idx, NBX); as_log_idx += sizeof(Int32)*NBX
        LDCON = unsafe_wrap(Array, as_log_idx, NDDIM); as_log_idx += sizeof(Int32)*NDDIM
        LUCON = unsafe_wrap(Array, as_log_idx, NUDIM); as_log_idx += sizeof(Int32)*NUDIM
        LQCON = unsafe_wrap(Array, as_log_idx, (NQDIM, NSENX))

        as_int = cglobal((:as_int_, libaswing), Int32); as_int_idx = as_int
        NQ  = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NCP  = unsafe_wrap(Array, as_int_idx, NBX); as_int_idx += sizeof(Int32)*NBX
        IBEAM = unsafe_wrap(Array, as_int_idx, NBX); as_int_idx += sizeof(Int32)*NBX
        IICON = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        II = unsafe_wrap(Array, as_int_idx, NBX); as_int_idx += sizeof(Int32)*NBX
        IFRST   = unsafe_wrap(Array, as_int_idx, NBX); as_int_idx += sizeof(Int32)*NBX
        ILAST   = unsafe_wrap(Array, as_int_idx, NBX); as_int_idx += sizeof(Int32)*NBX
        IITOT   = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NNCON = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NN = unsafe_wrap(Array, as_int_idx, NBX); as_int_idx += sizeof(Int32)*NBX
        NFRST   = unsafe_wrap(Array, as_int_idx, NBX); as_int_idx += sizeof(Int32)*NBX
        NLAST   = unsafe_wrap(Array, as_int_idx, NBX); as_int_idx += sizeof(Int32)*NBX
        NNTOT   = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        KEQ0   = unsafe_wrap(Array, as_int_idx, (12, NBX)); as_int_idx += sizeof(Int32)*12*NBX
        KEQ = unsafe_wrap(Array, as_int_idx, (12, IIX)); as_int_idx += sizeof(Int32)*12*IIX
        NRHS = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NGVAR = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NGPAR = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NGFOR = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NGFEQ = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NFRP = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NFRPF = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NFRPR = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NBEAM = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NFUSE = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NSURF = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        ICOORD = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        IENGTYP = unsafe_wrap(Array, as_int_idx, NENGX); as_int_idx += sizeof(Int32)*NENGX
        IGUSDIR = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NXGUST = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NYGUST = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NZGUST = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        NFGUST = unsafe_wrap(Array, as_int_idx, 1); as_int_idx += sizeof(Int32)
        IGRIM = unsafe_wrap(Array, as_int_idx, NPNTX)

        as_gll = cglobal((:as_gll_, libaswing), Int32); as_gll_idx = as_gll
        LRES   = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LQJOIN = unsafe_wrap(Array, as_gll_idx, (12, NJX)); as_gll_idx += sizeof(Int32)*12*NJX
        LAN    = unsafe_wrap(Array, as_gll_idx, NNX); as_gll_idx += sizeof(Int32)*NNX
        LHEAD  = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LELEV  = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LBANK  = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LVAC   = unsafe_wrap(Array, as_gll_idx, 3); as_gll_idx += sizeof(Int32)*3
        LRAC   = unsafe_wrap(Array, as_gll_idx, 3); as_gll_idx += sizeof(Int32)*3
        LVEL   = unsafe_wrap(Array, as_gll_idx, 3); as_gll_idx += sizeof(Int32)*3
        LROT   = unsafe_wrap(Array, as_gll_idx, 3); as_gll_idx += sizeof(Int32)*3
        LPOS   = unsafe_wrap(Array, as_gll_idx, 3); as_gll_idx += sizeof(Int32)*3
        LFLAP  = unsafe_wrap(Array, as_gll_idx, NFLPX); as_gll_idx += sizeof(Int32)*NFLPX
        LPENG  = unsafe_wrap(Array, as_gll_idx, NENGX); as_gll_idx += sizeof(Int32)*NENGX
        LVIDT = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LALDT = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LBEDT = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LHEDT = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LELDT = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LBADT = unsafe_wrap(Array, as_gll_idx, 1); as_gll_idx += sizeof(Int32)
        LWDT = unsafe_wrap(Array, as_gll_idx, 3); as_gll_idx += sizeof(Int32)*3
        LADT = unsafe_wrap(Array, as_gll_idx, 3); as_gll_idx += sizeof(Int32)*3
        LVIDTS = unsafe_wrap(Array, as_gll_idx, NSENX); as_gll_idx += sizeof(Int32)*NSENX
        LALDTS = unsafe_wrap(Array, as_gll_idx, NSENX); as_gll_idx += sizeof(Int32)*NSENX
        LBEDTS = unsafe_wrap(Array, as_gll_idx, NSENX); as_gll_idx += sizeof(Int32)*NSENX
        LHEDTS = unsafe_wrap(Array, as_gll_idx, NSENX); as_gll_idx += sizeof(Int32)*NSENX
        LELDTS = unsafe_wrap(Array, as_gll_idx, NSENX); as_gll_idx += sizeof(Int32)*NSENX
        LBADTS = unsafe_wrap(Array, as_gll_idx, NSENX); as_gll_idx += sizeof(Int32)*NSENX
        LWDTS = unsafe_wrap(Array, as_gll_idx, (3,NSENX)); as_gll_idx += sizeof(Int32)*NSENX*3
        LADTS = unsafe_wrap(Array, as_gll_idx, (3,NSENX));

        as_fpi = cglobal((:as_fpi_, libaswing), Int32); as_fpi_idx = as_fpi
        LFRPK  = unsafe_wrap(Array, as_fpi_idx, NFRPX); as_fpi_idx += sizeof(Int32)*NFRPX
        KFRPL  = unsafe_wrap(Array, as_fpi_idx, NFRLX); as_fpi_idx += sizeof(Int32)*NFRLX
        LFLAPF = unsafe_wrap(Array, as_fpi_idx, NFLPX); as_fpi_idx += sizeof(Int32)*NFLPX
        LPENGF = unsafe_wrap(Array, as_fpi_idx, NENGX); as_fpi_idx += sizeof(Int32)*NENGX
        LGUS1F = unsafe_wrap(Array, as_fpi_idx, NGUSX); as_fpi_idx += sizeof(Int32)*NGUSX
        LGUS2F = unsafe_wrap(Array, as_fpi_idx, NGUSX); as_fpi_idx += sizeof(Int32)*NGUSX
        LGUS3F = unsafe_wrap(Array, as_fpi_idx, NGUSX); as_fpi_idx += sizeof(Int32)*NGUSX
        LGUS4F = unsafe_wrap(Array, as_fpi_idx, NGUSX);

        as_fpr = cglobal((:as_fpr_, libaswing), Float64); as_fpr_idx = as_fpr
        vgi_frp  = unsafe_wrap(Array, as_fpr_idx, (3, IIX, NFRLX+1))
        VGI_FRP = OffsetArrays.OffsetArray(vgi_frp,1:3, 1:IIX, 0:NFRLX)

        as_frc = cglobal((:as_frc_, libaswing), Float64); as_frc_idx = as_frc
        AFORCE   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        RFORCE   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        EFORCE   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        GFORCE   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        TFORCE   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        AMOMNT   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        RMOMNT   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        EMOMNT   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        GMOMNT   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        TMOMNT   = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        AFOR_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        afor_gl   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        AFOR_GL = OffsetArrays.OffsetArray(afor_gl, 1:3, 0:NGLX)
        afor_frp   = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        AFOR_FRP = OffsetArrays.OffsetArray(afor_frp, 1:3, 0:NFRLX)
        AMOM_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        amom_gl   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        AMOM_GL = OffsetArrays.OffsetArray(amom_gl, 1:3, 0:NGLX)
        amom_frp   = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        AMOM_FRP = OffsetArrays.OffsetArray(amom_frp, 1:3, 0:NFRLX)
        RFOR_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        rfor_gl   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        RFOR_GL = OffsetArrays.OffsetArray(rfor_gl, 1:3, 0:NGLX)
        rfor_frp   = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        RFOR_FRP = OffsetArrays.OffsetArray(rfor_frp, 1:3, 0:NFRLX)
        RMOM_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        rmom_gl   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        RMOM_GL = OffsetArrays.OffsetArray(rmom_gl, 1:3, 0:NGLX)
        rmom_frp   = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        RMOM_FRP = OffsetArrays.OffsetArray(rmom_frp, 1:3, 0:NFRLX)
        EFOR_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        efor_gl   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        EFOR_GL = OffsetArrays.OffsetArray(efor_gl, 1:3, 0:NGLX)
        efor_frp   = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        EFOR_FRP = OffsetArrays.OffsetArray(efor_frp, 1:3, 0:NFRLX)
        EMOM_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        emom_gl   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        EMOM_GL = OffsetArrays.OffsetArray(emom_gl, 1:3, 0:NGLX)
        emom_frp   = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        EMOM_FRP = OffsetArrays.OffsetArray(emom_frp, 1:3, 0:NFRLX)
        GFOR_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        gfor_gl   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        GFOR_GL = OffsetArrays.OffsetArray(gfor_gl, 1:3, 0:NGLX)
        gfor_frp   = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        GFOR_FRP = OffsetArrays.OffsetArray(gfor_frp, 1:3, 0:NFRLX)
        GMOM_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        gmom_gl   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        GMOM_GL = OffsetArrays.OffsetArray(gmom_gl, 1:3, 0:NGLX)
        gmom_frp   = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        GMOM_FRP = OffsetArrays.OffsetArray(gmom_frp, 1:3, 0:NFRLX)
        AFOR_UT   = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        afor_glt   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        AFOR_GLT = OffsetArrays.OffsetArray(afor_glt, 1:3, 0:NGLX)
        AMOM_UT   = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        amom_glt   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        AMOM_GLT = OffsetArrays.OffsetArray(amom_glt, 1:3, 0:NGLX)
        RFOR_UT   = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        rfor_glt   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        RFOR_GLT = OffsetArrays.OffsetArray(rfor_glt, 1:3, 0:NGLX)
        RMOM_UT   = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        rmom_glt   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        RMOM_GLT = OffsetArrays.OffsetArray(rmom_glt, 1:3, 0:NGLX)
        EFOR_UT   = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        efor_glt   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        EFOR_GLT = OffsetArrays.OffsetArray(efor_glt, 1:3, 0:NGLX)
        EMOM_UT   = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        emom_glt   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        EMOM_GLT = OffsetArrays.OffsetArray(emom_glt, 1:3, 0:NGLX)
        GFOR_UT   = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        gfor_glt   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        GFOR_GLT = OffsetArrays.OffsetArray(gfor_glt, 1:3, 0:NGLX)
        GMOM_UT   = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        gmom_glt   = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        GMOM_GLT = OffsetArrays.OffsetArray(gmom_glt, 1:3, 0:NGLX)
        FAERO    = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        FAERO_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        faero_gl  = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        FAERO_GL = OffsetArrays.OffsetArray(faero_gl, 1:3, 0:NGLX)
        faero_frp = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        FAERO_FRP = OffsetArrays.OffsetArray(faero_frp, 1:3, 0:NFRLX)
        FAERO_UT  = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        faero_glt = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        FAERO_GLT = OffsetArrays.OffsetArray(faero_glt, 1:3, 0:NGLX)
        MAERO    = unsafe_wrap(Array, as_frc_idx, 3); as_frc_idx += sizeof(Float64)*3
        MAERO_Q   = unsafe_wrap(Array, as_frc_idx, (3, 18, IIX)); as_frc_idx += sizeof(Float64)*3*18*IIX
        maero_gl  = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1)); as_frc_idx += sizeof(Float64)*3*(NGLX+1)
        MAERO_GL = OffsetArrays.OffsetArray(maero_gl, 1:3, 0:NGLX)
        maero_frp = unsafe_wrap(Array, as_frc_idx, (3, NFRLX+1)); as_frc_idx += sizeof(Float64)*3*(NFRLX+1)
        MAERO_FRP = OffsetArrays.OffsetArray(maero_frp, 1:3, 0:NFRLX)
        MAERO_UT  = unsafe_wrap(Array, as_frc_idx, (3, 6, IIX)); as_frc_idx += sizeof(Float64)*3*6*IIX
        maero_glt = unsafe_wrap(Array, as_frc_idx, (3, NGLX+1));
        MAERO_GLT = OffsetArrays.OffsetArray(maero_glt, 1:3, 0:NGLX)

        as_eng = cglobal((:as_eng_, libaswing), Float64); as_eng_idx = as_eng
        DVENG  = unsafe_wrap(Array, as_eng_idx, (NPX, NPNTX)); as_eng_idx += sizeof(Float64)*NPX*NPNTX
        XENG  = unsafe_wrap(Array, as_eng_idx, (3, NPX, NPNTX)); as_eng_idx += sizeof(Float64)*3*NPX*NPNTX
        XENG_ANG  = unsafe_wrap(Array, as_eng_idx, (3, 3, NPX)); as_eng_idx += sizeof(Float64)*3*3*NPX
        RENG  = unsafe_wrap(Array, as_eng_idx, (3, NPX, NPNTX)); as_eng_idx += sizeof(Float64)*3*NPX*NPNTX
        RENG_ANG  = unsafe_wrap(Array, as_eng_idx, (3, 3, NPX)); as_eng_idx += sizeof(Float64)*3*3*NPX
        VENG  = unsafe_wrap(Array, as_eng_idx, (3, NPX, NPNTX)); as_eng_idx += sizeof(Float64)*3*NPX*NPNTX
        VENG_Q  = unsafe_wrap(Array, as_eng_idx, (3, 18, NPX)); as_eng_idx += sizeof(Float64)*3*18*NPX
        veng_gl  = unsafe_wrap(Array, as_eng_idx, (3, NGLX+1, NPX)); as_eng_idx += sizeof(Float64)*3*(NGLX+1)*NPX
        VENG_GL = OffsetArrays.OffsetArray(veng_gl, 1:3, 0:NGLX, 1:NPX)
        FENG  = unsafe_wrap(Array, as_eng_idx, (3, NPX, NPNTX)); as_eng_idx += sizeof(Float64)*3*NPX*NPNTX
        FENG_Q  = unsafe_wrap(Array, as_eng_idx, (3, 18, NPX)); as_eng_idx += sizeof(Float64)*3*18*NPX
        feng_gl  = unsafe_wrap(Array, as_eng_idx, (3, NGLX+1, NPX)); as_eng_idx += sizeof(Float64)*3*(NGLX+1)*NPX
        FENG_GL = OffsetArrays.OffsetArray(feng_gl, 1:3, 0:NGLX, 1:NPX)
        MENG  = unsafe_wrap(Array, as_eng_idx, (3, NPX, NPNTX)); as_eng_idx += sizeof(Float64)*3*NPX*NPNTX
        MENG_Q  = unsafe_wrap(Array, as_eng_idx, (3, 18, NPX)); as_eng_idx += sizeof(Float64)*3*18*NPX
        meng_gl  = unsafe_wrap(Array, as_eng_idx, (3, NGLX+1, NPX))
        MENG_GL = OffsetArrays.OffsetArray(meng_gl, 1:3, 0:NGLX, 1:NPX)

        as_awt = cglobal((:as_awt_, libaswing), Float64); as_awt_idx = as_awt
        MASS  = unsafe_wrap(Array, as_awt_idx, 1); as_awt_idx += sizeof(Float64)
        MASSP  = unsafe_wrap(Array, as_awt_idx, 1); as_awt_idx += sizeof(Float64)
        MASSB  = unsafe_wrap(Array, as_awt_idx, NBX); as_awt_idx += sizeof(Float64)*NBX
        AREAB  = unsafe_wrap(Array, as_awt_idx, NBX); as_awt_idx += sizeof(Float64)*NBX
        RCGXYZ0  = unsafe_wrap(Array, as_awt_idx, 3); as_awt_idx += sizeof(Float64)*3
        RMASST0  = unsafe_wrap(Array, as_awt_idx, (3,3)); as_awt_idx += sizeof(Float64)*3*3
        RINERT0  = unsafe_wrap(Array, as_awt_idx, (3,3)); as_awt_idx += sizeof(Float64)*3*3
        RCGXYZ  = unsafe_wrap(Array, as_awt_idx, (3,NPNTX)); as_awt_idx += sizeof(Float64)*3*NPNTX
        RMASST  = unsafe_wrap(Array, as_awt_idx, (3,3,NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NPNTX
        RINERT  = unsafe_wrap(Array, as_awt_idx, (3,3,NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NPNTX
        PCGXYZ0  = unsafe_wrap(Array, as_awt_idx, 3); as_awt_idx += sizeof(Float64)*3
        PMASST0  = unsafe_wrap(Array, as_awt_idx, (3,3)); as_awt_idx += sizeof(Float64)*3*3
        PINERT0  = unsafe_wrap(Array, as_awt_idx, (3,3)); as_awt_idx += sizeof(Float64)*3*3
        PCGXYZ  = unsafe_wrap(Array, as_awt_idx, (3,NPNTX)); as_awt_idx += sizeof(Float64)*3*NPNTX
        PMASST  = unsafe_wrap(Array, as_awt_idx, (3,3,NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NPNTX
        PINERT  = unsafe_wrap(Array, as_awt_idx, (3,3,NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NPNTX
        AMASST0  = unsafe_wrap(Array, as_awt_idx, (3,3)); as_awt_idx += sizeof(Float64)*3*3
        AINERT0  = unsafe_wrap(Array, as_awt_idx, (3,3)); as_awt_idx += sizeof(Float64)*3*3
        AMASST  = unsafe_wrap(Array, as_awt_idx, (3,3,NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NPNTX
        AINERT  = unsafe_wrap(Array, as_awt_idx, (3,3,NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NPNTX
        RCGXYZB0  = unsafe_wrap(Array, as_awt_idx, (3, NBX)); as_awt_idx += sizeof(Float64)*3*NBX
        RMASSTB0  = unsafe_wrap(Array, as_awt_idx, (3, 3, NBX)); as_awt_idx += sizeof(Float64)*3*3*NBX
        AMASSTB0  = unsafe_wrap(Array, as_awt_idx, (3, 3, NBX)); as_awt_idx += sizeof(Float64)*3*3*NBX
        RINERTB0  = unsafe_wrap(Array, as_awt_idx, (3, 3, NBX)); as_awt_idx += sizeof(Float64)*3*3*NBX
        AINERTB0  = unsafe_wrap(Array, as_awt_idx, (3, 3, NBX)); as_awt_idx += sizeof(Float64)*3*3*NBX
        RCGXYZB  = unsafe_wrap(Array, as_awt_idx, (3, NBX, NPNTX)); as_awt_idx += sizeof(Float64)*3*NBX*NPNTX
        RMASSTB  = unsafe_wrap(Array, as_awt_idx, (3, 3, NBX, NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NBX*NPNTX
        AMASSTB  = unsafe_wrap(Array, as_awt_idx, (3, 3, NBX, NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NBX*NPNTX
        RINERTB  = unsafe_wrap(Array, as_awt_idx, (3, 3, NBX, NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NBX*NPNTX
        AINERTB  = unsafe_wrap(Array, as_awt_idx, (3, 3, NBX, NPNTX)); as_awt_idx += sizeof(Float64)*3*3*NBX*NPNTX

        as_inr = cglobal((:as_inr_, libaswing), Float64); as_inr_idx = as_inr
        qpylo  = unsafe_wrap(Array, as_inr_idx, (KPX+1, NPX)); as_inr_idx += sizeof(Float64)*(KPX+1)*NPX
        QPYLO = OffsetArrays.OffsetArray(qpylo, 0:KPX, 1:NPX)
        tb  = unsafe_wrap(Array, as_inr_idx, (IBX, JBX+1, NBX)); as_inr_idx += sizeof(Float64)*IBX*(JBX+1)*NBX
        TB = OffsetArrays.OffsetArray(tb, 1:IBX, 0:JBX, 1:NBX)
        qb  = unsafe_wrap(Array, as_inr_idx, (IBX, JBX+1, NBX)); as_inr_idx += sizeof(Float64)*IBX*(JBX+1)*NBX
        QB = OffsetArrays.OffsetArray(qb, 1:IBX, 0:JBX, 1:NBX)
        qbt  = unsafe_wrap(Array, as_inr_idx, (IBX, JBX+1, NBX)); as_inr_idx += sizeof(Float64)*IBX*(JBX+1)*NBX
        QBT = OffsetArrays.OffsetArray(qbt, 1:IBX, 0:JBX, 1:NBX)
        TJOIN  = unsafe_wrap(Array, as_inr_idx, (2, NJX)); as_inr_idx += sizeof(Float64)*2*NJX
        TGROU  = unsafe_wrap(Array, as_inr_idx, NGX); as_inr_idx += sizeof(Float64)*NGX
        sbrk  = unsafe_wrap(Array, as_inr_idx, (NBRKX+2, NBX)); as_inr_idx += sizeof(Float64)*(NBRKX+2)*NBX
        SBRK = OffsetArrays.OffsetArray(sbrk,0:NBRKX+1,1:NBX)
        TBFIL  = unsafe_wrap(Array, as_inr_idx, IBX); as_inr_idx += sizeof(Float64)*IBX
        QBFIL  = unsafe_wrap(Array, as_inr_idx, IBX); as_inr_idx += sizeof(Float64)*IBX
        QBTFIL  = unsafe_wrap(Array, as_inr_idx, IBX); as_inr_idx += sizeof(Float64)*IBX
        ANGJ  = unsafe_wrap(Array, as_inr_idx, (NAJX, NJX)); as_inr_idx += sizeof(Float64)*NAJX*NJX
        ANGJM  = unsafe_wrap(Array, as_inr_idx, (NAJX, NJX)); as_inr_idx += sizeof(Float64)*NAJX*NJX
        MOMJ  = unsafe_wrap(Array, as_inr_idx, (NAJX, NJX)); as_inr_idx += sizeof(Float64)*NAJX*NJX
        HJAX  = unsafe_wrap(Array, as_inr_idx, (3, NJX)); as_inr_idx += sizeof(Float64)*3*NJX

        as_ini = cglobal((:as_ini_, libaswing), Int32); as_ini_idx = as_ini
        nb = unsafe_wrap(Array, as_ini_idx, (JBX+1, NBX)); as_ini_idx += sizeof(Int32)*(JBX+1)*NBX
        NB = OffsetArrays.OffsetArray(nb, 0:JBX, 1:NBX)
        KBTYPE = unsafe_wrap(Array, as_ini_idx, NBX); as_ini_idx += sizeof(Int32)*NBX
        KBNUM = unsafe_wrap(Array, as_ini_idx, NBX); as_ini_idx += sizeof(Int32)*NBX
        KBPYLO = unsafe_wrap(Array, as_ini_idx, NPX); as_ini_idx += sizeof(Int32)*NPX
        KBJOIN = unsafe_wrap(Array, as_ini_idx, (2, NJX)); as_ini_idx += sizeof(Int32)*2*NJX
        KBGROU = unsafe_wrap(Array, as_ini_idx, NGX); as_ini_idx += sizeof(Int32)*NGX
        NPYLO = unsafe_wrap(Array, as_ini_idx, 1); as_ini_idx += sizeof(Int32)
        ISPYLO = unsafe_wrap(Array, as_ini_idx, NPX); as_ini_idx += sizeof(Int32)*NPX
        IPYLO = unsafe_wrap(Array, as_ini_idx, NPX); as_ini_idx += sizeof(Int32)*NPX
        KPTYPE = unsafe_wrap(Array, as_ini_idx, NPX); as_ini_idx += sizeof(Int32)*NPX
        ISSENS = unsafe_wrap(Array, as_ini_idx, NSENX); as_ini_idx += sizeof(Int32)*NSENX
        ISENS = unsafe_wrap(Array, as_ini_idx, NSENX); as_ini_idx += sizeof(Int32)*NSENX
        NJOIN = unsafe_wrap(Array, as_ini_idx, 1); as_ini_idx += sizeof(Int32)
        ISJOIN = unsafe_wrap(Array, as_ini_idx, (2, NJX)); as_ini_idx += sizeof(Int32)*2*NJX
        IJOIN = unsafe_wrap(Array, as_ini_idx, (2, NJX)); as_ini_idx += sizeof(Int32)*2*NJX
        KJTYPE = unsafe_wrap(Array, as_ini_idx, NJX); as_ini_idx += sizeof(Int32)*NJX
        NGROU = unsafe_wrap(Array, as_ini_idx, 1); as_ini_idx += sizeof(Int32)
        ISGROU = unsafe_wrap(Array, as_ini_idx, NGX); as_ini_idx += sizeof(Int32)*NGX
        IGROU = unsafe_wrap(Array, as_ini_idx, NGX); as_ini_idx += sizeof(Int32)*NGX
        KGTYPE = unsafe_wrap(Array, as_ini_idx, NGX); as_ini_idx += sizeof(Int32)*NGX
        NCORN = unsafe_wrap(Array, as_ini_idx, 1); as_ini_idx += sizeof(Int32)
        ISCORN = unsafe_wrap(Array, as_ini_idx, NCX); as_ini_idx += sizeof(Int32)*NCX
        ICORN = unsafe_wrap(Array, as_ini_idx, NCX); as_ini_idx += sizeof(Int32)*NCX
        JBCORN = unsafe_wrap(Array, as_ini_idx, NCX); as_ini_idx += sizeof(Int32)*NCX
        IBCORN = unsafe_wrap(Array, as_ini_idx, NCX); as_ini_idx += sizeof(Int32)*NCX
        NBRK = unsafe_wrap(Array, as_ini_idx, NBX); as_ini_idx += sizeof(Int32)*NBX
        ibrk = unsafe_wrap(Array, as_ini_idx, (NBRKX+2, NBX)); as_ini_idx += sizeof(Int32)*(NBRKX+2)*NBX
        IBRK = OffsetArrays.OffsetArray(ibrk, 0:NBRKX+1, 1:NBX)
        JFIL = unsafe_wrap(Array, as_ini_idx, 1); as_ini_idx += sizeof(Int32)
        ISFIL = unsafe_wrap(Array, as_ini_idx, 1); as_ini_idx += sizeof(Int32)
        NBFIL = unsafe_wrap(Array, as_ini_idx, 1); as_ini_idx += sizeof(Int32)
        NANGJ = unsafe_wrap(Array, as_ini_idx, NJX);

        as_snr = cglobal((:as_snr_, libaswing), Float64); as_snr_idx = as_snr
        QSNSP = unsafe_wrap(Array, as_snr_idx, (IRTOT, NSENX, NPNTX)); as_snr_idx += sizeof(Float64)*IRTOT*NSENX*NPNTX
        QSENS = unsafe_wrap(Array, as_snr_idx, (KSTOT, NSENX, NPNTX)); as_snr_idx += sizeof(Float64)*KSTOT*NSENX*NPNTX
        QSENS_Q = unsafe_wrap(Array, as_snr_idx, (KSTOT, 18, NSENX)); as_snr_idx += sizeof(Float64)*KSTOT*18*NSENX
        QSENS_QT = unsafe_wrap(Array, as_snr_idx, (KSTOT, 6, NSENX)); as_snr_idx += sizeof(Float64)*KSTOT*6*NSENX
        qsens_gl = unsafe_wrap(Array, as_snr_idx, (KSTOT, NGLX+1, NSENX)); as_snr_idx += sizeof(Float64)*KSTOT*(NGLX+1)*NSENX
        QSENS_GL = OffsetArrays.OffsetArray(qsens_gl, 1:KSTOT, 0:NGLX, 1:NSENX)
        qsens_glt = unsafe_wrap(Array, as_snr_idx, (KSTOT, NGLX+1, NSENX)); as_snr_idx += sizeof(Float64)*KSTOT*(NGLX+1)*NSENX
        QSENS_GLT = OffsetArrays.OffsetArray(qsens_glt, 1:KSTOT, 0:NGLX, 1:NSENX)
        qsens_frp = unsafe_wrap(Array, as_snr_idx, (KSTOT, NFRLX+1, NSENX)); as_snr_idx += sizeof(Float64)*KSTOT*(NFRLX+1)*NSENX
        QSENS_FRP = OffsetArrays.OffsetArray(qsens_frp, 1:KSTOT, 0:NFRLX, 1:NSENX)
        TPMAT = unsafe_wrap(Array, as_snr_idx, (3, 3, NPX))

        as_vab = cglobal((:as_vab_, libaswing), Float64); as_vab_idx = as_vab
        VIWIND = unsafe_wrap(Array, as_vab_idx, 1); as_vab_idx += sizeof(Float64)
        ALWIND = unsafe_wrap(Array, as_vab_idx, 1); as_vab_idx += sizeof(Float64)
        BEWIND = unsafe_wrap(Array, as_vab_idx, 1); as_vab_idx += sizeof(Float64)
        VIW_VEL = unsafe_wrap(Array, as_vab_idx, 3); as_vab_idx += sizeof(Float64)*3
        ALW_VEL = unsafe_wrap(Array, as_vab_idx, 3); as_vab_idx += sizeof(Float64)*3
        BEW_VEL = unsafe_wrap(Array, as_vab_idx, 3); as_vab_idx += sizeof(Float64)*3

        as_var = cglobal((:as_var_, libaswing), Float64); as_var_idx = as_var
        Q = unsafe_wrap(Array, as_var_idx, (18, IIX, NPNTX)); as_var_idx += sizeof(Float64)*18*IIX*NPNTX
        Q0 = unsafe_wrap(Array, as_var_idx, (6, IIX)); as_var_idx += sizeof(Float64)*6*IIX
        QPAR = unsafe_wrap(Array, as_var_idx, (IIX, JBX)); as_var_idx += sizeof(Float64)*IIX*JBX
        S = unsafe_wrap(Array, as_var_idx, IIX); as_var_idx += sizeof(Float64)*IIX
        THET = unsafe_wrap(Array, as_var_idx, IIX); as_var_idx += sizeof(Float64)*IIX
        SPLT = unsafe_wrap(Array, as_var_idx, IIX); as_var_idx += sizeof(Float64)*IIX
        TBI = unsafe_wrap(Array, as_var_idx, IIX); as_var_idx += sizeof(Float64)*IIX
        SCP = unsafe_wrap(Array, as_var_idx, IIX); as_var_idx += sizeof(Float64)*IIX
        XYZTFZ = unsafe_wrap(Array, as_var_idx, (3, IIX)); as_var_idx += sizeof(Float64)*3*IIX
        XYZTFZI = unsafe_wrap(Array, as_var_idx, (3, IIX)); as_var_idx += sizeof(Float64)*3*IIX
        PARAM = unsafe_wrap(Array, as_var_idx, (KPTOT, NPNTX)); as_var_idx += sizeof(Float64)*KPTOT*NPNTX
        AN = unsafe_wrap(Array, as_var_idx, (NNX, NPNTX)); as_var_idx += sizeof(Float64)*NNX*NPNTX
        PSPEC = unsafe_wrap(Array, as_var_idx, (IPTOT, NPNTX)); as_var_idx += sizeof(Float64)*IPTOT*NPNTX
        PSPECSET = unsafe_wrap(Array, as_var_idx, (IPTOT, NSETX)); as_var_idx += sizeof(Float64)*IPTOT*NSETX
        WFLAP = unsafe_wrap(Array, as_var_idx, (NFLPX, NPNTX)); as_var_idx += sizeof(Float64)*NFLPX*NPNTX
        WPENG = unsafe_wrap(Array, as_var_idx, (NENGX, NPNTX)); as_var_idx += sizeof(Float64)*NENGX*NPNTX
        QJOIN = unsafe_wrap(Array, as_var_idx, (12, NJX, NPNTX)); as_var_idx += sizeof(Float64)*12*NJX*NPNTX
        QPNT = unsafe_wrap(Array, as_var_idx, (IIX, IQTOT, NPNTX)); as_var_idx += sizeof(Float64)*IIX*IQTOT*NPNTX
        DTIME = unsafe_wrap(Array, as_var_idx, 1); as_var_idx += sizeof(Float64)
        TIME = unsafe_wrap(Array, as_var_idx, NPNTX); as_var_idx += sizeof(Float64)*NPNTX
        qtwt = unsafe_wrap(Array, as_var_idx, 3); as_var_idx += sizeof(Float64)*3
        QTWT = OffsetArrays.OffsetArray(qtwt,0:2)
        RDOT = unsafe_wrap(Array, as_var_idx, (6, IIX)); as_var_idx += sizeof(Float64)*6*IIX
        UDOT = unsafe_wrap(Array, as_var_idx, (6, IIX)); as_var_idx += sizeof(Float64)*6*IIX
        PSDOT = unsafe_wrap(Array, as_var_idx, KPTOT); as_var_idx += sizeof(Float64)*KPTOT
        ANDOT = unsafe_wrap(Array, as_var_idx, NNX); as_var_idx += sizeof(Float64)*NNX
        QSDOT = unsafe_wrap(Array, as_var_idx, (KSTOT, NSENX)); as_var_idx += sizeof(Float64)*KSTOT*NSENX
        AKGUST = unsafe_wrap(Array, as_var_idx, (3, NGUSX)); as_var_idx += sizeof(Float64)*3*NGUSX
        ALGUST = unsafe_wrap(Array, as_var_idx, (3, NGUSX)); as_var_idx += sizeof(Float64)*3*NGUSX
        VFGUST = unsafe_wrap(Array, as_var_idx, (3, 4, NGUSX));

        as_pti = cglobal((:as_pti_, libaswing), Int32); as_pti_idx = as_pti
        NPOINT = unsafe_wrap(Array, as_pti_idx, 1); as_pti_idx += sizeof(Int32)
        IPOINT = unsafe_wrap(Array, as_pti_idx, 1); as_pti_idx += sizeof(Int32)
        NPTIME = unsafe_wrap(Array, as_pti_idx, 1); as_pti_idx += sizeof(Int32)
        IPNTD = unsafe_wrap(Array, as_pti_idx, 1); as_pti_idx += sizeof(Int32)
        IPNTVL = unsafe_wrap(Array, as_pti_idx, 1); as_pti_idx += sizeof(Int32)
        KCSET = unsafe_wrap(Array, as_pti_idx, 1); as_pti_idx += sizeof(Int32)
        IQEXP = unsafe_wrap(Array, as_pti_idx, (IQTOT, NBX, NPNTX)); as_pti_idx += sizeof(Int32)*IQTOT*NBX*NPNTX
        IPPAR = unsafe_wrap(Array, as_pti_idx, (KPFREE, NPNTX)); as_pti_idx += sizeof(Int32)*KPFREE*NPNTX
        IPPARSET = unsafe_wrap(Array, as_pti_idx, (KPFREE, NSETX)); as_pti_idx += sizeof(Int32)*KPFREE*NSETX

        as_aic = cglobal((:as_aic_, libaswing), Float64); as_aic_idx = as_aic
        ANF = unsafe_wrap(Array, as_aic_idx, (NNX, IIX)); as_aic_idx += sizeof(Float64)*NNX*IIX
        RCCORE = unsafe_wrap(Array, as_aic_idx, 1); as_aic_idx += sizeof(Float64)
        VIB = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        WIB = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VEB = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIC = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        WIC = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VEC = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIP = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        WIP = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VEP = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VIB_MA = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        WIB_MA = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIC_MA = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        WIC_MA = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIP_MA = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        WIP_MA = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VIB_AL = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        WIB_AL = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VEB_AL = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIC_AL = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        WIC_AL = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VEC_AL = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIP_AL = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        WIP_AL = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VEP_AL = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VIB_BE = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        WIB_BE = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VEB_BE = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIC_BE = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        WIC_BE = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VEC_BE = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIP_BE = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        WIP_BE = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VEP_BE = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VIB_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        WIB_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        VIC_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        WIC_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        VIP_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX
        WIP_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX
        VIB_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        WIB_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        VIC_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        WIC_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        VIP_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX
        WIP_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX
        VIB_AN = unsafe_wrap(Array, as_aic_idx, (3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*NNX*IIX
        WIB_VI = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIC_AN = unsafe_wrap(Array, as_aic_idx, (3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*NNX*IIX
        WIC_VI = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIP_AN = unsafe_wrap(Array, as_aic_idx, (3, NNX, NPX)); as_aic_idx += sizeof(Float64)*3*NNX*NPX
        WIP_VI = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VEB_XENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEB_RENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEC_XENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEC_RENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEP_XENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX*NPX
        VEP_RENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX*NPX
        VEB_VENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEC_VENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEP_VENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX*NPX
        VEB_FENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEB_MENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEC_FENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEC_MENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NPX*IIX
        VEP_FENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX*NPX
        VEP_MENG = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX*NPX
        VIB_AN_MA = unsafe_wrap(Array, as_aic_idx, (3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*NNX*IIX
        WIB_VI_MA = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIC_AN_MA = unsafe_wrap(Array, as_aic_idx, (3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*NNX*IIX
        WIC_VI_MA = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIP_AN_MA = unsafe_wrap(Array, as_aic_idx, (3, NNX, NPX)); as_aic_idx += sizeof(Float64)*3*NNX*NPX
        WIP_VI_MA = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VIB_AN_AL = unsafe_wrap(Array, as_aic_idx, (3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*NNX*IIX
        WIB_VI_AL = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIC_AN_AL = unsafe_wrap(Array, as_aic_idx, (3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*NNX*IIX
        WIC_VI_AL = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIP_AN_AL = unsafe_wrap(Array, as_aic_idx, (3, NNX, NPX)); as_aic_idx += sizeof(Float64)*3*NNX*NPX
        WIP_VI_AL = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VIB_AN_BE = unsafe_wrap(Array, as_aic_idx, (3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*NNX*IIX
        WIB_VI_BE = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIC_AN_BE = unsafe_wrap(Array, as_aic_idx, (3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*NNX*IIX
        WIC_VI_BE = unsafe_wrap(Array, as_aic_idx, (3, IIX)); as_aic_idx += sizeof(Float64)*3*IIX
        VIP_AN_BE = unsafe_wrap(Array, as_aic_idx, (3, NNX, NPX)); as_aic_idx += sizeof(Float64)*3*NNX*NPX
        WIP_VI_BE = unsafe_wrap(Array, as_aic_idx, (3, NPX)); as_aic_idx += sizeof(Float64)*3*NPX
        VIB_AN_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NNX*IIX
        WIB_VI_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        VIC_AN_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NNX*IIX
        WIC_VI_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        VIP_AN_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, NNX, NPX)); as_aic_idx += sizeof(Float64)*3*3*NNX*NPX
        WIP_VI_POS = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX
        VIB_AN_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NNX*IIX
        WIB_VI_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        VIC_AN_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, NNX, IIX)); as_aic_idx += sizeof(Float64)*3*3*NNX*IIX
        WIC_VI_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, IIX)); as_aic_idx += sizeof(Float64)*3*3*IIX
        VIP_AN_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, NNX, NPX)); as_aic_idx += sizeof(Float64)*3*3*NNX*NPX
        WIP_VI_EUL = unsafe_wrap(Array, as_aic_idx, (3, 3, NPX)); as_aic_idx += sizeof(Float64)*3*3*NPX
        veb_gl = unsafe_wrap(Array, as_aic_idx, (3, NGLX+1, IIX)); as_aic_idx += sizeof(Float64)*3*(NGLX+1)*IIX
        VEB_GL = OffsetArrays.OffsetArray(veb_gl,1:3, 0:NGLX, 1:IIX)
        vec_gl = unsafe_wrap(Array, as_aic_idx, (3, NGLX+1, IIX)); as_aic_idx += sizeof(Float64)*3*(NGLX+1)*IIX
        VEC_GL = OffsetArrays.OffsetArray(vec_gl,1:3, 0:NGLX, 1:IIX)
        vep_gl = unsafe_wrap(Array, as_aic_idx, (3, NGLX+1, NPX)); as_aic_idx += sizeof(Float64)*3*(NGLX+1)*NPX
        VEP_GL = OffsetArrays.OffsetArray(vep_gl,1:3, 0:NGLX, 1:NPX)

        as_syj = cglobal((:as_syj_, libaswing), Float64); as_syj_idx = as_syj
        AJSAV = unsafe_wrap(Array, as_syj_idx, (12, 18, NJX)); as_syj_idx += sizeof(Float64)*12*18*NJX
        CJSAV = unsafe_wrap(Array, as_syj_idx, (12, 18, NJX)); as_syj_idx += sizeof(Float64)*12*18*NJX
        RJSAV = unsafe_wrap(Array, as_syj_idx, (12, NGLX, NJX)); as_syj_idx += sizeof(Float64)*12*NGLX*NJX
        ATJSAV = unsafe_wrap(Array, as_syj_idx, (12, 6, NJX)); as_syj_idx += sizeof(Float64)*12*6*NJX
        CTJSAV = unsafe_wrap(Array, as_syj_idx, (12, 6, NJX)); as_syj_idx += sizeof(Float64)*12*6*NJX
        RTJSAV = unsafe_wrap(Array, as_syj_idx, (12, NGLX, NJX)); as_syj_idx += sizeof(Float64)*12*NGLX*NJX
        rfrpjsav = unsafe_wrap(Array, as_syj_idx, (12, NFRLX+1, NJX)); as_syj_idx += sizeof(Float64)*12*(NFRLX+1)*NJX
        RFRPJSAV = OffsetArrays.OffsetArray(rfrpjsav, 1:12, 0:NFRLX, 1:NJX)

        as_syr = cglobal((:as_syr_, libaswing), Float64); as_syr_idx = as_syr
        A = unsafe_wrap(Array, as_syr_idx, (18, 18, IIX)); as_syr_idx += sizeof(Float64)*18*18*IIX
        B = unsafe_wrap(Array, as_syr_idx, (18, 18, IIX)); as_syr_idx += sizeof(Float64)*18*18*IIX
        C = unsafe_wrap(Array, as_syr_idx, (18, 18, IIX)); as_syr_idx += sizeof(Float64)*18*18*IIX
        r = unsafe_wrap(Array, as_syr_idx, (18, NGLX+1, IIX)); as_syr_idx += sizeof(Float64)*18*(NGLX+1)*IIX
        R = OffsetArrays.OffsetArray(r, 1:18, 0:NGLX, 1:IIX)
        AT = unsafe_wrap(Array, as_syr_idx, (18, 6, IIX)); as_syr_idx += sizeof(Float64)*18*6*IIX
        BT = unsafe_wrap(Array, as_syr_idx, (18, 6, IIX)); as_syr_idx += sizeof(Float64)*18*6*IIX
        CT = unsafe_wrap(Array, as_syr_idx, (18, 6, IIX)); as_syr_idx += sizeof(Float64)*18*6*IIX
        rt = unsafe_wrap(Array, as_syr_idx, (18, NGLX+1, IIX)); as_syr_idx += sizeof(Float64)*18*(NGLX+1)*IIX
        RT = OffsetArrays.OffsetArray(rt, 1:18, 0:NGLX, 1:IIX)
        rfrp = unsafe_wrap(Array, as_syr_idx, (18, NFRLX+1, IIX)); as_syr_idx += sizeof(Float64)*18*(NFRLX+1)*IIX
        RFRP = OffsetArrays.OffsetArray(rfrp, 1:18, 0:NFRLX, 1:IIX)

        as_syg = cglobal((:as_syg_, libaswing), Float64); as_syg_idx = as_syg
        gvsys = unsafe_wrap(Array, as_syg_idx, (NGVX, NGLX+1)); as_syg_idx += sizeof(Float64)*NGVX*(NGLX+1)
        GVSYS = OffsetArrays.OffsetArray(gvsys, 1:NGVX, 0:NGLX)
        gpsys = unsafe_wrap(Array, as_syg_idx, (NGPX, NGLX+1)); as_syg_idx += sizeof(Float64)*NGPX*(NGLX+1)
        GPSYS = OffsetArrays.OffsetArray(gpsys, 1:NGPX, 0:NGLX)
        gfsys = unsafe_wrap(Array, as_syg_idx, (NGFX, NGLX+1)); as_syg_idx += sizeof(Float64)*NGFX*(NGLX+1)
        GFSYS = OffsetArrays.OffsetArray(gfsys, 1:NGFX, 0:NGLX)
        gvsyst = unsafe_wrap(Array, as_syg_idx, (NGVX, NGLX+1)); as_syg_idx += sizeof(Float64)*NGVX*(NGLX+1)
        GVSYST = OffsetArrays.OffsetArray(gvsyst, 1:NGVX, 0:NGLX)
        gpsyst = unsafe_wrap(Array, as_syg_idx, (NGPX, NGLX+1)); as_syg_idx += sizeof(Float64)*NGPX*(NGLX+1)
        GPSYST = OffsetArrays.OffsetArray(gpsyst, 1:NGPX, 0:NGLX)
        gfsyst = unsafe_wrap(Array, as_syg_idx, (NGFX, NGLX+1)); as_syg_idx += sizeof(Float64)*NGFX*(NGLX+1)
        GFSYST = OffsetArrays.OffsetArray(gfsyst, 1:NGFX, 0:NGLX)
        GVQ = unsafe_wrap(Array, as_syg_idx, (18, NGVQX)); as_syg_idx += sizeof(Float64)*18*NGVQX
        GPQ = unsafe_wrap(Array, as_syg_idx, (18, NGPQX)); as_syg_idx += sizeof(Float64)*18*NGPQX
        GFQ = unsafe_wrap(Array, as_syg_idx, (18, NGFQX)); as_syg_idx += sizeof(Float64)*18*NGFQX
        GVQT = unsafe_wrap(Array, as_syg_idx, (6, NGVQX)); as_syg_idx += sizeof(Float64)*6*NGVQX
        GPQT = unsafe_wrap(Array, as_syg_idx, (6, NGPQX)); as_syg_idx += sizeof(Float64)*6*NGPQX
        GFQT = unsafe_wrap(Array, as_syg_idx, (6, NGFQX)); as_syg_idx += sizeof(Float64)*6*NGFQX
        gvfrp = unsafe_wrap(Array, as_syg_idx, (NGVX, NFRLX+1)); as_syg_idx += sizeof(Float64)*NGVX*(NFRLX+1)
        GVFRP = OffsetArrays.OffsetArray(gvfrp, 1:NGVX, 0:NFRLX)
        gpfrp = unsafe_wrap(Array, as_syg_idx, (NGPX, NFRLX+1)); as_syg_idx += sizeof(Float64)*NGPX*(NFRLX+1)
        GPFRP = OffsetArrays.OffsetArray(gpfrp, 1:NGPX, 0:NFRLX)
        gffrp = unsafe_wrap(Array, as_syg_idx, (NGFX, NFRLX+1)); as_syg_idx += sizeof(Float64)*NGFX*(NFRLX+1)
        GFFRP = OffsetArrays.OffsetArray(gffrp, 1:NGFX, 0:NFRLX)
        GFLSQ = unsafe_wrap(Array, as_syg_idx, (NGFX, NGFX)); as_syg_idx += sizeof(Float64)*NGFX*NGFX
        WLSQ = unsafe_wrap(Array, as_syg_idx, NGFX);

        as_syz = cglobal((:as_syz_, libaswing), ComplexF64); as_syz_idx = as_syz
        ZA = unsafe_wrap(Array, as_syz_idx, (18, 18, IIX)); as_syz_idx += sizeof(ComplexF64)*18*18*IIX
        ZB = unsafe_wrap(Array, as_syz_idx, (18, 18, IIX)); as_syz_idx += sizeof(ComplexF64)*18*18*IIX
        ZC = unsafe_wrap(Array, as_syz_idx, (18, 18, IIX)); as_syz_idx += sizeof(ComplexF64)*18*18*IIX
        zr = unsafe_wrap(Array, as_syz_idx, (18, NGLX+1, IIX)); as_syz_idx += sizeof(ComplexF64)*18*(NGLX+1)*IIX
        ZR = OffsetArrays.OffsetArray(zr, 1:18, 0:NGLX, 1:IIX)
        zgvsys = unsafe_wrap(Array, as_syz_idx, (NGVX, NGLX+1)); as_syz_idx += sizeof(ComplexF64)*NGVX*(NGLX+1)
        ZGVSYS = OffsetArrays.OffsetArray(zgvsys, 1:NGVX, 0:NGLX)
        zgpsys = unsafe_wrap(Array, as_syz_idx, (NGPX, NGLX+1)); as_syz_idx += sizeof(ComplexF64)*NGPX*(NGLX+1)
        ZGPSYS = OffsetArrays.OffsetArray(zgpsys, 1:NGPX, 0:NGLX)
        zgfsys = unsafe_wrap(Array, as_syz_idx, (NGFX, NGLX+1)); as_syz_idx += sizeof(ComplexF64)*NGFX*(NGLX+1)
        ZGFSYS = OffsetArrays.OffsetArray(zgfsys, 1:NGFX, 0:NGLX)
        ZGVQ = unsafe_wrap(Array, as_syz_idx, (18, NGVQX)); as_syz_idx += sizeof(ComplexF64)*18*NGVQX
        ZGPQ = unsafe_wrap(Array, as_syz_idx, (18, NGPQX)); as_syz_idx += sizeof(ComplexF64)*18*NGPQX
        ZGFQ = unsafe_wrap(Array, as_syz_idx, (18, NGFQX)); as_syz_idx += sizeof(ComplexF64)*18*NGFQX

        as_syi = cglobal((:as_syi_, libaswing), Int32); as_syi_idx = as_syi
        NGVQ = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        KGVQ = unsafe_wrap(Array, as_syi_idx, NGVQX); as_syi_idx += sizeof(Int32)*NGVQX
        IGVQ = unsafe_wrap(Array, as_syi_idx, NGVQX); as_syi_idx += sizeof(Int32)*NGVQX
        NGPQ = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        KGPQ = unsafe_wrap(Array, as_syi_idx, NGPQX); as_syi_idx += sizeof(Int32)*NGPQX
        IGPQ = unsafe_wrap(Array, as_syi_idx, NGPQX); as_syi_idx += sizeof(Int32)*NGPQX
        NGFQ = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        KGFQ = unsafe_wrap(Array, as_syi_idx, NGFQX); as_syi_idx += sizeof(Int32)*NGFQX
        IGFQ = unsafe_wrap(Array, as_syi_idx, NGFQX); as_syi_idx += sizeof(Int32)*NGFQX
        NGVQZ = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        KGVQZ = unsafe_wrap(Array, as_syi_idx, NGVQX); as_syi_idx += sizeof(Int32)*NGVQX
        IGVQZ = unsafe_wrap(Array, as_syi_idx, NGVQX); as_syi_idx += sizeof(Int32)*NGVQX
        NGPQZ = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        KGPQZ = unsafe_wrap(Array, as_syi_idx, NGPQX); as_syi_idx += sizeof(Int32)*NGPQX
        IGPQZ = unsafe_wrap(Array, as_syi_idx, NGPQX); as_syi_idx += sizeof(Int32)*NGPQX
        NGFQZ = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        KGFQZ = unsafe_wrap(Array, as_syi_idx, NGFQX); as_syi_idx += sizeof(Int32)*NGFQX
        IGFQZ = unsafe_wrap(Array, as_syi_idx, NGFQX); as_syi_idx += sizeof(Int32)*NGFQX
        NGVQ1 = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        NGPQ1 = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        NGFQ1 = unsafe_wrap(Array, as_syi_idx, 1); as_syi_idx += sizeof(Int32)
        IGVPIV = unsafe_wrap(Array, as_syi_idx, NGVX); as_syi_idx += sizeof(Int32)*NGVX
        IGPPIV = unsafe_wrap(Array, as_syi_idx, NGPX); as_syi_idx += sizeof(Int32)*NGPX
        IGFPIV = unsafe_wrap(Array, as_syi_idx, NGFX); as_syi_idx += sizeof(Int32)*NGFX

        as_itr = cglobal((:as_itr_, libaswing), Int32); as_itr_idx = as_itr
        ITER = unsafe_wrap(Array, as_itr_idx, 1); as_itr_idx += sizeof(Int32)
        ITMAX = unsafe_wrap(Array, as_itr_idx, 1); as_itr_idx += sizeof(Int32)
        NEIGIT = unsafe_wrap(Array, as_itr_idx, 1); as_itr_idx += sizeof(Int32)

        as_tol = cglobal((:as_tol_, libaswing), Float64); as_tol_idx = as_tol
        EPS = unsafe_wrap(Array, as_tol_idx, 1); as_tol_idx += sizeof(Float64)
        DELRMS = unsafe_wrap(Array, as_tol_idx, 1); as_tol_idx += sizeof(Float64)
        DELMAX = unsafe_wrap(Array, as_tol_idx, 1); as_tol_idx += sizeof(Float64)
        dglob = unsafe_wrap(Array, as_tol_idx, NGLX+1); as_tol_idx += sizeof(Float64)*(NGLX+1)
        DGLOB = OffsetArrays.OffsetArray(dglob, 0:NGLX)
        DQ = unsafe_wrap(Array, as_tol_idx, (18, IIX)); as_tol_idx += sizeof(Float64)*18*IIX

        as_nam = cglobal((:as_nam_, libaswing), Cchar); as_nam_idx = as_nam
        ARGP1 = unsafe_wrap(Array, as_nam_idx, 80); as_nam_idx += sizeof(Cchar)*80
        ARGP2 = unsafe_wrap(Array, as_nam_idx, 80); as_nam_idx += sizeof(Cchar)*80
        PREFIX = unsafe_wrap(Array, as_nam_idx, 80); as_nam_idx += sizeof(Cchar)*80
        NAME = unsafe_wrap(Array, as_nam_idx, 80); as_nam_idx += sizeof(Cchar)*80
        ANAME = Array{Array{Cchar,1}, 1}(undef, NPNTX)
        for i = 1:NPNTX
            ANAME[i] = unsafe_wrap(Array, as_nam_idx, 64); as_nam_idx += sizeof(Cchar)*64
        end
        BNAME = Array{Array{Cchar,1}, 1}(undef, NBX)
        for i = 1:NBX
            BNAME[i] = unsafe_wrap(Array, as_nam_idx, 64); as_nam_idx += sizeof(Cchar)*64
        end
        CNAME = Array{Array{Cchar,1}, 1}(undef, IPTOT)
        for i = 1:IPTOT
            CNAME[i] = unsafe_wrap(Array, as_nam_idx, 16); as_nam_idx += sizeof(Cchar)*16
        end
        CUNIT = Array{Array{Cchar,1}, 1}(undef, IPTOT)
        for i = 1:IPTOT
            CUNIT[i] = unsafe_wrap(Array, as_nam_idx, 16); as_nam_idx += sizeof(Cchar)*16
        end
        CKEY = Array{Array{Cchar,1}, 1}(undef, IPTOT)
        for i = 1:IPTOT
            CKEY[i] = unsafe_wrap(Array, as_nam_idx, 2); as_nam_idx += sizeof(Cchar)*2
        end
        RNAME = Array{Array{Cchar,1}, 1}(undef, IPTOT)
        for i = 1:IPTOT
            RNAME[i] = unsafe_wrap(Array, as_nam_idx, 12); as_nam_idx += sizeof(Cchar)*12
        end
        RUNIT = Array{Array{Cchar,1}, 1}(undef, IPTOT)
        for i = 1:IPTOT
            RUNIT[i] = unsafe_wrap(Array, as_nam_idx, 16); as_nam_idx += sizeof(Cchar)*16
        end
        RKEY = Array{Array{Cchar,1}, 1}(undef, IPTOT)
        for i = 1:IPTOT
            RKEY[i] = unsafe_wrap(Array, as_nam_idx, 2); as_nam_idx += sizeof(Cchar)*2
        end

        as_pli = cglobal((:as_pli_, libaswing), Int32); as_pli_idx = as_pli
        IDEV = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        IDEVRP = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        IDEVM = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        IPSLU = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        NCOLOR = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        NBFREQ = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        NBEIGEN = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        NFRAME = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        IVGCUT = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        IVGFUN = unsafe_wrap(Array, as_pli_idx, 1); as_pli_idx += sizeof(Int32)
        ILINE = unsafe_wrap(Array, as_pli_idx, NPNTX); as_pli_idx += sizeof(Int32)*NPNTX
        ICOLOR = unsafe_wrap(Array, as_pli_idx, NPNTX); as_pli_idx += sizeof(Int32)*NPNTX
        ICOLB = unsafe_wrap(Array, as_pli_idx, NBX); as_pli_idx += sizeof(Int32)*NBX
        ICOLF = unsafe_wrap(Array, as_pli_idx, NFRPX); as_pli_idx += sizeof(Int32)*NFRPX

        as_pll = cglobal((:as_pll_, libaswing), Int32); as_pll_idx = as_pll
        LPLOT = unsafe_wrap(Array, as_pll_idx, 1); as_pll_idx += sizeof(Int32)
        LPGRID = unsafe_wrap(Array, as_pll_idx, 1); as_pll_idx += sizeof(Int32)
        LCEDPL = unsafe_wrap(Array, as_pll_idx, 1); as_pll_idx += sizeof(Int32)
        LSVMOV = unsafe_wrap(Array, as_pll_idx, 1); as_pll_idx += sizeof(Int32)

        as_plr = cglobal((:as_plr_, libaswing), Float64); as_plr_idx = as_plr
        SCRNFL = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        SCRNFP = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        SIZE = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        CSIZ = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        XWIND = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        YWIND = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        AZIMOB = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        ELEVOB = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        ROBINV = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        XYZUP = unsafe_wrap(Array, as_plr_idx, 3); as_plr_idx += sizeof(Float64)*3
        WAKLFR = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        SAXLFR = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        SLOMOF = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        EIGENF = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        TMOVIE = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        TIME1 = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        TIME2 = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        DPHASE = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        SCALEF = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        DTDUMP = unsafe_wrap(Array, as_plr_idx, NBX); as_plr_idx += sizeof(Float64)*NBX
        BFREQ1 = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        BFREQ2 = unsafe_wrap(Array, as_plr_idx, 1); as_plr_idx += sizeof(Float64)
        VGCXYZ = unsafe_wrap(Array, as_plr_idx, 3); as_plr_idx += sizeof(Float64)*3
        VGCLIM = unsafe_wrap(Array, as_plr_idx, (2,3)); as_plr_idx += sizeof(Float64)*2*3

        as_sen = cglobal((:as_sen_, libaswing), Float64); as_sen_idx = as_sen
        CL_VEL = unsafe_wrap(Array, as_sen_idx, (3,NPNTX)); as_sen_idx += sizeof(Float64)*3*NPNTX
        CM_VEL = unsafe_wrap(Array, as_sen_idx, (3,NPNTX)); as_sen_idx += sizeof(Float64)*3*NPNTX
        CN_VEL = unsafe_wrap(Array, as_sen_idx, (3,NPNTX)); as_sen_idx += sizeof(Float64)*3*NPNTX
        CR_VEL = unsafe_wrap(Array, as_sen_idx, (3,NPNTX)); as_sen_idx += sizeof(Float64)*3*NPNTX
        CL_ROT = unsafe_wrap(Array, as_sen_idx, (3,NPNTX)); as_sen_idx += sizeof(Float64)*3*NPNTX
        CM_ROT = unsafe_wrap(Array, as_sen_idx, (3,NPNTX)); as_sen_idx += sizeof(Float64)*3*NPNTX
        CN_ROT = unsafe_wrap(Array, as_sen_idx, (3,NPNTX)); as_sen_idx += sizeof(Float64)*3*NPNTX
        CR_ROT = unsafe_wrap(Array, as_sen_idx, (3,NPNTX)); as_sen_idx += sizeof(Float64)*3*NPNTX
        FOR_VEL = unsafe_wrap(Array, as_sen_idx, (3,3,NPNTX)); as_sen_idx += sizeof(Float64)*3*3*NPNTX
        MOM_VEL = unsafe_wrap(Array, as_sen_idx, (3,3,NPNTX)); as_sen_idx += sizeof(Float64)*3*3*NPNTX
        FOR_ROT = unsafe_wrap(Array, as_sen_idx, (3,3,NPNTX)); as_sen_idx += sizeof(Float64)*3*3*NPNTX
        MOM_ROT = unsafe_wrap(Array, as_sen_idx, (3,3,NPNTX)); as_sen_idx += sizeof(Float64)*3*3*NPNTX
        FOR_FLAP = unsafe_wrap(Array, as_sen_idx, (3,NFLPX,NPNTX)); as_sen_idx += sizeof(Float64)*3*NFLPX*NPNTX
        MOM_FLAP = unsafe_wrap(Array, as_sen_idx, (3,NFLPX,NPNTX)); as_sen_idx += sizeof(Float64)*3*NFLPX*NPNTX
        FOR_PENG = unsafe_wrap(Array, as_sen_idx, (3,NENGX,NPNTX)); as_sen_idx += sizeof(Float64)*3*NENGX*NPNTX
        MOM_PENG = unsafe_wrap(Array, as_sen_idx, (3,NENGX,NPNTX)); as_sen_idx += sizeof(Float64)*3*NENGX*NPNTX

        as_edi = cglobal((:as_edi_, libaswing), Int32); as_edi_idx = as_edi
        JEDIT = unsafe_wrap(Array, as_edi_idx, 1); as_edi_idx += sizeof(Int32)
        ISEDIT = unsafe_wrap(Array, as_edi_idx, 1); as_edi_idx += sizeof(Int32)

        as_edl = cglobal((:as_edl_, libaswing), Int32); as_edl_idx = as_edl
        LSLOPE = unsafe_wrap(Array, as_edl_idx, 1); as_edl_idx += sizeof(Int32)
        ledsym = unsafe_wrap(Array, as_edl_idx, (JBX+1,NBX));
        LEDSYM = OffsetArrays.OffsetArray(ledsym, 0:JBX, 1:NBX)

        as_edr = cglobal((:as_edr_, libaswing), Float64); as_edr_idx = as_edr
        EDPAR = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        TOFFE = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        TFACE = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        QOFFE = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        QFACE = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        TBMIN = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        TBMAX = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        DELTB = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        QBMIN = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        QBMAX = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)
        DELQB = unsafe_wrap(Array, as_edr_idx, 1); as_edr_idx += sizeof(Float64)

        com_vgi = cglobal((:com_vgi_, libaswing), Int32)
        IGUST = unsafe_wrap(Array, com_vgi, 1)

        com_vgr = cglobal((:com_vgr_, libaswing), Float64)
        VGCON = unsafe_wrap(Array, com_vgr, 6)

        new(PI, DTOR, VERSION, STIPL, STIPR, TBTIPL, TBTIPR, MACHPG, GEEW, SREF,
            CREF, BREF, XYZREF, BGREFX, BGREFY, BGREFZ, ULCON, GRNORM, VSOSL,
            VSO_SI, VSOSL_SI, RHOSL, RHO_SI, RHOSL_SI, RMUSL, RMU_SI, RMUSL_SI,
            EXPII, EXPNN, LALTKM, AUTSCL, LTERSE, LVLFIX, LAELAG, LLEVEC,
            STEADY, CONLAW, CONSET, LFGUST, LROMFR, LVISEN, LLGROU, LLREFP,
            LAXPLT, LELIST, LENGLI, LESPEC, LNODES, LUNSWP, LPLRIB, LPLZLO,
            LPLBAR, LFRPAN, LFRROT, LGEOM, LLRHS, LVAIC, LWSET, LCSET, LQBDEF,
            LBSYMM, LSFLAP, LSPENG, LSSENS, LQINI, LAINI, LCONV, LMACH, PSTEADY,
            LPBEAM, LPWAKE, LDCON, LUCON, LQCON, NQ, NCP, IBEAM, IICON, II,
            IFRST, ILAST, IITOT, NNCON, NN, NFRST, NLAST, NNTOT, KEQ0, KEQ,
            NRHS, NGVAR, NGPAR, NGFOR, NGFEQ, NFRP, NFRPF, NFRPR, NBEAM, NFUSE,
            NSURF, ICOORD, IENGTYP, IGUSDIR, NXGUST, NYGUST, NZGUST, NFGUST,
            IGRIM, LRES, LQJOIN, LAN, LHEAD, LELEV, LBANK, LVAC, LRAC, LVEL,
            LROT, LPOS, LFLAP, LPENG, LVIDT, LALDT, LBEDT, LHEDT, LELDT, LBADT,
            LWDT, LADT, LVIDTS, LALDTS, LBEDTS, LHEDTS, LELDTS, LBADTS, LWDTS,
            LADTS, LFRPK, KFRPL, LFLAPF, LPENGF, LGUS1F, LGUS2F, LGUS3F, LGUS4F,
            VGI_FRP, AFORCE, RFORCE, EFORCE, GFORCE, TFORCE, AMOMNT, RMOMNT,
            EMOMNT, GMOMNT, TMOMNT, AFOR_Q, AFOR_GL, AFOR_FRP, AMOM_Q, AMOM_GL,
            AMOM_FRP, RFOR_Q, RFOR_GL, RFOR_FRP, RMOM_Q, RMOM_GL, RMOM_FRP,
            EFOR_Q, EFOR_GL, EFOR_FRP, EMOM_Q, EMOM_GL, EMOM_FRP, GFOR_Q,
            GFOR_GL, GFOR_FRP, GMOM_Q, GMOM_GL, GMOM_FRP, AFOR_UT, AFOR_GLT,
            AMOM_UT, AMOM_GLT, RFOR_UT, RFOR_GLT, RMOM_UT, RMOM_GLT, EFOR_UT,
            EFOR_GLT, EMOM_UT, EMOM_GLT, GFOR_UT, GFOR_GLT, GMOM_UT, GMOM_GLT,
            FAERO, FAERO_Q, FAERO_GL, FAERO_FRP, FAERO_UT, FAERO_GLT, MAERO,
            MAERO_Q, MAERO_GL, MAERO_FRP, MAERO_UT, MAERO_GLT, DVENG, XENG,
            XENG_ANG, RENG, RENG_ANG, VENG, VENG_Q, VENG_GL, FENG, FENG_Q,
            FENG_GL, MENG, MENG_Q, MENG_GL, MASS, MASSP, MASSB, AREAB, RCGXYZ0,
            RMASST0, RINERT0, RCGXYZ, RMASST, RINERT, PCGXYZ0, PMASST0, PINERT0,
            PCGXYZ, PMASST, PINERT, AMASST0, AINERT0, AMASST, AINERT, RCGXYZB0,
            RMASSTB0, AMASSTB0, RINERTB0, AINERTB0, RCGXYZB, RMASSTB, RINERTB,
            AMASSTB, AINERTB, QPYLO, TB, QB, QBT, TJOIN, TGROU, SBRK, TBFIL,
            QBFIL, QBTFIL, ANGJ, ANGJM, MOMJ, HJAX, NB, KBTYPE, KBNUM, KBPYLO,
            KBJOIN, KBGROU, NPYLO, ISPYLO, IPYLO, KPTYPE, ISSENS, ISENS, NJOIN,
            ISJOIN, IJOIN, KJTYPE, NGROU, ISGROU, IGROU, KGTYPE, NCORN, ISCORN,
            ICORN, JBCORN, IBCORN, NBRK, IBRK, JFIL, ISFIL, NBFIL, NANGJ, QSNSP,
            QSENS, QSENS_Q, QSENS_QT, QSENS_GL, QSENS_GLT, QSENS_FRP, TPMAT,
            VIWIND, ALWIND, BEWIND, VIW_VEL, ALW_VEL, BEW_VEL, Q, Q0, QPAR, S,
            THET, SPLT, TBI, SCP, XYZTFZ, XYZTFZI, PARAM, AN, PSPEC, PSPECSET,
            WFLAP, WPENG, QJOIN, QPNT, DTIME, TIME, QTWT, RDOT, UDOT, PSDOT,
            ANDOT, QSDOT, AKGUST, ALGUST, VFGUST, NPOINT, IPOINT, NPTIME, IPNTD,
            IPNTVL, KCSET, IQEXP, IPPAR, IPPARSET, ANF, RCCORE, VIB, WIB, VEB,
            VIC, WIC, VEC, VIP, WIP, VEP, VIB_MA, WIB_MA, VIC_MA, WIC_MA,
            VIP_MA, WIP_MA, VIB_AL, WIB_AL, VEB_AL, VIC_AL, WIC_AL, VEC_AL,
            VIP_AL, WIP_AL, VEP_AL, VIB_BE, WIB_BE, VEB_BE, VIC_BE, WIC_BE,
            VEC_BE, VIP_BE, WIP_BE, VEP_BE, VIB_POS, WIB_POS, VIC_POS, WIC_POS,
            VIP_POS, WIP_POS, VIB_EUL, WIB_EUL, VIC_EUL, WIC_EUL, VIP_EUL,
            WIP_EUL, VIB_AN, WIB_VI, VIC_AN, WIC_VI, VIP_AN, WIP_VI, VEB_XENG,
            VEB_RENG, VEC_XENG, VEC_RENG, VEP_XENG, VEP_RENG, VEB_VENG,
            VEC_VENG, VEP_VENG, VEB_FENG, VEB_MENG, VEC_FENG, VEC_MENG,
            VEP_FENG, VEP_MENG, VIB_AN_MA, WIB_VI_MA, VIC_AN_MA, WIC_VI_MA,
            VIP_AN_MA, WIP_VI_MA, VIB_AN_AL, WIB_VI_AL, VIC_AN_AL, WIC_VI_AL,
            VIP_AN_AL, WIP_VI_AL, VIB_AN_BE, WIB_VI_BE, VIC_AN_BE, WIC_VI_BE,
            VIP_AN_BE, WIP_VI_BE, VIB_AN_POS, WIB_VI_POS, VIC_AN_POS,
            WIC_VI_POS, VIP_AN_POS, WIP_VI_POS, VIB_AN_EUL, WIB_VI_EUL,
            VIC_AN_EUL, WIC_VI_EUL, VIP_AN_EUL, WIP_VI_EUL, VEB_GL, VEC_GL,
            VEP_GL, AJSAV, CJSAV, RJSAV, ATJSAV, CTJSAV, RTJSAV, RFRPJSAV, A, B,
            C, R, AT, BT, CT, RT, RFRP, GVSYS, GPSYS, GFSYS, GVSYST, GPSYST,
            GFSYST, GVQ, GPQ, GFQ, GVQT, GPQT, GFQT, GVFRP, GPFRP, GFFRP, GFLSQ,
            WLSQ, ZA, ZB, ZC, ZR, ZGVSYS, ZGPSYS, ZGFSYS, ZGVQ, ZGPQ, ZGFQ,
            NGVQ, KGVQ, IGVQ, NGPQ, KGPQ, IGPQ, NGFQ, KGFQ, IGFQ, NGVQZ, KGVQZ,
            IGVQZ, NGPQZ, KGPQZ, IGPQZ, NGFQZ, KGFQZ, IGFQZ, NGVQ1, NGPQ1,
            NGFQ1, IGVPIV, IGPPIV, IGFPIV, ITER, ITMAX, NEIGIT, EPS, DELRMS,
            DELMAX, DGLOB, DQ, ARGP1, ARGP2, PREFIX, NAME, ANAME, BNAME, CNAME,
            CUNIT, CKEY, RNAME, RUNIT, RKEY, IDEV, IDEVRP, IDEVM, IPSLU, NCOLOR,
            NBFREQ, NBEIGEN, NFRAME, IVGCUT, IVGFUN, ILINE, ICOLOR, ICOLB,
            ICOLF, LPLOT, LPGRID, LCEDPL, LSVMOV, SCRNFL, SCRNFP, SIZE, CSIZ,
            XWIND, YWIND, AZIMOB, ELEVOB, ROBINV, XYZUP, WAKLFR, SAXLFR, SLOMOF,
            EIGENF, TMOVIE, TIME1, TIME2, DPHASE, SCALEF, DTDUMP, BFREQ1,
            BFREQ2, VGCXYZ, VGCLIM, CL_VEL, CM_VEL, CN_VEL, CR_VEL, CL_ROT,
            CM_ROT, CN_ROT, CR_ROT, FOR_VEL, MOM_VEL, FOR_ROT, MOM_ROT,
            FOR_FLAP, MOM_FLAP, FOR_PENG, MOM_PENG, JEDIT, ISEDIT, LSLOPE,
            LEDSYM, EDPAR, TOFFE, TFACE, QOFFE, QFACE, TBMIN, TBMAX, DELTB,
            QBMIN, QBMAX, DELQB, IGUST, VGCON
            )
    end
end
