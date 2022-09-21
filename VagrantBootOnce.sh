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

