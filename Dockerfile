FROM docker.io/tensorflow/tensorflow:2.14.0-gpu-jupyter

LABEL mainteiner="Laszlon Costa"
LABEL description="Development enviroment to sionna with GPU support"

EXPOSE 8888
COPY . /app
WORKDIR /app

RUN apt-get update && \
    apt-get install llvm -y && \
    python3 -m pip install --upgrade pip && \
    pip install --upgrade ipykernel \
    jupyterlab \
    sionna \
    matplotlib \
    pandas \
    numpy

RUN chmod 777 -R /tf

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.allow_origin='*'"]
