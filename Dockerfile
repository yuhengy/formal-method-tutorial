FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y sudo
RUN useradd -s /bin/bash -mU -G sudo vagrant
RUN echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


# STEP basic tools missed in docker ubuntu
RUN apt-get install -y wget git vim


# STEP racket8.3
RUN wget https://download.racket-lang.org/installers/8.3/racket-8.3-x86_64-linux-cs.sh
RUN bash racket-8.3-x86_64-linux-cs.sh --in-place --dest /usr/racket
RUN rm racket-8.3-x86_64-linux-cs.sh
RUN echo "export PATH=/usr/racket/bin:\$PATH" >> /home/vagrant/.bashrc


# STEP rosette
RUN apt-get update
RUN apt-get install -y libssl-dev
RUN git clone https://github.com/emina/rosette.git
RUN cd rosette && git checkout 4.1 && cd ..
RUN /usr/racket/bin/raco pkg install --no-docs --copy --auto -i -t dir rosette
RUN rm -rf rosette


# STEP opam/coq dependencies
RUN apt-get install -y gcc make libgmp-dev
RUN apt-get install -y bubblewrap


# STEP opam
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN add-apt-repository ppa:avsm/ppa
RUN apt-get update
RUN apt-get install -y opam


# STEP verilator
RUN apt-get update
RUN apt-get install -y git perl python3 make autoconf g++ flex bison ccache libgoogle-perftools-dev numactl perl-doc libfl2 libfl-dev zlibc zlib1g zlib1g-dev
RUN git clone https://github.com/verilator/verilator
RUN cd verilator && git pull && git checkout v4.224 && unset VERILATOR_ROOT && autoconf && ./configure && make -j4 && make install &&cd .. && rm -rf verilator


# STEP oss-cad-suite (yosys)
RUN wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2022-09-01/oss-cad-suite-linux-x64-20220901.tgz
RUN tar -zxf oss-cad-suite-linux-x64-20220901.tgz
#RUN mv oss-cad-suite /oss-cad-suite
RUN rm oss-cad-suite-linux-x64-20220901.tgz
RUN echo "export PATH=/oss-cad-suite/bin:$PATH" >> /home/vagrant/.bashrc






USER vagrant
WORKDIR /home/vagrant


# STEP coq
RUN opam init --disable-sandboxing --yes --shell-setup && opam pin add coq 8.15.0 --yes


# STEP frap
RUN cd /home/vagrant && git clone https://github.com/achlipala/frap.git
RUN cd /home/vagrant/frap && git checkout 172716c8ef4a30011399dfc837c3936b28ff1fcc
RUN cd /home/vagrant/frap && eval $(opam env) && make -j4 lib


# STEP vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
# RUN cp /workspace/vimrc /home/vagrant/.vimrc
COPY vimrc /home/vagrant/.vimrc
RUN vim +PluginInstall +qa

