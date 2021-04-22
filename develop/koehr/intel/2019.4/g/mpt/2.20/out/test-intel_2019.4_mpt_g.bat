#!/bin/sh -l
#PBS -N test-intel_2019.4_mpt_g.bat
#PBS -l walltime=1:00:00
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=48:mpiprocs=48
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work1/mpotts/intel_2019.4_mpt_g_develop

module unload compiler/intel mpt
module load compiler/intel/2019.4.243 mpt/2.20 netcdf-c-parallel/intel/sgimpt/4.3.3.1
module load netcdf-fortran-parallel/intel/sgimpt/4.4.2 
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF_INCLUDE=/app/unsupported/netcdf-c-parallel/4.3.3.1/intel/sgimpt/include
export ESMF_NETCDFF_INCLUDE=/app/unsupported/netcdf-fortran-parallel/4.4.2/intel/sgimpt/include
export ESMF_NETCDF_LIBS=-lnetcdf
export ESMF_NETCDF_LIBPATH=/app/unsupported/netcdf-c-parallel/4.3.3.1/intel/sgimpt/lib
export ESMF_NETCDFF_LIBS="-lnetcdff -lnetcdf -lhdf5 -lhdf5_hl -lz"
export ESMF_NETCDFF_LIBPATH="/app/unsupported/netcdf-fortran-parallel/4.4.2/intel/sgimpt/lib /app/unsupported/hdf5-mpi/1.10.5/intel/sgimpt/lib /app/unsupported/netcdf-c-parallel/4.3.3.1/intel/sgimpt/lib"
export ESMF_DIR=/p/work1/mpotts/intel_2019.4_mpt_g_develop
export ESMF_COMPILER=intel
export ESMF_COMM=mpt
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh koehr06 /p/work1/mpotts/intel_2019.4_mpt_g_develop/getres-test.sh
ssh koehr06 /p/work1/mpotts/intel_2019.4_mpt_g_develop/getres-test.sh
