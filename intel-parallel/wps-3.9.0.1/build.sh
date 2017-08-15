export INSTALL_DIR=$CONDA_PREFIX/wps-3.9.0.1

export NETCDF=$CONDA_PREFIX/netcdf-fortran-4.4.4
export NETCDF_C=$CONDA_PREFIX/netcdf-4.4.1.1
export LD_LIBRARY_PATH=$NETCDF_C/lib:$LD_LIBRARY_PATH

export JASPERLIB=$CONDA_PREFIX/jasper-2.0.12/lib
export JASPERINC=$CONDA_PREFIX/jasper-2.0.12/include

export JASPERLIB="$JASPERLIB -L$CONDA_PREFIX/libpng-1.6.27/lib -L$CONDA_PREFIX/zlib-1.2.9/lib"
export JASPERINC="$JASPERINC -I$CONDA_PREFIX/libpng-1.6.27/include -I$CONDA_PREFIX/zlib-1.2.9/include"

source $INTEL/bin/compilervars.sh intel64
source $INTEL/compilers_and_libraries_2017.4.196/linux/mpi/intel64/bin/mpivars.sh
export LD_LIBRARY_PATH=$INTEL/compilers_and_libraries_2017/linux/lib/intel64:$LD_LIBRARY_PATH

./configure [options] <<-END
19
END

sed -i '/WRF_DIR\t\t\t/c\WRF_DIR\t\t\t=\t\/$(CONDA_PREFIX)/wrf-3.9.0' configure.wps
sed -i '/                        -L$(NETCDF)\/lib -lnetcdff -lnetcdf/c\                        -L$(NETCDF)\/lib -lnetcdff -lnetcdf -liomp5' configure.wps

# need to change the codes to get rid some version mismatch error: http://forum.wrfforum.com/viewtopic.php?f=5&t=10248
sed -i '/    image.inmem_=1;/c\\/\/    image.inmem_=1;' $CONDA_PREFIX/../work/WPS/ungrib/src/ngl/g2/enc_jpeg2000.c

echo '***********************************************'
echo 'conda working directory:' $PWD
echo '***********************************************'

./compile

# copy the entire WPS directory
cp -rf $PWD $INSTALL_DIR
