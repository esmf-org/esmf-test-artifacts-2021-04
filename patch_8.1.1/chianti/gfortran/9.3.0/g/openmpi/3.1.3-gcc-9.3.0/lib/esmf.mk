build time -- 2021-04-26 11:03:20.722786
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
ESMF_VERSION_STRING=8.1.1
ESMF_VERSION_STRING_GIT=ESMF_8_1_1
#----------------------------------------------

ESMF_VERSION_MAJOR=8
ESMF_VERSION_MINOR=1
ESMF_VERSION_REVISION=1
ESMF_VERSION_PATCHLEVEL=1
ESMF_VERSION_PUBLIC='T'
ESMF_VERSION_BETASNAPSHOT='F'


ESMF_APPSDIR=/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/apps/appsg/Linux.gfortran.64.openmpi.default
ESMF_LIBSDIR=/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default


ESMF_F90COMPILER=mpifort
ESMF_F90LINKER=mpifort

ESMF_F90COMPILEOPTS=-g -Wall -Wextra -Wconversion -Wno-unused -Wno-unused-dummy-argument -fbacktrace -fimplicit-none -fcheck=all,no-pointer -fPIC  -m64 -mcmodel=small -pthread -ffree-line-length-none  -fopenmp
ESMF_F90COMPILEPATHS=-I/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/mod/modg/Linux.gfortran.64.openmpi.default -I/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/src/include -I/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-c-4.7.4-mh42cmw5oougqeytguqxjkkrrd2bfdsl/include -I/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-fortran-4.5.3-7cigsuiobyasv6mbext7pmabw5fhzo6y/include
ESMF_F90COMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMFVERSIONGIT='ESMF_8_1_1' -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_PIO=1 -DESMF_MPIIO -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=openmpi -DESMF_DIR=/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1
ESMF_F90COMPILEFREECPP=
ESMF_F90COMPILEFREENOCPP=-ffree-form
ESMF_F90COMPILEFIXCPP=-cpp -ffixed-form
ESMF_F90COMPILEFIXNOCPP=

ESMF_F90LINKOPTS=   -m64 -mcmodel=small -pthread -Wl,--no-as-needed  -fopenmp
ESMF_F90LINKPATHS=-L/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default -L/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-c-4.7.4-mh42cmw5oougqeytguqxjkkrrd2bfdsl/lib -L/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-fortran-4.5.3-7cigsuiobyasv6mbext7pmabw5fhzo6y/lib -L/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-7.5.0/gcc-9.3.0-3ltccu6cenbq/lib64/../lib64/
ESMF_F90ESMFLINKPATHS=-L/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default
ESMF_F90LINKRPATHS=-Wl,-rpath,/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default -Wl,-rpath,/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-c-4.7.4-mh42cmw5oougqeytguqxjkkrrd2bfdsl/lib -Wl,-rpath,/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-fortran-4.5.3-7cigsuiobyasv6mbext7pmabw5fhzo6y/lib -Wl,-rpath,/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-7.5.0/gcc-9.3.0-3ltccu6cenbq/lib64/../lib64/
ESMF_F90ESMFLINKRPATHS=-Wl,-rpath,/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default
ESMF_F90LINKLIBS= -lmpi_cxx -lrt -lstdc++ -ldl -lnetcdf -lnetcdff
ESMF_F90ESMFLINKLIBS=-lesmf  -lmpi_cxx -lrt -lstdc++ -ldl -lnetcdf -lnetcdff

ESMF_CXXCOMPILER=mpicxx
ESMF_CXXLINKER=mpicxx

ESMF_CXXCOMPILEOPTS=-std=c++11 -g -Wall -Wextra -Wno-unused  -fPIC -DESMF_LOWERCASE_SINGLEUNDERSCORE -m64 -mcmodel=small -pthread  -fopenmp
ESMF_CXXCOMPILEPATHS= -I/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/src/include  -I/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-c-4.7.4-mh42cmw5oougqeytguqxjkkrrd2bfdsl/include -I/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/src/prologue/yaml-cpp/include
ESMF_CXXCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMFVERSIONGIT='ESMF_8_1_1' -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_PIO=1 -DESMF_MPIIO -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=openmpi -DESMF_DIR=/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1 -D__SDIR__='' -DESMF_CXXSTD=11 -DESMF_NO_SIGUSR2

