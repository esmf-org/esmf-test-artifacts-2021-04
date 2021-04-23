#!/bin/sh -l
#SBATCH --account=da-cpu
#SBATCH -o build-gfortran_9.2.0b_intelmpi_g.bat_%j.o
#SBATCH -e build-gfortran_9.2.0b_intelmpi_g.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
export ESMF_MPIRUN=mpirun.srun
module load gnu/9.2.0 impi/2020 

module list >& module-build.log

set -x

export ESMF_DIR=/scratch1/NCEPDEV/stmp2/Mark.Potts/gfortran_9.2.0b_intelmpi_g_develop
export ESMF_COMPILER=gfortran
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 40 clean 2>&1| tee clean_$JOBID.log 
make -j 40 2>&1| tee build_$JOBID.log

