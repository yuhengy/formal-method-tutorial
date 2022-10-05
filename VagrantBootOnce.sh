#!/usr/bin/env bash


# STEP racket8.3
wget https://download.racket-lang.org/installers/8.3/racket-8.3-x86_64-linux-cs.sh
bash racket-8.3-x86_64-linux-cs.sh --in-place --dest /usr/racket
rm racket-8.3-x86_64-linux-cs.sh
echo "export PATH=/usr/racket/bin:\$PATH" >> /home/vagrant/.bashrc


# STEP rosette
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y libssl-dev
git clone https://github.com/emina/rosette.git
cd rosette && git checkout 4.1 && cd ..
/usr/racket/bin/raco pkg install --no-docs --copy --auto -i -t dir rosette
rm -rf rosette


# STEP opam
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y gcc make libgmp-dev
add-apt-repository ppa:avsm/ppa
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y opam


# STEP verilator
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y git perl python3 make autoconf g++ flex bison ccache libgoogle-perftools-dev numactl perl-doc libfl2 libfl-dev zlibc zlib1g zlib1g-dev
git clone https://github.com/verilator/verilator
cd verilator && git pull && git checkout v4.224
unset VERILATOR_ROOT && autoconf && ./configure && make -j4 && make install
cd .. && rm -rf verilator


# STEP oss-cad-suite (yosys)
wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2022-09-01/oss-cad-suite-linux-x64-20220901.tgz
tar -zxf oss-cad-suite-linux-x64-20220901.tgz
mv oss-cad-suite /oss-cad-suite
rm oss-cad-suite-linux-x64-20220901.tgz
echo "export PATH=/oss-cad-suite/bin:$PATH" >> /home/vagrant/.bashrc

