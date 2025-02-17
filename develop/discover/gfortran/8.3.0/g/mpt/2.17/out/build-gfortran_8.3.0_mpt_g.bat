#!/bin/sh -l
#SBATCH --account=s2326
#SBATCH -o build-gfortran_8.3.0_mpt_g.bat_%j.o
#SBATCH -e build-gfortran_8.3.0_mpt_g.bat_%j.e
#SBATCH --time=1:20:00
#SBATCH --partition=compute
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
module load comp/gcc/8.3.0 mpi/sgi-mpt/2.17 

module list >& module-build.log

set -x

export ESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/gfortran_8.3.0_mpt_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpt
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 28 clean 2>&1| tee clean_$JOBID.log 
make -j 28 2>&1| tee build_$JOBID.log

