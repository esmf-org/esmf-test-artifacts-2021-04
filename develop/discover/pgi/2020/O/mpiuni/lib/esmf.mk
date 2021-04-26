build time -- 2021-04-26 02:38:11.908895
# ESMF application makefile fragment
#
# Use the following ESMF_ variables to compile and link
# your ESMF application against this ESMF build.
#
# !!! VERY IMPORTANT: If the location of this ESMF build is   !!!
# !!! changed, e.g. libesmf.a is copied to another directory, !!!
# !!! this file - esmf.mk - must be edited to adjust to the   !!!
# !!! correct new path                                        !!!
#
# Please see end of file for options used on this ESMF build
#

#----------------------------------------------
ESMF_VERSION_STRING=8.2.0 beta snapshot
ESMF_VERSION_STRING_GIT=ESMF_8_2_0_beta_snapshot_05-4-g394ef51454
#----------------------------------------------

ESMF_VERSION_MAJOR=8
ESMF_VERSION_MINOR=2
ESMF_VERSION_REVISION=0
ESMF_VERSION_PATCHLEVEL=0
ESMF_VERSION_PUBLIC='F'
ESMF_VERSION_BETASNAPSHOT='T'


ESMF_APPSDIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/apps/appsO/Linux.pgi.64.mpiuni.default
ESMF_LIBSDIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default


ESMF_F90COMPILER=pgf90
ESMF_F90LINKER=pgf90

ESMF_F90COMPILEOPTS=-O -fpic -Mallocatable=03 -lpthread
ESMF_F90COMPILEPATHS=-I/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/mod/modO/Linux.pgi.64.mpiuni.default -I/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/src/include 
ESMF_F90COMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMFVERSIONGIT='ESMF_8_2_0_beta_snapshot_05-4-g394ef51454' -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_NO_OPENMP -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=mpiuni -DESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop -DESMF_MPIUNI -DESMF_PGIVERSION_MAJOR=20 -DESMF_PGIVERSION_MINOR=4 -DESMF_PGIVERSION_PATCH=0 -DESMF_NO_F2018ASSUMEDTYPE
ESMF_F90COMPILEFREECPP=
ESMF_F90COMPILEFREENOCPP=-Mfreeform
ESMF_F90COMPILEFIXCPP=-Mpreprocess -Mnofreeform
ESMF_F90COMPILEFIXNOCPP=

ESMF_F90LINKOPTS=  -lpthread -Wl,--no-as-needed
ESMF_F90LINKPATHS=-L/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default  -L/gpfsm/dulocal/sles12/pgi/linux86-64-llvm/20.4/libso
ESMF_F90ESMFLINKPATHS=-L/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default
ESMF_F90LINKRPATHS=-Wl,-rpath,/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default  -Wl,-rpath,/gpfsm/dulocal/sles12/pgi/linux86-64-llvm/20.4/libso
ESMF_F90ESMFLINKRPATHS=-Wl,-rpath,/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default
ESMF_F90LINKLIBS= -pgc++libs -ldl
ESMF_F90ESMFLINKLIBS=-lesmf  -pgc++libs -ldl

ESMF_CXXCOMPILER=pgc++
ESMF_CXXLINKER=pgc++

ESMF_CXXCOMPILEOPTS=-std=c++11 -O -DNDEBUG -fpic -lpthread
ESMF_CXXCOMPILEPATHS= -I/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/src/include   -I/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/src/Infrastructure/stubs/mpiuni -I/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/src/prologue/yaml-cpp/include
ESMF_CXXCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMFVERSIONGIT='ESMF_8_2_0_beta_snapshot_05-4-g394ef51454' -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_NO_OPENMP -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=mpiuni -DESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop -D__SDIR__='' -DESMF_CXXSTD=11 -DESMF_MPIUNI -DESMF_PGIVERSION_MAJOR=20 -DESMF_PGIVERSION_MINOR=4 -DESMF_PGIVERSION_PATCH=0 -DESMF_NO_F2018ASSUMEDTYPE

