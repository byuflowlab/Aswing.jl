#defines variables found in DIMEN.INC for use in Julia

const IBX = 200
const IIX = 400
const NBX = 40
const NJX = 30
const NGX = 8
const NCX = 1200
const NPX = 400
const NNX = 250
const NAJX = 40
const NPNTX = 201
const NTIMX = 201
const NSENX = 36
const NRITZX = 800
const NFLPX = 20
const NENGX = 12
const NXGUSX = 10
const NYGUSX = 10
const NSETX = 3
const KPX = 21
const JBX = 102
const NGVX = 12*NJX + NNX
const NGPX = 27 + 12*NSENX
const NGFX  = NFLPX + NENGX
const NGUSX = NXGUSX*NYGUSX
const NFRPX = NFLPX + NENGX +   NXGUSX*(2*NYGUSX-1)
const NFRLX = NFLPX + NENGX + 2*NXGUSX*(2*NYGUSX-1)
const NGVQX = NNX*(IIX-NGX-2*NJX-NENGX) + 27*NJX
const NGPQX = IIX*18
const NGFQX = IIX*NGFX
const NGLX  = NGVX + NGPX + NGFX + 1
const NBRKX = NPX + NJX + NGX + NCX
