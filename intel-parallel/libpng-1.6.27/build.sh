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

export CPPFLAGS=-I$CONDA_PREFIX/zlib-1.2.9/include
export LDFLAGS=-L$CONDA_PREFIX/zlib-1.2.9/lib
./configure --prefix=$CONDA_PREFIX/libpng-1.6.27
make
make check
make install
