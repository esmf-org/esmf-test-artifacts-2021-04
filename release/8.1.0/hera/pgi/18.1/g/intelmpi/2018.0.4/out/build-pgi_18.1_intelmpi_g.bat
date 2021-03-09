#!/bin/bash -l
#SBATCH --account=da-cpu
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --time=2:00:00
#SBATCH --exclusive
#SBATCH --output build-pgi_18.1_intelmpi_g.bat_%j.o
export JOBID=$SLURM_JOBID
set -x
module load pgi/18.10 impi/2018.0.4 
module list >& module-build.log
module list >& module-build.log

export -n ESMF_NETCDF

export ESMF_DIR=/scratch1/NCEPDEV/da/Mark.Potts/sandbox/pgi_18.1_intelmpi_g
export ESMF_COMPILER=pgi
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 40 clean 2>&1|tee clean_$JOBID.log 
make -j 40 2>&1|tee build_$JOBID.log

