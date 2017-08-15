source $INTEL/bin/compilervars.sh intel64
source $INTEL/compilers_and_libraries_2017.4.196/linux/mpi/intel64/bin/mpivars.sh

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

export CPPFLAGS=-I$CONDA_PREFIX/netcdf-4.4.1.1/include
export LDFLAGS=-L$CONDA_PREFIX/netcdf-4.4.1.1/lib

source $INTEL/bin/ifortvars.sh intel64

./configure --prefix=$CONDA_PREFIX/netcdf-fortran-4.4.4
make
make install