ESMF_CXXLINKOPTS=  -lpthread -Wl,--no-as-needed
ESMF_CXXLINKPATHS=-L/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default  -L/gpfsm/dulocal/sles12/pgi/linux86-64-llvm/20.4/libso
ESMF_CXXESMFLINKPATHS=-L/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default
ESMF_CXXLINKRPATHS=-Wl,-rpath,/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default  -Wl,-rpath,/gpfsm/dulocal/sles12/pgi/linux86-64-llvm/20.4/libso
ESMF_CXXESMFLINKRPATHS=-Wl,-rpath,/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default
ESMF_CXXLINKLIBS= -pgf90libs -ldl
ESMF_CXXESMFLINKLIBS=-lesmf  -pgf90libs -ldl

ESMF_SO_F90COMPILEOPTS=-fpic
ESMF_SO_F90LINKOPTS=-shared
ESMF_SO_F90LINKOPTSEXE=-Wl,-export-dynamic
ESMF_SO_CXXCOMPILEOPTS=-fpic
ESMF_SO_CXXLINKOPTS=-shared
ESMF_SO_CXXLINKOPTSEXE=-Wl,-export-dynamic

ESMF_OPENMP_F90COMPILEOPTS= -mp
ESMF_OPENMP_F90LINKOPTS= -mp
ESMF_OPENMP_CXXCOMPILEOPTS= -mp --exceptions
ESMF_OPENMP_CXXLINKOPTS= -mp --exceptions

ESMF_OPENACC_F90COMPILEOPTS= -acc -Minfo
ESMF_OPENACC_F90LINKOPTS= -acc -Minfo
ESMF_OPENACC_CXXCOMPILEOPTS= -acc -Minfo
ESMF_OPENACC_CXXLINKOPTS= -acc -Minfo

