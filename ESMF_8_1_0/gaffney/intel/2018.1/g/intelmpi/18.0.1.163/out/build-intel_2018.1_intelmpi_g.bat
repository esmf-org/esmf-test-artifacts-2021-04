#!/bin/bash -l
#PBS -N build-intel_2018.1_intelmpi_g.bat
#PBS -j oe
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=48:mpiprocs=48
#PBS -l walltime=1:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work1/mpotts/intel_2018.1_intelmpi_g

module load cseinit-intel
module load compiler/intel/18.0.1.163 compiler/intelmpi/18.0.1.163 cse/netcdf/latest
module load cse/netcdf_fortran/latest 
module list
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_F90COMPILEOPTS=-I$CSE_NETCDF_FORTRAN_INCLUDE_DIR
export ESMF_DIR=/p/work1/mpotts/intel_2018.1_intelmpi_g
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 48 clean 2>&1|tee clean_$JOBID.log 
make -j 48 2>&1|tee build_$JOBID.log

ssh gaffney06 /p/work1/mpotts/intel_2018.1_intelmpi_g/getres-build.sh

