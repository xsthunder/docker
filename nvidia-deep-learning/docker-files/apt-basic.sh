# setup ssh
# https://dev.to/s1ntaxe770r/how-to-setup-ssh-within-a-docker-container-i5i
set -e
set -x
sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
apt-get clean && apt-get update
apt install openssh-server sudo -y
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
service ssh start
apt install tree screen graphviz -y

