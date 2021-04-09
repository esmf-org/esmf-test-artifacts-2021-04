#!/bin/bash -l
export JOBID=$1

module use /project/esmf/stack/modulefiles
module load gnu/9.3.0/compiler  gnu/9.3.0/netcdf-c/4.7.4
module load gnu/9.3.0/netcdf-fortran/4.5.3 
module list
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/Volumes/esmf/mpotts/gfortran_9.3.0_mpiuni_g
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 

export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

