#!/bin/bash -l
export JOBID=12346

module use /project/esmf/modulefiles
module load compiler/gnu/8.2.0  tool/netcdf/4.6.1/gcc
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/scratch/mpotts/gfortran_8.2.0_mpiuni_O_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
