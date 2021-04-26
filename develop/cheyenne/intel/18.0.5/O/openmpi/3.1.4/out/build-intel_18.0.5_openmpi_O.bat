#!/bin/sh -l
#PBS -N build-intel_18.0.5_openmpi_O.bat
#PBS -l walltime=1:00:00
#PBS -l walltime=1:00:00
#PBS -q regular
#PBS -A p48503002
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /glade/scratch/mpotts/intel_18.0.5_openmpi_O_develop

module load python
module load intel/18.0.5 openmpi/3.1.4 netcdf/4.6.3
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/glade/scratch/mpotts/intel_18.0.5_openmpi_O_develop
export ESMF_COMPILER=intel
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 36 clean 2>&1| tee clean_$JOBID.log 
make -j 36 2>&1| tee build_$JOBID.log

ssh cheyenne6 /glade/scratch/mpotts/intel_18.0.5_openmpi_O_develop/getres-build.sh
