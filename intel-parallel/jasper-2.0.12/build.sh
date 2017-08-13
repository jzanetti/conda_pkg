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

export SOURCE_DIR=$PWD
export BUILD_DIR=$PWD/build
export INSTALL_DIR=$CONDA_PREFIX/jasper-2.0.12
cmake -G "Unix Makefiles" -H$SOURCE_DIR -B$BUILD_DIR -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR
cd $BUILD_DIR
make
make install
