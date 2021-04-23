#!/bin/sh -l
#PBS -N test-gfortran_9.1.0_openmpi_g.bat
#PBS -l walltime=1:00:00
#PBS -q regular
#PBS -A p48503002
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /glade/scratch/mpotts/gfortran_9.1.0_openmpi_g_develop

module load python
module load gnu/9.1.0 openmpi/4.0.5 netcdf/4.7.3
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_F90COMPILER=mpif90
export ESMF_DIR=/glade/scratch/mpotts/gfortran_9.1.0_openmpi_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
ssh cheyenne6 /glade/scratch/mpotts/gfortran_9.1.0_openmpi_g_develop/getres-test.sh
ssh cheyenne6 /glade/scratch/mpotts/gfortran_9.1.0_openmpi_g_develop/getres-test.sh
