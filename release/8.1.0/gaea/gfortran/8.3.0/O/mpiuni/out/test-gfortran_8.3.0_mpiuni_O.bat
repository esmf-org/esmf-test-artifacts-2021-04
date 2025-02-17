#!/bin/bash -l
#SBATCH --account=nggps_emc
#SBATCH --cluster=c4
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --time=2:00:00
#SBATCH --exclusive
#SBATCH --output test-gfortran_8.3.0_mpiuni_O.bat_%j.o
export JOBID=$SLURM_JOBID

module unload PrgEnv-intel

module load PrgEnv-gnu
export ESMF_MPIRUN=/lustre/f2/dev/ncep/Mark.Potts/gfortran_8.3.0_mpiuni_O/src/Infrastructure/stubs/mpiuni/mpirun
module load gcc/8.3.0  cray-netcdf/4.6.3.2
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/lustre/f2/dev/ncep/Mark.Potts/gfortran_8.3.0_mpiuni_O
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make install 2>&1|tee install_$JOBID.log 
make all_tests 2>&1|tee test_$JOBID.log 

export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd nuopc-app-prototypes
./testProtos.sh 2>&1|tee ../nuopc_$JOBID.log 

