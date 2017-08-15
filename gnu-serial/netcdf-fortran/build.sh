echo $CONDA_PREFIX
./configure --prefix=$CONDA_PREFIX
make
make check
make install
