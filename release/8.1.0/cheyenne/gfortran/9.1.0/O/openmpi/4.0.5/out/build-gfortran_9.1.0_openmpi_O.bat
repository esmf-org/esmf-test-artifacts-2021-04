#!/bin/bash -l
#PBS -N build-gfortran_9.1.0_openmpi_O.bat
#PBS -j oe
#PBS -q regular
#PBS -A p48503002
#PBS -l select=1:ncpus=36:mpiprocs=36
#PBS -l walltime=1:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /glade/scratch/mpotts/gfortran_9.1.0_openmpi_O
set -x
module load gnu/9.1.0 openmpi/4.0.5 netcdf/4.7.3
module list >& module-build.log

export ESMF_NETCDF=nc-config

export ESMF_F90COMPILER=mpif90
export ESMF_DIR=/glade/scratch/mpotts/gfortran_9.1.0_openmpi_O
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 36 clean 2>&1|tee clean_$JOBID.log 
make -j 36 2>&1|tee build_$JOBID.log

