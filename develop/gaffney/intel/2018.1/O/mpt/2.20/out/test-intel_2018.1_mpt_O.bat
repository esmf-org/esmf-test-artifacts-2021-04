#!/bin/sh -l
#PBS -N test-intel_2018.1_mpt_O.bat
#PBS -l walltime=1:00:00
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=48:mpiprocs=48
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work1/mpotts/intel_2018.1_mpt_O_develop

module load cseinit-intel
module load compiler/intel/18.0.1.163 mpt/2.20 cse/netcdf/latest
module load cse/netcdf_fortran/latest 
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_F90COMPILEOPTS=-I$CSE_NETCDF_FORTRAN_INCLUDE_DIR
export ESMF_DIR=/p/work1/mpotts/intel_2018.1_mpt_O_develop
export ESMF_COMPILER=intel
export ESMF_COMM=mpt
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh gaffney06 /p/work1/mpotts/intel_2018.1_mpt_O_develop/getres-test.sh
ssh gaffney06 /p/work1/mpotts/intel_2018.1_mpt_O_develop/getres-test.sh
