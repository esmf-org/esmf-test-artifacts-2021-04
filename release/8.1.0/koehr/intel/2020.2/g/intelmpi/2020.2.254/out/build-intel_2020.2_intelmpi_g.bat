#!/bin/bash -l
#PBS -N build-intel_2020.2_intelmpi_g.bat
#PBS -j oe
#PBS -q standard
#PBS -A NRLMR03795024
#PBS -l select=1:ncpus=48:mpiprocs=48
#PBS -l walltime=1:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /p/work1/mpotts/intel_2020.2_intelmpi_g

module unload compiler/intel mpt
module load compiler/intel/2020.2.254 compiler/intelmpi/2020.2.254 netcdf-c/intel/4.3.3.1
module load netcdf-c/intel/4.4.2 
module list
module list >& module-build.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_NETCDF_LIBPATH="/app/COST/netcdf-fortran/4.4.2/intel/lib /app/COST/netcdf-c/4.3.3.1/intel//lib /app/COST/hdf5/1.8.15/intel//lib"
export ESMF_NETCDFF_LIBS="-lnetcdff -lnetcdf -lhdf5 -lhdf5_hl -lz"
export ESMF_NETCDF_LIBPATH=/app/COST/netcdf-c/4.3.3.1/intel//lib
export ESMF_NETCDF_INCLUDE=/app/COST/netcdf-c/4.3.3.1/intel/include
export ESMF_NETCDFF_INCLUDE="/app/COST/netcdf-fortran/4.4.2/intel/include /app/COST/netcdf-c/4.3.3.1/intel//include /app/COST/hdf5/1.8.15/intel//include"
export ESMF_NETCDFF_LIBPATH="/app/COST/netcdf-fortran/4.4.2/intel/lib /app/COST/netcdf-c/4.3.3.1/intel//lib /app/COST/hdf5/1.8.15/intel//lib"
export ESMF_DIR=/p/work1/mpotts/intel_2020.2_intelmpi_g
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make -j 48 clean 2>&1|tee clean_$JOBID.log 
make -j 48 2>&1|tee build_$JOBID.log

ssh koehr01 /p/work1/mpotts/intel_2020.2_intelmpi_g/getres-build.sh

