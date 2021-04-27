# cuda版本比机器版本高时，报错

如82机器上(cuda 10.2)运行cuda11.2的出现报错:
```
ERROR: This container was built for NVIDIA Driver Release 460.32 or later, but
       version 430.26 was detected and compatibility mode is UNAVAILABLE.
```

需要机器的cuda版本需要比container版本高