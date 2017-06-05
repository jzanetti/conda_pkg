export LDFLAGS=-L$CONDA_PREFIX/lib
export CPPFLAGS=-I$CONDA_PREFIX/include
./configure --prefix=$CONDA_PREFIX
make
make install
