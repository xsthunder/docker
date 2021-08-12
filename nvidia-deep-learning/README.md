# cuda版本比机器版本高时，报错

如82机器上(cuda 10.2)运行cuda11.2的出现报错:
```
ERROR: This container was built for NVIDIA Driver Release 460.32 or later, but
       version 430.26 was detected and compatibility mode is UNAVAILABLE.
```

需要机器的cuda版本需要比container版本高

# ref

## tf

[TensorFlow Release Notes :: NVIDIA Deep Learning Frameworks Documentation](https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/rel_21-04.html#rel_21-04)

RTX3090需要CUDA(cudatoolkit) 11.1 or 11.2，其他

`docker pull nvcr.io/nvidia/tensorflow:20.11-tf1-py3`

## torch

[PyTorch Release Notes :: NVIDIA Deep Learning Frameworks Documentation](https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/rel_21-04.html#rel_21-04)
