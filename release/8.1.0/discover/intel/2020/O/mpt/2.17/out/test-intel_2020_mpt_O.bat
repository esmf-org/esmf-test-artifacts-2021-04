#!/bin/bash -l
#SBATCH --account=s2326
#SBATCH --partition=compute
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH --time=1:00:00
#SBATCH --exclusive
#SBATCH --output test-intel_2020_mpt_O.bat_%j.o
export JOBID=$SLURM_JOBID
set -x
export ESMF_F90COMPILER=ifort
export ESMF_CXXCOMPILER=icpc
export MPICXX_CXX=icpc
module load comp/intel/19.1.3.304 mpi/sgi-mpt/2.17 netcdf4/4.7.4
module load hdf5/1.13.0 
module list
module list >& module-test.log

export ESMF_NETCDF=nc-config

export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf -lhdf5_hl -lhdf5"
export ESMF_DIR=/gpfsm/dnb04/projects/p98/mpotts/esmf/intel_2020_mpt_O
export ESMF_COMPILER=intel
export ESMF_COMM=mpt
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make install 2>&1|tee install_$JOBID.log 
make all_tests 2>&1|tee test_$JOBID.log 

