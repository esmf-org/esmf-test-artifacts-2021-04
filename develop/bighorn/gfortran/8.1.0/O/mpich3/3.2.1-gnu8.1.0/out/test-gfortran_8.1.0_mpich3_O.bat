#!/bin/bash -l
export JOBID=12346

module use /project/esmf/modulefiles
module load compiler/gnu/8.1.0 mpich/3.2.1-gnu8.1.0 tool/netcdf/4.6.1/gcc-8.1.0
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/scratch/mpotts/gfortran_8.1.0_mpich3_O_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich3
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
