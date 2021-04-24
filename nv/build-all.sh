set -e
docker build tf1 -t nv-tf1
docker build tf2 -t nv-tf2
docker build torch1.8 -t nv-torch
