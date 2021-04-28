#!/bin/bash -l
export JOBID=12345

module use /project/esmf/modulefiles
module load compiler/gnu/8.1.0 openmpi/3.1.1-gnu8.1.0 tool/netcdf/4.6.1/gcc-8.1.0
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/scratch/mpotts/gfortran_8.1.0_openmpi_O_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 8 clean 2>&1| tee clean_$JOBID.log 
make -j 8 2>&1| tee build_$JOBID.log

