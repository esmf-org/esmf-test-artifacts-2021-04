#!/bin/bash -l
export JOBID=12345

module use /project/esmf/modulefiles
module load compiler/gnu/4.8.5 mpich/3.2.1-gnu4.8.5 tool/netcdf/4.6.1/gcc-4.8.5
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/scratch/mpotts/gfortran_4.8.5_mpich3_O_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich3
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 8 clean 2>&1| tee clean_$JOBID.log 
make -j 8 2>&1| tee build_$JOBID.log

