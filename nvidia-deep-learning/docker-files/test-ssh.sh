# password for user
set -x
set -e
useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
echo 'test:test' | chpasswd
# use password
sed -i "s/PasswordAuthentication no/#PasswordAuthentication yes/" /etc/ssh/sshd_config