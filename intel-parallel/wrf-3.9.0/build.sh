export INSTALL_DIR=$CONDA_PREFIX/wrf-3.9.0

export WRFIO_NCD_LARGE_FILE_SUPPORT=1

export NETCDF=$CONDA_PREFIX/netcdf-fortran-4.4.4
export NETCDF_C=$CONDA_PREFIX/netcdf-4.4.1.1
export LD_LIBRARY_PATH=$NETCDF_C/lib:$LD_LIBRARY_PATH

export JASPERLIB=$CONDA_PREFIX/jasper-2.0.12/lib
export JASPERINC=$CONDA_PREFIX/jasper-2.0.12/include

export INTEL=/opt/intel
source $INTEL/bin/compilervars.sh intel64
source $INTEL/compilers_and_libraries_2017.4.196/linux/mpi/intel64/bin/mpivars.sh

./configure [options] <<-END
16
1
END

sed -i '/DM_FC       /c\DM_FC\t\t=\tmpiifort' configure.wrf
sed -i '/DM_CC       /c\DM_CC\t\t=\tmpiicc' configure.wrf

echo '***********************************************'
echo 'conda working directory:' $PWD
echo '***********************************************'

./compile em_real

# copy the entire WRF directory
cp -rf $PWD $INSTALL_DIR
