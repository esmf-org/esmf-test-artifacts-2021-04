#!/bin/bash -l
#PBS -N test-intel_18.0.5_openmpi_g.bat
#PBS -j oe
#PBS -q regular
#PBS -A p48503002
#PBS -l select=1:ncpus=36:mpiprocs=36
#PBS -l walltime=1:00:00
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

cd /glade/scratch/mpotts/intel_18.0.5_openmpi_g_develop
module load intel/18.0.5 openmpi/3.1.4 netcdf/4.6.3
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/glade/scratch/mpotts/intel_18.0.5_openmpi_g_develop
export ESMF_COMPILER=intel
export ESMF_COMM=openmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 

export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 


cd ../src/addon/ESMPy

export PATH=$PATH:$HOME/.local/bin
python3 setup.py build 2>&1 | tee python_build.log
ssh cheyenne6 "export PATH=$PATH:$HOME/.local/bin;module load python/3.6.8;cd $PWD; python3 setup.py test_examples_dryrun"
ssh cheyenne6 "export PATH=$PATH:$HOME/.local/bin;module load python/3.6.8;cd $PWD; python3 setup.py test_regrid_from_file_dryrun"
ssh cheyenne6 "export PATH=$PATH:$HOME/.local/bin;module load python/3.6.8;cd $PWD; python3 setup.py test_regrid_from_file_dryrun"
python3 setup.py test 2>&1 | tee python_test.log
python3 setup.py test_examples 2>&1 | tee python_examples.log
python3 setup.py test_regrid_from_file 2>&1 | tee python_regrid.log
ssh cheyenne6 /glade/scratch/mpotts/intel_18.0.5_openmpi_g_develop/getres-test.sh

