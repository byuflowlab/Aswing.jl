
      INCLUDE 'DIMEN.INC'

      LOGICAL CUSTOMINTERVALS

      COMMON/AS_LTHET/
     & CUSTOMINTERVALS !  if true, number of panels on each interval is user defined

      COMMON/AS_ITHET/
     & INTERVALS(0:NBRKX+1)  !  interval number assignment for each break interval
