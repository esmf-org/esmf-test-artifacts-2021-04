#!/bin/bash -l
#PBS -N test-gfortran_10.2.0_mpich3_g.bat
#PBS -j oe
#PBS -q workq
#PBS -A emc
#PBS -l select=1:ncpus=128:mpiprocs=128
#PBS -l walltime=1:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /lfs/h1/emc/ptmp/Mark.Potts/gfortran_10.2.0_mpich3_g

module unload PrgEnv-cray PrgEnv-intel

module load PrgEnv-gnu
module load gcc/10.2.0 cray-mpich/8.1.4 cray-netcdf/4.7.4.3
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_OS=Linux
export ESMF_CXXCOMPILER=CC
export ESMF_F90COMPILER=ftn
export ESMF_CXXLINKER=CC
export ESMF_F90LINKER=ftn
export ESMF_MPIRUN=mpirun.unicos
export ESMF_F90COMPILEOPTS="-fallow-argument-mismatch -fallow-invalid-boz"
sed -i 's/aprun/mpiexec/' scripts/mpirun.unicos
export ESMF_DIR=/lfs/h1/emc/ptmp/Mark.Potts/gfortran_10.2.0_mpich3_g
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich3
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 

export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 

ssh alogin01 /lfs/h1/emc/ptmp/Mark.Potts/gfortran_10.2.0_mpich3_g/getres-test.sh

