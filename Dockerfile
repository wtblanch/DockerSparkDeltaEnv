FROM bitnami/spark:3.5.1

USER root
RUN pip install delta-spark==3.2.0 mlflow jupyterlab notebook

EXPOSE 8888 5000
WORKDIR /home/jovyan/work
