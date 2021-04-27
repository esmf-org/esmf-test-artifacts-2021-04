#!/bin/sh -l
#SBATCH --account=da-cpu
#SBATCH -o test-intel_18.0.4_intelmpi_g.bat_%j.o
#SBATCH -e test-intel_18.0.4_intelmpi_g.bat_%j.e
#SBATCH --time=1:30:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID
export ESMF_MPIRUN=mpirun.srun
module load intel/18.0.5.274 impi/2018.4.274 netcdf/4.7.0
module list >& module-test.log

set -x
export ESMF_NETCDF=nc-config

export ESMF_DIR=/scratch1/NCEPDEV/stmp2/Mark.Potts/intel_18.0.4_intelmpi_g_develop
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
make info 2>&1| tee info.log 
make install 2>&1| tee install_$JOBID.log 
make all_tests 2>&1| tee test_$JOBID.log 
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
chmod +x runpython.sh
cd nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc_$JOBID.log 


cd ../src/addon/ESMPy

export PATH=$PATH:$HOME/.local/bin
python3 setup.py build 2>&1 | tee python_build.log
ssh hfe02 /scratch1/NCEPDEV/stmp2/Mark.Potts/intel_18.0.4_intelmpi_g_develop/runpython.sh 2>&1 | tee python_build.log
python3 setup.py test 2>&1 | tee python_test.log
python3 setup.py test_examples 2>&1 | tee python_examples.log
python3 setup.py test_regrid_from_file 2>&1 | tee python_regrid.log
