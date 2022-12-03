# where to find base container https://ngc.nvidia.com/catalog/containers/nvidia:tensorflow
# where to find docker info https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/rel_20-11.html#rel_20-11
# torch 1.5.0
FROM allennlp/models:v2.1.0-cuda11.0

# specify a volume for vscode-server to avoid redownloding vscode when connect to docker by vscode
VOLUME /root/.vscode-server 
# specify a volume for .jupyter for config
VOLUME /root/.jupyter
EXPOSE 22
# ports:
# 50871 for ssh
# 50872 for jupyter
# 22 for ssh

# for gfw

# sshd security
RUN apt update 
COPY ./docker-files/apt-basic.sh /root/apt-basic.sh
RUN /root/apt-basic.sh

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

CMD service ssh start
