source $INTEL/bin/compilervars.sh intel64
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

./configure --with-pthread=yes --enable-production --enable-cxx \
            --disable-static \
            --with-zlib=$CONDA_PREFIX/zlib-1.2.9 --prefix=$CONDA_PREFIX/hdf5-1.8.19
make
make check
make install
