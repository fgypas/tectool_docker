# docker build -t tectool .
FROM ubuntu:16.04

RUN apt-get update
RUN apt install -y vim
RUN apt install -y wget
# for bedtools
RUN apt install -y zlib1g-dev
RUN apt-get update

RUN apt-get install -y git

# install python
RUN apt-get install -y build-essential python3 python3-dev python3-pip

# update pip
RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install wheel

RUN ln -s /usr/bin/python3 /usr/bin/python

# fix vim
RUN cd $HOME && \
    git clone https://github.com/fgypas/.vim.git && \
    cp $HOME/.vim/vimrc /etc/vim/vimrc.local

# install bedtools
RUN cd $HOME && \
    wget https://github.com/arq5x/bedtools2/archive/v2.26.0.tar.gz && \
    tar xzvf v2.26.0.tar.gz && \
    rm v2.26.0.tar.gz && \
    cd bedtools2-2.26.0 && \
    make && \
    make install

# install tectool
RUN cd $HOME && \
    git clone https://git.scicore.unibas.ch/zavolan_public/TECtool.git && \
    cd TECtool && \
    pip install -r requirements.txt && \
    python setup.py install

# download test data
RUN cd $HOME/TECtool && \
    wget http://tectool.unibas.ch/data/test_data.tar.gz && \
    tar xzvf test_data.tar.gz && \
    rm test_data.tar.gz && \
    cd test_data
