#!/bin/sh -l
#PBS -N build-gfortran_7.2.0_mpiuni_g.bat
#PBS -l walltime=1:00:00
#PBS -l walltime=1:00:00
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=44:mpiprocs=44
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work/mpotts/gfortran_7.2.0_mpiuni_g_develop

module unload PrgEnv-cray PrgEnv-intel

module load PrgEnv-gnu
module load gcc/7.2.0  netcdf/gcc-7.3.0/4.6.2
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/p/work/mpotts/gfortran_7.2.0_mpiuni_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 44 clean 2>&1| tee clean_$JOBID.log 
make -j 44 2>&1| tee build_$JOBID.log

ssh onyx /p/work/mpotts/gfortran_7.2.0_mpiuni_g_develop/getres-build.sh
