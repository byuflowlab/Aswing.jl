using BinDeps

@BinDeps.setup

# define dependencies
libaswing = library_dependency("libaswing")

# define folders
srcdir = joinpath(BinDeps.depsdir(libaswing),"src")
libdir = joinpath(BinDeps.depsdir(libaswing),"usr","lib")
downloaddir = joinpath(BinDeps.depsdir(libaswing),"downloads")
aswingbin = joinpath(srcdir,"aswing","bin")
arpackdir = joinpath(srcdir,"ARPACK")
arpacklib = joinpath(arpackdir,"libarpack_aswing.a")

# create necessary paths
for path in [libdir,downloaddir,arpackdir]
  if !isfile(path)
    mkpath(path)
  end
end

arpackbuildvars = [
  "home=$arpackdir",
  "PLAT=aswing",
  "FC=gfortran",
  "FFLAGS=-O3 -shared -fPIC",
  "MAKE=make",
  "PRECISIONS=complex16",
]

# get suffix
suffix = Sys.isapple() ? "dylib" : "so"

aswingbuildvars = [
  "INSTALL_DIR=$libdir",
  "SUFFIX=$suffix",
  "ARLIB=$arpacklib",
]

# build process
provides(SimpleBuild,
  (@build_steps begin
    ChangeDirectory(aswingbin)
    @build_steps begin
      ChangeDirectory(arpackdir)
      download_cmd("http://www.caam.rice.edu/software/ARPACK/SRC/arpack96.tar.gz",joinpath(downloaddir,"arpack96.tar.gz"))
      unpack_cmd(joinpath(downloaddir,"arpack96.tar.gz"),srcdir,".gz",".tar")
      download_cmd("http://www.caam.rice.edu/software/ARPACK/SRC/patch.tar.gz",joinpath(downloaddir,"patch.tar.gz"))
      unpack_cmd(joinpath(downloaddir,"arpack96.tar.gz"),srcdir,".gz",".tar")
      `make lib $arpackbuildvars`
    end
    `make $aswingbuildvars`
    `make install $aswingbuildvars`
  end),libaswing, os = :Unix)

@BinDeps.install Dict(:libaswing => :libaswing)
