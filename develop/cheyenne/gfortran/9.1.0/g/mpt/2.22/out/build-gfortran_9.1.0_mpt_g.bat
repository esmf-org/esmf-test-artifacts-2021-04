#!/bin/sh -l
#PBS -N build-gfortran_9.1.0_mpt_g.bat
#PBS -l walltime=1:00:00
#PBS -l walltime=1:00:00
#PBS -q regular
#PBS -A p48503002
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /glade/scratch/mpotts/gfortran_9.1.0_mpt_g_develop

module load python
module load gnu/9.1.0 mpt/2.22 netcdf/4.7.3
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_F90COMPILER=mpif90
export ESMF_DIR=/glade/scratch/mpotts/gfortran_9.1.0_mpt_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpt
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 36 clean 2>&1| tee clean_$JOBID.log 
make -j 36 2>&1| tee build_$JOBID.log

ssh cheyenne6 /glade/scratch/mpotts/gfortran_9.1.0_mpt_g_develop/getres-build.sh