# ESMF Tracing compile/link options
ESMF_TRACE_LDPRELOAD=/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop/lib/libO/Linux.pgi.64.mpiuni.default/libesmftrace_preload.so
ESMF_TRACE_STATICLINKOPTS=-static -Wl,--wrap=c_esmftrace_notify_wrappers -Wl,--wrap=c_esmftrace_isinitialized -Wl,--wrap=write -Wl,--wrap=writev -Wl,--wrap=pwrite -Wl,--wrap=read -Wl,--wrap=open -Wl,--wrap=MPI_Allgather -Wl,--wrap=MPI_Allgatherv -Wl,--wrap=MPI_Allreduce -Wl,--wrap=MPI_Alltoall -Wl,--wrap=MPI_Alltoallv -Wl,--wrap=MPI_Alltoallw -Wl,--wrap=MPI_Barrier -Wl,--wrap=MPI_Bcast -Wl,--wrap=MPI_Bsend -Wl,--wrap=MPI_Gather -Wl,--wrap=MPI_Gatherv -Wl,--wrap=MPI_Iprobe -Wl,--wrap=MPI_Irecv -Wl,--wrap=MPI_Irsend -Wl,--wrap=MPI_Isend -Wl,--wrap=MPI_Issend -Wl,--wrap=MPI_Probe -Wl,--wrap=MPI_Recv -Wl,--wrap=MPI_Reduce -Wl,--wrap=MPI_Rsend -Wl,--wrap=MPI_Scan -Wl,--wrap=MPI_Scatter -Wl,--wrap=MPI_Scatterv -Wl,--wrap=MPI_Send -Wl,--wrap=MPI_Sendrecv -Wl,--wrap=MPI_Test -Wl,--wrap=MPI_Testall -Wl,--wrap=MPI_Testany -Wl,--wrap=MPI_Testsome -Wl,--wrap=MPI_Wait -Wl,--wrap=MPI_Waitall -Wl,--wrap=MPI_Waitany -Wl,--wrap=MPI_Waitsome -Wl,--wrap=mpi_allgather_ -Wl,--wrap=mpi_allgather__ -Wl,--wrap=mpi_allgatherv_ -Wl,--wrap=mpi_allgatherv__ -Wl,--wrap=mpi_allreduce_ -Wl,--wrap=mpi_allreduce__ -Wl,--wrap=mpi_alltoall_ -Wl,--wrap=mpi_alltoall__ -Wl,--wrap=mpi_alltoallv_ -Wl,--wrap=mpi_alltoallv__ -Wl,--wrap=mpi_alltoallw_ -Wl,--wrap=mpi_alltoallw__ -Wl,--wrap=mpi_barrier_ -Wl,--wrap=mpi_barrier__ -Wl,--wrap=mpi_bcast_ -Wl,--wrap=mpi_bcast__ -Wl,--wrap=mpi_bsend_ -Wl,--wrap=mpi_bsend__ -Wl,--wrap=mpi_exscan_ -Wl,--wrap=mpi_exscan__ -Wl,--wrap=mpi_gather_ -Wl,--wrap=mpi_gather__ -Wl,--wrap=mpi_gatherv_ -Wl,--wrap=mpi_gatherv__ -Wl,--wrap=mpi_iprobe_ -Wl,--wrap=mpi_iprobe__ -Wl,--wrap=mpi_irecv_ -Wl,--wrap=mpi_irecv__ -Wl,--wrap=mpi_irsend_ -Wl,--wrap=mpi_irsend__ -Wl,--wrap=mpi_isend_ -Wl,--wrap=mpi_isend__ -Wl,--wrap=mpi_issend_ -Wl,--wrap=mpi_issend__ -Wl,--wrap=mpi_probe_ -Wl,--wrap=mpi_probe__ -Wl,--wrap=mpi_recv_ -Wl,--wrap=mpi_recv__ -Wl,--wrap=mpi_reduce_ -Wl,--wrap=mpi_reduce__ -Wl,--wrap=mpi_reduce_scatter_ -Wl,--wrap=mpi_reduce_scatter__ -Wl,--wrap=mpi_rsend_ -Wl,--wrap=mpi_rsend__ -Wl,--wrap=mpi_scatter_ -Wl,--wrap=mpi_scatter__ -Wl,--wrap=mpi_scatterv_ -Wl,--wrap=mpi_scatterv__ -Wl,--wrap=mpi_scan_ -Wl,--wrap=mpi_scan__ -Wl,--wrap=mpi_send_ -Wl,--wrap=mpi_send__ -Wl,--wrap=mpi_sendrecv_ -Wl,--wrap=mpi_sendrecv__ -Wl,--wrap=mpi_test_ -Wl,--wrap=mpi_test__ -Wl,--wrap=mpi_testall_ -Wl,--wrap=mpi_testall__ -Wl,--wrap=mpi_testany_ -Wl,--wrap=mpi_testany__ -Wl,--wrap=mpi_testsome_ -Wl,--wrap=mpi_testsome__ -Wl,--wrap=mpi_wait_ -Wl,--wrap=mpi_wait__ -Wl,--wrap=mpi_waitall_ -Wl,--wrap=mpi_waitall__ -Wl,--wrap=mpi_waitany_ -Wl,--wrap=mpi_waitany__
ESMF_TRACE_STATICLINKLIBS=-lesmftrace_static

# Internal ESMF variables, do NOT depend on these!

ESMF_INTERNAL_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop

#
# !!! The following options were used on this ESMF build !!!
#
# ESMF_DIR: /gpfsm/dnb04/projects/p98/mpotts/esmf/pgi_2020_mpiuni_O_develop
# ESMF_OS: Linux
# ESMF_MACHINE: x86_64
# ESMF_ABI: 64
# ESMF_COMPILER: pgi
# ESMF_BOPT: O
# ESMF_COMM: mpiuni
# ESMF_SITE: default
# ESMF_PTHREADS: ON
# ESMF_OPENMP: OFF
# ESMF_OPENACC: OFF
# ESMF_ARRAY_LITE: FALSE
# ESMF_NO_INTEGER_1_BYTE: TRUE
# ESMF_NO_INTEGER_2_BYTE: TRUE
# ESMF_FORTRANSYMBOLS: default
# ESMF_MAPPER_BUILD: OFF
# ESMF_AUTO_LIB_BUILD: ON
# ESMF_DEFER_LIB_BUILD: ON
# ESMF_SHARED_LIB_BUILD: ON
# 
# ESMF environment variables pointing to 3rd party software:
# ESMF_MOAB:              internal
# ESMF_LAPACK:            internal
# ESMF_ACC_SOFTWARE_STACK:            none
# ESMF_YAMLCPP:           internal
