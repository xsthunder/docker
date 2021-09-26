
WORKDIR /workspace
RUN echo "cd /workspace" >> /root/.bashrc
RUN conda init bash

CMD service ssh start && jupyter notebook --notebook-dir /workspace
