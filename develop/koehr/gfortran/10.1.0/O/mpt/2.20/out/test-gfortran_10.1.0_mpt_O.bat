#!/bin/sh -l
#PBS -N test-gfortran_10.1.0_mpt_O.bat
#PBS -l walltime=1:00:00
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=48:mpiprocs=48
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work1/mpotts/gfortran_10.1.0_mpt_O_develop

module unload compiler/intel mpt

module load costinit
module load gcc/10.1.0 mpt/2.20 

module list >& module-test.log

set -x

export ESMF_F90COMPILEOPTS="-fallow-argument-mismatch -fallow-invalid-boz"
export ESMF_DIR=/p/work1/mpotts/gfortran_10.1.0_mpt_O_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpt
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh koehr06 /p/work1/mpotts/gfortran_10.1.0_mpt_O_develop/getres-test.sh
ssh koehr06 /p/work1/mpotts/gfortran_10.1.0_mpt_O_develop/getres-test.sh
