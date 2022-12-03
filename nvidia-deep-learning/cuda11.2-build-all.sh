set -e
set -x
if nvidia-smi | grep -i "cuda version: 11"
then
    echo "pass cuda version check"
else
    echo "bad cuda version"
    exit 1
fi
# c.NotebookApp.ip ='0.0.0.0'
# updates for 2.1 add more-itertools typeguard, update authkeys, jupyter passwd
version=2.1
docker build . -f cuda11.2-tf1.5.DockerFile -t nv-tf1:$version
docker build . -f cuda11.2-tf2.4.DockerFile -t nv-tf2:$version
docker build . -f cuda11.2-torch1.7.DockerFile -t nv-torch:$version

# CHANGELOG

# version=2.0
# update bert4keras to 0.10.8, add gpustat
# remove deps for /home/zengjianjun/jupyter, use /data/zengjianjun instead

