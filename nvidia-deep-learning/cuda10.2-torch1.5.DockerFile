# where to find base container https://ngc.nvidia.com/catalog/containers/nvidia:tensorflow
# where to find docker info https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/rel_20-11.html#rel_20-11
# torch 1.5.0
FROM nvcr.io/nvidia/pytorch:20.03-py3

# specify a volume for vscode-server to avoid redownloding vscode when connect to docker by vscode
VOLUME /root/.vscode-server 
# specify a volume for .jupyter for config
VOLUME /root/.jupyter
EXPOSE 22
# ports:
# 50871 for ssh
# 50872 for jupyter
# 22 for ssh

# setup my vim
# download from https://codeload.github.com/amix/vimrc/zip/refs/heads/master
COPY ./docker-files/vimrc-master /root/.vim_runtime
RUN sh /root/.vim_runtime/install_awesome_vimrc.sh

# for gfw

# sshd security
RUN apt update 
COPY ./docker-files/apt-basic.sh /root/apt-basic.sh
RUN /root/apt-basic.sh

COPY ./docker-files/pip-basic.sh /root/pip-basic.sh 
RUN /root/pip-basic.sh 

COPY ./docker-files/pip-torch.sh /root/pip-torch.sh 
RUN /root/pip-torch.sh 

COPY ./docker-files/pip-common.sh /root/pip-common.sh 
RUN /root/pip-common.sh 

# setup my vim for jupyter
# download from https://github.com/lambdalisue/jupyter-vim-binding
RUN mkdir -p $(jupyter --data-dir)/nbextensions
COPY ./docker-files/jupyter-vim-binding-master /root/.local/share/jupyter/nbextensions/vim_binding

# u can copy ~/.jupyter:/root/.jupyter
# but firt install pip install jupyter-tensorboard in host
# https://github.com/lspvic/jupyter_tensorboard
# jupyter config for root
COPY ./docker-files/.jupyter /root/.jupyter

COPY ./docker-files/jupyter-nbextension-enable.sh /root/jupyter-nbextension-enable.sh 
RUN bash /root/jupyter-nbextension-enable.sh 

COPY ./docker-files/cat.bashrc /root/cat.bashrc
RUN echo "export XS_DOCKER_HOST_NAME=torch1.5-cuda10" >> /root/.bashrc
RUN cat /root/cat.bashrc >> /root/.bashrc

COPY ./docker-files/last-common.sh /root/last-common.sh 

# add my labtop ssh pub key
RUN mkdir /root/.ssh
COPY ./docker-files/authorized_keys /root/.ssh

COPY ./docker-files/test-ssh.sh /root/test-ssh.sh 
# RUN bash /root/test-ssh.sh # or excute by docker exec

COPY ./docker-files/test-script /root/

CMD service ssh start && jupyter notebook
