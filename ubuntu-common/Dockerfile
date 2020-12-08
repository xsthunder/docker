FROM ubuntu:20.04
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN  apt-get clean
RUN apt-get update
RUN apt-get install vim wget python3 -y 
RUN apt install python-is-python3 -y
RUN apt install python3-pip -y
RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN apt install vim wget jq
