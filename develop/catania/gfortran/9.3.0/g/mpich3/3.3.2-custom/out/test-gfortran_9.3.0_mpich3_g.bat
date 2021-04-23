#!/home/mpotts/bin/bash -l
export JOBID=12346

module use /project/esmf/stack/modulefiles
export LIBRARY_PATH=$LIBRARY_PATH:/project/esmf/stack/install/gcc/10.2.0/mpich/3.3.2/lib
module load gnu/9.3.0/compiler gnu/9.3.0/mpich3/3.3.2-custom gnu/9.3.0/netcdf-c/4.7.4
module load gnu/9.3.0/netcdf-fortran/4.5.3 
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/Volumes/esmf/mpotts/gfortran_9.3.0_mpich3_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich3
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
