# docker build -t tectool .
FROM ubuntu:16.04

RUN apt-get update
RUN apt install -y vim
RUN apt-get update

RUN apt-get install -y git

# install python
RUN apt-get install -y build-essential python3 python3-dev python3-pip

# update pip
RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install wheel

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN cd $HOME && git clone https://github.com/fgypas/.vim.git && cp $HOME/.vim/vimrc /etc/vim/vimrc.local