ESMF_CXXLINKOPTS=  -m64 -mcmodel=small -pthread -Wl,--no-as-needed  -fopenmp
ESMF_CXXLINKPATHS=-L/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default -L/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-c-4.7.4-mh42cmw5oougqeytguqxjkkrrd2bfdsl/lib -L/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-fortran-4.5.3-7cigsuiobyasv6mbext7pmabw5fhzo6y/lib -L/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-7.5.0/gcc-9.3.0-3ltccu6cenbq/lib64/../lib64/
ESMF_CXXESMFLINKPATHS=-L/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default
ESMF_CXXLINKRPATHS=-Wl,-rpath,/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default -Wl,-rpath,/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-c-4.7.4-mh42cmw5oougqeytguqxjkkrrd2bfdsl/lib -Wl,-rpath,/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-fortran-4.5.3-7cigsuiobyasv6mbext7pmabw5fhzo6y/lib -Wl,-rpath,/home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-7.5.0/gcc-9.3.0-3ltccu6cenbq/lib64/../lib64/
ESMF_CXXESMFLINKRPATHS=-Wl,-rpath,/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default
ESMF_CXXLINKLIBS= -lmpi_mpifh -lrt -lgfortran -ldl -lnetcdf -lnetcdff
ESMF_CXXESMFLINKLIBS=-lesmf  -lmpi_mpifh -lrt -lgfortran -ldl -lnetcdf -lnetcdff

ESMF_SO_F90COMPILEOPTS=-fPIC
ESMF_SO_F90LINKOPTS=-shared
ESMF_SO_F90LINKOPTSEXE=-Wl,-export-dynamic
ESMF_SO_CXXCOMPILEOPTS=-fPIC
ESMF_SO_CXXLINKOPTS=-shared
ESMF_SO_CXXLINKOPTSEXE=-Wl,-export-dynamic

ESMF_OPENMP_F90COMPILEOPTS= -fopenmp
ESMF_OPENMP_F90LINKOPTS= -fopenmp
ESMF_OPENMP_CXXCOMPILEOPTS= -fopenmp
ESMF_OPENMP_CXXLINKOPTS= -fopenmp

ESMF_OPENACC_F90COMPILEOPTS=
ESMF_OPENACC_F90LINKOPTS=
ESMF_OPENACC_CXXCOMPILEOPTS=
ESMF_OPENACC_CXXLINKOPTS=

