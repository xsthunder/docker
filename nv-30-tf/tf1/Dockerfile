# description
# based on ubuntu 18.04.2
# use for 91 machine with rtx 3090
# where to find base container https://ngc.nvidia.com/catalog/containers/nvidia:tensorflow
# where to find docker info https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/rel_20-11.html#rel_20-11
# provide py3, tf1.5
# cuda CUDA 11.1.0 for rtx 3090

# usage
# specify a volume for vscode-server to avoid redownloding vscode when connect to docker by vscode
VOLUME /root/.vscode-server 
# specify a volume for .jupyter for config
VOLUME /root/.jupyter
# 50871 for ssh
# 50872 for jupyter
# ro means read only
# alias docker-start-tf1="docker run -v /etc/localtime:/etc/localtime:ro -v tf1-vscode-server:/root/.vscode-server --gpus all --restart=always --name tf1 -d -p 50871:22 -p 50871:8888 -v ~:/workspace nv-tf1"
# alias docker-login-tf1="docker exec -it tf1 bash"

FROM nvcr.io/nvidia/tensorflow:20.11-tf1-py3

# setup my vim
# download from https://codeload.github.com/amix/vimrc/zip/refs/heads/master
COPY ./vimrc-master /root/.vim_runtime
RUN sh /root/.vim_runtime/install_awesome_vimrc.sh

# for gfw
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN apt-get clean
RUN apt-get update
RUN apt install tree screen -y

# setup ssh
# https://dev.to/s1ntaxe770r/how-to-setup-ssh-within-a-docker-container-i5i
RUN apt update && apt install openssh-server sudo -y
RUN service ssh start
EXPOSE 22


RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN yes | pip install tqdm scikit-learn nltk rouge tqdm numpy bert4keras==0.9.9

# sshd security
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# add my labtop ssh pub key
RUN mkdir /root/.ssh
COPY ./authorized_keys /root/.ssh

# uncomment those for testing sshd
# password for user
# RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
# RUN  echo 'test:test' | chpasswd
# use password
# sed -i "s/PasswordAuthentication no/#PasswordAuthentication yes/" /etc/ssh/sshd_config


# but firt install pip install jupyter-tensorboard in host
# for corresspoinding to host env install nbextension 
RUN yes | pip install jupyter_contrib_nbextensions;
RUN jupyter contrib nbextension install --user;

# setup my vim for jupyter
# download from https://github.com/lambdalisue/jupyter-vim-binding
RUN mkdir -p $(jupyter --data-dir)/nbextensions
COPY ./jupyter-vim-binding-master /root/.local/share/jupyter/nbextensions/vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

RUN sh /root/.vim_runtime/install_awesome_vimrc.sh

# u can copy ~/.jupyter:/root/.jupyter
# but firt install pip install jupyter-tensorboard in host
# https://github.com/lspvic/jupyter_tensorboard
COPY ./.jupyter /root/.jupyter

# for iprogress
# https://ipywidgets.readthedocs.io/en/stable/user_install.html
RUN yes | pip install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension

COPY ./cat.bashrc /root/cat.bashrc
RUN cat /root/cat.bashrc >> /root/.bashrc

# NOTE 需要使用默认启动，而不是bash，否则sshd, jupyter服务没有挂载
CMD service ssh start && jupyter notebook
