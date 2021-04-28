#!/bin/bash -l
export JOBID=12345

module use /project/esmf/modulefiles
module load compiler/nag/6.2 mpi/nag/mvapich2-2.3rc2 tool/netcdf/4.6.1/nag
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/scratch/mpotts/nag_6.2_mvapich2_O_develop
export ESMF_COMPILER=nag
export ESMF_COMM=mvapich2
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 8 clean 2>&1| tee clean_$JOBID.log 
make -j 8 2>&1| tee build_$JOBID.log

