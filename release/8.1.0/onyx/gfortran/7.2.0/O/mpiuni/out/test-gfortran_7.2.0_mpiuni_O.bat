#!/bin/bash -l
#PBS -N test-gfortran_7.2.0_mpiuni_O.bat
#PBS -j oe
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=44:mpiprocs=44
#PBS -l walltime=2:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work/mpotts/gfortran_7.2.0_mpiuni_O

module unload PrgEnv-cray PrgEnv-intel

module load PrgEnv-gnu
export ESMF_MPIRUN=/p/work/mpotts/gfortran_7.2.0_mpiuni_O/src/Infrastructure/stubs/mpiuni/mpirun
module load gcc/7.2.0  netcdf/gcc-7.3.0/4.6.2
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/p/work/mpotts/gfortran_7.2.0_mpiuni_O
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make install 2>&1|tee install_$JOBID.log 
make all_tests 2>&1|tee test_$JOBID.log 

export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd nuopc-app-prototypes
./testProtos.sh 2>&1|tee ../nuopc_$JOBID.log 

