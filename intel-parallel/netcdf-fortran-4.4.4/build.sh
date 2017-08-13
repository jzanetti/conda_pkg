source /opt/intel/bin/compilervars.sh intel64
export CC=icc
export CXX=icpc
export CFLAGS='-O3 -xHost -ip -no-prec-div -static-intel'
export CXXFLAGS='-O3 -xHost -ip -no-prec-div -static-intel'
export F77=ifort
export FC=ifort
export F90=ifort
export FFLAGS='-O3 -xHost -ip -no-prec-div -static-intel'
export CPP='icc -E'
export CXXCPP='icpc -E'

export LD_LIBRARY_PATH=$CONDA_PREFIX/netcdf-4.4.1.1/lib:$LD_LIBRARY_PATH
./configure --prefix=$CONDA_PREFIX/netcdf-fortran-4.4.4
make
make check
make install
