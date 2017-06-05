export NETCDF=$CONDA_PREFIX

./clean -a
./configure wrfda <<< $'32\n'
./compile all_wrfvar >& log

mkdir -p $CONDA_PREFIX/wrfda/var/build
cp -rf $SRC_DIR/var/build/*.exe $CONDA_PREFIX/wrfda/var/build
