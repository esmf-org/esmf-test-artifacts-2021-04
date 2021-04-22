#!/bin/sh -l
#PBS -N test-gfortran_7.3.0_mpt_g.bat
#PBS -l walltime=1:00:00
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=48:mpiprocs=48
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work1/mpotts/gfortran_7.3.0_mpt_g_develop

module unload compiler/intel mpt

module load costinit
module load gcc/7.3.0 mpt/2.20 netcdf-c/gnu/4.3.3.1
module load netcdf-c/gnu/4.4.2 
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF_LIBPATH="/app/COST/netcdf-fortran/4.4.2/gnu/lib /app/COST/netcdf-c/4.3.3.1/gnu//lib /app/COST/hdf5/1.8.15/gnu//lib"
export ESMF_NETCDFF_LIBS="-lnetcdff -lnetcdf -lhdf5 -lhdf5_hl -lz"
export ESMF_NETCDF_LIBPATH=/app/COST/netcdf-c/4.3.3.1/gnu//lib
export ESMF_NETCDF_INCLUDE=/app/COST/netcdf-c/4.3.3.1/gnu/include
export ESMF_NETCDFF_INCLUDE="/app/COST/netcdf-fortran/4.4.2/gnu/include /app/COST/netcdf-c/4.3.3.1/gnu//include /app/COST/hdf5/1.8.15/gnu//include"
export ESMF_NETCDFF_LIBPATH="/app/COST/netcdf-fortran/4.4.2/gnu/lib /app/COST/netcdf-c/4.3.3.1/gnu//lib /app/COST/hdf5/1.8.15/gnu//lib"
export ESMF_DIR=/p/work1/mpotts/gfortran_7.3.0_mpt_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpt
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh koehr06 /p/work1/mpotts/gfortran_7.3.0_mpt_g_develop/getres-test.sh
ssh koehr06 /p/work1/mpotts/gfortran_7.3.0_mpt_g_develop/getres-test.sh