# ESMF Tracing compile/link options
ESMF_TRACE_LDPRELOAD=/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1/lib/libg/Linux.gfortran.64.openmpi.default/libesmftrace_preload.so
ESMF_TRACE_STATICLINKOPTS=-static -Wl,--wrap=c_esmftrace_notify_wrappers -Wl,--wrap=c_esmftrace_isinitialized -Wl,--wrap=write -Wl,--wrap=writev -Wl,--wrap=pwrite -Wl,--wrap=read -Wl,--wrap=open -Wl,--wrap=MPI_Allgather -Wl,--wrap=MPI_Allgatherv -Wl,--wrap=MPI_Allreduce -Wl,--wrap=MPI_Alltoall -Wl,--wrap=MPI_Alltoallv -Wl,--wrap=MPI_Alltoallw -Wl,--wrap=MPI_Barrier -Wl,--wrap=MPI_Bcast -Wl,--wrap=MPI_Bsend -Wl,--wrap=MPI_Gather -Wl,--wrap=MPI_Gatherv -Wl,--wrap=MPI_Iprobe -Wl,--wrap=MPI_Irecv -Wl,--wrap=MPI_Irsend -Wl,--wrap=MPI_Isend -Wl,--wrap=MPI_Issend -Wl,--wrap=MPI_Probe -Wl,--wrap=MPI_Recv -Wl,--wrap=MPI_Reduce -Wl,--wrap=MPI_Rsend -Wl,--wrap=MPI_Scan -Wl,--wrap=MPI_Scatter -Wl,--wrap=MPI_Scatterv -Wl,--wrap=MPI_Send -Wl,--wrap=MPI_Sendrecv -Wl,--wrap=MPI_Test -Wl,--wrap=MPI_Testall -Wl,--wrap=MPI_Testany -Wl,--wrap=MPI_Testsome -Wl,--wrap=MPI_Wait -Wl,--wrap=MPI_Waitall -Wl,--wrap=MPI_Waitany -Wl,--wrap=MPI_Waitsome -Wl,--wrap=mpi_allgather_ -Wl,--wrap=mpi_allgather__ -Wl,--wrap=mpi_allgatherv_ -Wl,--wrap=mpi_allgatherv__ -Wl,--wrap=mpi_allreduce_ -Wl,--wrap=mpi_allreduce__ -Wl,--wrap=mpi_alltoall_ -Wl,--wrap=mpi_alltoall__ -Wl,--wrap=mpi_alltoallv_ -Wl,--wrap=mpi_alltoallv__ -Wl,--wrap=mpi_alltoallw_ -Wl,--wrap=mpi_alltoallw__ -Wl,--wrap=mpi_barrier_ -Wl,--wrap=mpi_barrier__ -Wl,--wrap=mpi_bcast_ -Wl,--wrap=mpi_bcast__ -Wl,--wrap=mpi_bsend_ -Wl,--wrap=mpi_bsend__ -Wl,--wrap=mpi_exscan_ -Wl,--wrap=mpi_exscan__ -Wl,--wrap=mpi_gather_ -Wl,--wrap=mpi_gather__ -Wl,--wrap=mpi_gatherv_ -Wl,--wrap=mpi_gatherv__ -Wl,--wrap=mpi_iprobe_ -Wl,--wrap=mpi_iprobe__ -Wl,--wrap=mpi_irecv_ -Wl,--wrap=mpi_irecv__ -Wl,--wrap=mpi_irsend_ -Wl,--wrap=mpi_irsend__ -Wl,--wrap=mpi_isend_ -Wl,--wrap=mpi_isend__ -Wl,--wrap=mpi_issend_ -Wl,--wrap=mpi_issend__ -Wl,--wrap=mpi_probe_ -Wl,--wrap=mpi_probe__ -Wl,--wrap=mpi_recv_ -Wl,--wrap=mpi_recv__ -Wl,--wrap=mpi_reduce_ -Wl,--wrap=mpi_reduce__ -Wl,--wrap=mpi_reduce_scatter_ -Wl,--wrap=mpi_reduce_scatter__ -Wl,--wrap=mpi_rsend_ -Wl,--wrap=mpi_rsend__ -Wl,--wrap=mpi_scatter_ -Wl,--wrap=mpi_scatter__ -Wl,--wrap=mpi_scatterv_ -Wl,--wrap=mpi_scatterv__ -Wl,--wrap=mpi_scan_ -Wl,--wrap=mpi_scan__ -Wl,--wrap=mpi_send_ -Wl,--wrap=mpi_send__ -Wl,--wrap=mpi_sendrecv_ -Wl,--wrap=mpi_sendrecv__ -Wl,--wrap=mpi_test_ -Wl,--wrap=mpi_test__ -Wl,--wrap=mpi_testall_ -Wl,--wrap=mpi_testall__ -Wl,--wrap=mpi_testany_ -Wl,--wrap=mpi_testany__ -Wl,--wrap=mpi_testsome_ -Wl,--wrap=mpi_testsome__ -Wl,--wrap=mpi_wait_ -Wl,--wrap=mpi_wait__ -Wl,--wrap=mpi_waitall_ -Wl,--wrap=mpi_waitall__ -Wl,--wrap=mpi_waitany_ -Wl,--wrap=mpi_waitany__
ESMF_TRACE_STATICLINKLIBS=-lesmftrace_static

# Internal ESMF variables, do NOT depend on these!

ESMF_INTERNAL_DIR=/home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1

#
# !!! The following options were used on this ESMF build !!!
#
# ESMF_DIR: /home/mpotts/gfortran_9.3.0_openmpi_g_patch_8.1.1
# ESMF_OS: Linux
# ESMF_MACHINE: x86_64
# ESMF_ABI: 64
# ESMF_COMPILER: gfortran
# ESMF_BOPT: g
# ESMF_COMM: openmpi
# ESMF_SITE: default
# ESMF_PTHREADS: ON
# ESMF_OPENMP: ON
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
# ESMF_NETCDF:            nc-config
# ESMF_NETCDF_INCLUDE:    /home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-c-4.7.4-mh42cmw5oougqeytguqxjkkrrd2bfdsl/include
# ESMF_NETCDF_LIBS:       -lnetcdf
# ESMF_NETCDF_LIBPATH:    /home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-c-4.7.4-mh42cmw5oougqeytguqxjkkrrd2bfdsl/lib
# ESMF_NFCONFIG:          nf-config
# ESMF_NETCDFF_INCLUDE:   /home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-fortran-4.5.3-7cigsuiobyasv6mbext7pmabw5fhzo6y/include
# ESMF_NETCDFF_LIBS:      -lnetcdff
# ESMF_NETCDFF_LIBPATH:   /home/mpotts/spack/opt/spack/linux-linuxmint19-skylake/gcc-9.3.0/netcdf-fortran-4.5.3-7cigsuiobyasv6mbext7pmabw5fhzo6y/lib
# ESMF_PIO:               internal
# ESMF_YAMLCPP:           internal
