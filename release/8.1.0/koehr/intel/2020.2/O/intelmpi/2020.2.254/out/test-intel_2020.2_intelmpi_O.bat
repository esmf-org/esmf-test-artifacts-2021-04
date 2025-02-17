#!/bin/bash -l
#PBS -N test-intel_2020.2_intelmpi_O.bat
#PBS -j oe
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=48:mpiprocs=48
#PBS -l walltime=1:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work1/mpotts/intel_2020.2_intelmpi_O

module unload compiler/intel mpt
module load compiler/intel/2020.2.254 compiler/intelmpi/2020.2.254 netcdf-c/intel/4.3.3.1
module load netcdf-c/intel/4.4.2 
module list
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF_LIBPATH="/app/COST/netcdf-fortran/4.4.2/intel/lib /app/COST/netcdf-c/4.3.3.1/intel//lib /app/COST/hdf5/1.8.15/intel//lib"
export ESMF_NETCDFF_LIBS="-lnetcdff -lnetcdf -lhdf5 -lhdf5_hl -lz"
export ESMF_NETCDF_LIBPATH=/app/COST/netcdf-c/4.3.3.1/intel//lib
export ESMF_NETCDF_INCLUDE=/app/COST/netcdf-c/4.3.3.1/intel/include
export ESMF_NETCDFF_INCLUDE="/app/COST/netcdf-fortran/4.4.2/intel/include /app/COST/netcdf-c/4.3.3.1/intel//include /app/COST/hdf5/1.8.15/intel//include"
export ESMF_NETCDFF_LIBPATH="/app/COST/netcdf-fortran/4.4.2/intel/lib /app/COST/netcdf-c/4.3.3.1/intel//lib /app/COST/hdf5/1.8.15/intel//lib"
export ESMF_DIR=/p/work1/mpotts/intel_2020.2_intelmpi_O
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make install 2>&1|tee install_$JOBID.log 
make all_tests 2>&1|tee test_$JOBID.log 

export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd nuopc-app-prototypes
./testProtos.sh 2>&1|tee ../nuopc_$JOBID.log 

ssh koehr06 /p/work1/mpotts/intel_2020.2_intelmpi_O/getres-test.sh

