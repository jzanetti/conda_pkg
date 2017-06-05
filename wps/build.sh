export NETCDF=$CONDA_PREFIX
export JASPERLIB=$CONDA_PREFIX/lib
export JASPERINC=$CONDA_PREFIX/include

# gfortran/gcc serial
./configure <<< $'1\n'
sed -i "/WRF_DIR\s\t\t=/c\WRF_DIR\t\t=\t\t$CONDA_PREFIX/\wrf" configure.wps

./compile >& log

mkdir -p $CONDA_PREFIX/wps/bin
cp -rf $SRC_DIR/geogrid/src/geogrid.exe $CONDA_PREFIX/wps/bin/geogrid.exe
cp -rf $SRC_DIR/metgrid/src/metgrid.exe $CONDA_PREFIX/wps/bin/metgrid.exe
cp -rf $SRC_DIR/ungrib/src/ungrib.exe $CONDA_PREFIX/wps/bin/ungrib.exe
