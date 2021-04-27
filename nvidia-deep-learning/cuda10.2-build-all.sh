set -e
set -x
if nvidia-smi | grep -i "cuda version: 10.2"
then
    echo "pass cuda version check"
else
    echo "bad cuda version"
    exit 1
fi
# c.NotebookApp.ip ='0.0.0.0'
docker build . -f cuda10.2-tf1.5.DockerFile -t nv-tf1
docker build . -f cuda10.2-tf2.1.DockerFile -t nv-tf2
docker build . -f cuda10.2-torch1.5.DockerFile -t nv-torch
