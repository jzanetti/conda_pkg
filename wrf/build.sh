export NETCDF=$CONDA_PREFIX

# gfortran-serial with basic nesting
./configure <<< $'32\1\n'

./compile em_real >& log

mkdir -p $CONDA_PREFIX/wrf/script
cp -rf $SRC_DIR/test/em_real/namelist.input.4km $CONDA_PREFIX/wrf/script/namelist.input.4km

mkdir -p $CONDA_PREFIX/wrf/run
cp -rf $SRC_DIR/run/* $CONDA_PREFIX/wrf/run

mkdir -p $CONDA_PREFIX/wrf/main
cp -rf $SRC_DIR/main/* $CONDA_PREFIX/wrf/main

mkdir -p $CONDA_PREFIX/wrf/external
cp -rf $SRC_DIR/external/* $CONDA_PREFIX/wrf/external

mkdir -p $CONDA_PREFIX/wrf/inc
cp -rf $SRC_DIR/inc/* $CONDA_PREFIX/wrf/inc

mkdir -p $CONDA_PREFIX/wrf/frame
cp -rf $SRC_DIR/frame/* $CONDA_PREFIX/wrf/frame
