# wraps variables found in THCALC.INC for use in Julia

struct THCALC_s
    CUSTOMINTERVALS::Array{Int32,1}
    INTERVALS::OffsetArrays.OffsetArray{Int32,1,Array{Int32,1}}
    function THCALC_s()
        as_lthet = cglobal((:as_lthet_, libaswing), Int32);
        CUSTOMINTERVALS  = unsafe_wrap(Array, as_lthet, 1)

        as_ithet = cglobal((:as_ithet_, libaswing), Int32);
        intervals  = unsafe_wrap(Array, as_ithet, (NBRKX+2))
        INTERVALS = OffsetArrays.OffsetArray(intervals, 0:NBRKX+1)

        return new(CUSTOMINTERVALS, INTERVALS)
    end
end
