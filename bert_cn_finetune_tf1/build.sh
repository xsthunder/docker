docker build . -f Dockerfile -t bert_cn_finetune:tf1-2.1-0.0 --build-arg HTTP_PROXY=http://172.20.137.69:8001 --build-arg HTTPS_PROXY=http://172.20.137.69:8001
