pacman -Sy
pacman -S base-devel git mingw-w64-x86_64-toolchain make mingw-w64-x86_64-cmake autoconf-archive mingw-w64-x86_64-protobuf mingw-w64-x86_64-gtest mingw-w64-x86_64-gflags mingw-w64-x86_64-zeromq mingw-w64-x86_64-openssl mingw-w64-x86_64-glog mingw-w64-x86_64-lmdb mingw-w64-x86_64-lmdbxx mingw-w64-x86_64-sqlite3 mingw-w64-x86_64-libmicrohttpd wget
git clone https://github.com/RyuMaster/argtable2.git
cd argtable2
cmake . -G"MSYS Makefiles" -DCMAKE_INSTALL_PREFIX=$MINGW_PREFIX
make -j2
make install
cp ./src/argtable2.h /home/../mingw64/include/argtable2.h
cd ..
git clone https://github.com/domob1812/libjson-rpc-cpp
cd libjson-rpc-cpp
git checkout listen-locally-0.7.0
mkdir win32-deps
mkdir win32-deps/include
cmake . -G"MSYS Makefiles" -DCMAKE_INSTALL_PREFIX=$MINGW_PREFIX -DREDIS_SERVER=NO -DREDIS_CLIENT=NO  -DCOMPILE_STUBGEN=YES -DCOMPILE_EXAMPLES=NO -DCOMPILE_TESTS=NO -DBUILD_STATIC_LIBS=YES -DHUNTER_ENABLED=YES -DCMAKE_CXX_FLAGS="-fpermissive"
make -j2
make install
cd dist
cp -r ./ /home/../mingw64/
cd ~/
curl -o /home/../mingw64/lib/pkgconfig/libglog.pc https://raw.githubusercontent.com/xaya/XAYA_tutorial_code/master/libxayagame/Compile-scripts/libglog.pc
curl -o /home/../mingw64/lib/pkgconfig/lmdb.pc https://raw.githubusercontent.com/xaya/XAYA_tutorial_code/master/libxayagame/Compile-scripts/lmdb.pc
git clone https://github.com/xaya/libxayagame.git
cd libxayagame
curl -o configure_patch.diff https://raw.githubusercontent.com/xaya/XAYA_tutorial_code/master/libxayagame/Compile-scripts/configure_patch.diff
patch --merge configure.ac configure_patch.diff
./autogen.sh
./configure
make -j2
make install
