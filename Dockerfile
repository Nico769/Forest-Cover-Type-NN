FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

COPY requirements.txt /tmp/

RUN apt-get update -y && \
    apt-get install -y graphviz && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --requirement /tmp/requirements.txt

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token=''"]
