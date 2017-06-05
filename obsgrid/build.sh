export NETCDF=$CONDA_PREFIX
export NCARG_ROOT=$CONDA_PREFIX

yes 2 | configure
sed -i '/CPP\t\t=/c\CPP\t\t=\t/usr/bin/cpp -P -traditional' configure.oa
sed -i '/NCARG_LIBS\t=/c\NCARG_LIBS\t=\t-L${NCARG_ROOT}/lib -lfreetype -lncarg -lncarg_gks -lncarg_c -lX11 -lm -lcairo' configure.oa

./clean
./compile

cp $SRC_DIR/src/*.exe $CONDA_PREFIX/bin
