# where to find base container https://ngc.nvidia.com/catalog/containers/nvidia:tensorflow
# where to find docker info https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/rel_20-11.html#rel_20-11
# tf 1.15.2
FROM nvcr.io/nvidia/tensorflow:20.03-tf1-py3

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
COPY ./vimrc-master /root/.vim_runtime
RUN sh /root/.vim_runtime/install_awesome_vimrc.sh

# for gfw

# sshd security
RUN apt update 
COPY ./apt-basic.sh /root/apt-basic.sh
RUN /root/apt-basic.sh

COPY ./pip-basic.sh /root/pip-basic.sh 
RUN /root/pip-basic.sh 

COPY ./pip-tf.sh /root/pip-tf.sh 
RUN /root/pip-tf.sh 

COPY ./pip-common.sh /root/pip-common.sh 
RUN /root/pip-common.sh 

# setup my vim for jupyter
# download from https://github.com/lambdalisue/jupyter-vim-binding
RUN mkdir -p $(jupyter --data-dir)/nbextensions
COPY ./jupyter-vim-binding-master /root/.local/share/jupyter/nbextensions/vim_binding

# u can copy ~/.jupyter:/root/.jupyter
# but firt install pip install jupyter-tensorboard in host
# https://github.com/lspvic/jupyter_tensorboard
# jupyter config for root
COPY ./.jupyter /root/.jupyter

COPY ./jupyter-nbextension-enable.sh /root/jupyter-nbextension-enable.sh 
RUN bash /root/jupyter-nbextension-enable.sh 

COPY ./cat.bashrc /root/cat.bashrc
RUN echo "export XS_DOCKER_HOST_NAME=tf1.5-cuda10" >> /root/.bashrc
RUN cat /root/cat.bashrc >> /root/.bashrc


# add my labtop ssh pub key
RUN mkdir /root/.ssh
COPY ./authorized_keys /root/.ssh

COPY ./test-ssh.sh /root/test-ssh.sh 
# RUN bash /root/test-ssh.sh # or excute by docker exec

COPY ./test-script /root/

CMD service ssh start && jupyter notebook
