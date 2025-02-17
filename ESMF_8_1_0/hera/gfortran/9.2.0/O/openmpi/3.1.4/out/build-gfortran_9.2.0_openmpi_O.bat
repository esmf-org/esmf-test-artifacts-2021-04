#!/bin/bash -l
#SBATCH --account=da-cpu
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --time=1:00:00
#SBATCH --exclusive
#SBATCH --output build-gfortran_9.2.0_openmpi_O.bat_%j.o
export JOBID=$SLURM_JOBID
module load gnu/9.2.0 openmpi/3.1.4 netcdf/4.7.2
module load hdf5/1.10.5 
module list
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF=split
export ESMF_NETCDF_INCLUDE=$NETCDF/include
export ESMF_NETCDF_LIBPATH=$NETCDF/lib
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf -lhdf5_hl -lhdf5 $HDF5ExtraLibs"
export ESMF_NETCDF=nc-config
export ESMF_DIR=/scratch1/NCEPDEV/da/Mark.Potts/sandbox/gfortran_9.2.0_openmpi_O
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 40 clean 2>&1|tee clean_$JOBID.log 
make -j 40 2>&1|tee build_$JOBID.log

