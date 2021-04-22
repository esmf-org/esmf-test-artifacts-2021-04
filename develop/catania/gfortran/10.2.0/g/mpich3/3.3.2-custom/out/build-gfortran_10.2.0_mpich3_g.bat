#!/home/mpotts/bin/bash -l
export JOBID=12345

module use /project/esmf/stack/modulefiles
module load gnu/10.2.0/compiler gnu/10.2.0/mpich3/3.3.2-custom gnu/10.2.0/netcdf-c/4.7.4
module load gnu/10.2.0/netcdf-fortran/4.5.3 
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_F90COMPILEOPTS="-fallow-argument-mismatch -fallow-invalid-boz"
export ESMF_DIR=/Volumes/esmf/mpotts/gfortran_10.2.0_mpich3_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich3
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 4 clean 2>&1| tee clean_$JOBID.log 
make -j 4 2>&1| tee build_$JOBID.log

