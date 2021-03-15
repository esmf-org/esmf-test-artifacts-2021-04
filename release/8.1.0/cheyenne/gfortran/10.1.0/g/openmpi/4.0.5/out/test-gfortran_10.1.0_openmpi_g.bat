#!/bin/bash -l
#PBS -N test-gfortran_10.1.0_openmpi_g.bat
#PBS -j oe
#PBS -q regular
#PBS -A p48503002
#PBS -l select=1:ncpus=36:mpiprocs=36
#PBS -l walltime=1:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /glade/scratch/mpotts/gfortran_10.1.0_openmpi_g
module load gnu/10.1.0 openmpi/4.0.5 netcdf/4.7.4
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_F90COMPILEOPTS="-fallow-argument-mismatch -fallow-invalid-boz"
export ESMF_F90COMPILER=mpif90
export ESMF_DIR=/glade/scratch/mpotts/gfortran_10.1.0_openmpi_g
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make install 2>&1|tee install_$JOBID.log 
make all_tests 2>&1|tee test_$JOBID.log 

export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd nuopc-app-prototypes
./testProtos.sh 2>&1|tee ../nuopc_$JOBID.log 

ssh cheyenne6 /glade/scratch/mpotts/gfortran_10.1.0_openmpi_g/getres-test.sh

