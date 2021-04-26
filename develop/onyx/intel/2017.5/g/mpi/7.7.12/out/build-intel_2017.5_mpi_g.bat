#!/bin/sh -l
#PBS -N build-intel_2017.5_mpi_g.bat
#PBS -l walltime=1:00:00
#PBS -l walltime=1:00:00
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=44:mpiprocs=44
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work/mpotts/intel_2017.5_mpi_g_develop

module unload PrgEnv-cray PrgEnv-gnu

module load PrgEnv-intel
export ESMF_F90COMPILER=ftn
module load intel/17.0.5.239 cray-mpich/7.7.12 netcdf/intel-17.0.1.132/4.4.1.1
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/p/work/mpotts/intel_2017.5_mpi_g_develop
export ESMF_COMPILER=intel
export ESMF_COMM=mpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 44 clean 2>&1| tee clean_$JOBID.log 
make -j 44 2>&1| tee build_$JOBID.log

ssh onyx /p/work/mpotts/intel_2017.5_mpi_g_develop/getres-build.sh
