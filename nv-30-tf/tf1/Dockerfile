# based on ubuntu 18.04.2
# use for 91 machine with rtx 3090
# where to find base container https://ngc.nvidia.com/catalog/containers/nvidia:tensorflow
# where to find docker info https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/rel_20-11.html#rel_20-11
# provide py3, tf1.5
# cuda CUDA 11.1.0 for rtx 3090

FROM nvcr.io/nvidia/tensorflow:20.11-tf1-py3

# setup my vim
COPY ./vimrc-master /root/.vim_runtime
RUN sh /root/.vim_runtime/install_awesome_vimrc.sh

# for gfw
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN  apt-get clean
RUN apt-get update
RUN apt install tree -y

# setup ssh
# https://dev.to/s1ntaxe770r/how-to-setup-ssh-within-a-docker-container-i5i
RUN apt update && apt install openssh-server sudo -y
RUN service ssh start
EXPOSE 22


RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN yes | pip install tqdm scikit-learn nltk rouge tqdm numpy bert4keras==0.9.9

# sshd security
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# add my labtop
RUN mkdir /root/.ssh
COPY ./authorized_keys /root/.ssh

# uncomment those for testing sshd
# password for user
# RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
# RUN  echo 'test:test' | chpasswd
# use password
# sed -i "s/PasswordAuthentication no/#PasswordAuthentication yes/" /etc/ssh/sshd_config

# NOTE 需要使用默认启动，而不是bash，否则sshd服务没有挂载
CMD ["/usr/sbin/sshd","-D"]
