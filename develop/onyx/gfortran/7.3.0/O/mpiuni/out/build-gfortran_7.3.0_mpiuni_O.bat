#!/bin/bash -l
#PBS -N build-gfortran_7.3.0_mpiuni_O.bat
#PBS -j oe
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=44:mpiprocs=44
#PBS -l walltime=1:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work/mpotts/gfortran_7.3.0_mpiuni_O

module unload PrgEnv-cray PrgEnv-intel

module load PrgEnv-gnu
export ESMF_MPIRUN=/p/work/mpotts/gfortran_7.3.0_mpiuni_O/src/Infrastructure/stubs/mpiuni/mpirun
module load gcc/7.3.0  

module list >& module-build.log

set -x

export ESMF_DIR=/p/work/mpotts/gfortran_7.3.0_mpiuni_O
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 44 clean 2>&1| tee clean_$JOBID.log 
make -j 44 2>&1| tee build_$JOBID.log

ssh onyx08 /p/work/mpotts/gfortran_7.3.0_mpiuni_O/getres-build.sh

