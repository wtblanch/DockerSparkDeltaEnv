FROM openjdk:11

# Install Python & pip
RUN apt-get update && apt-get install -y python3 python3-pip curl wget &&     ln -s /usr/bin/python3 /usr/bin/python &&     pip3 install --upgrade pip

# Install Spark 3.5.0 prebuilt for Hadoop 3
RUN curl -L https://dlcdn.apache.org/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3.tgz     | tar -xz -C /usr/local/ &&     mv /usr/local/spark-3.5.0-bin-hadoop3 /usr/local/spark

ENV SPARK_HOME=/usr/local/spark
ENV PATH=$SPARK_HOME/bin:$PATH

# Add Delta JAR (Scala 2.12 build)
RUN curl -L -o $SPARK_HOME/jars/delta-spark_2.12-3.2.0.jar     https://repo1.maven.org/maven2/io/delta/delta-spark_2.12/3.2.0/delta-spark_2.12-3.2.0.jar

# Install Python libs
RUN pip install pyspark==3.5.0 delta-spark==3.2.0 mlflow jupyterlab notebook

# Expose Jupyter & MLflow ports
EXPOSE 8888 5000

WORKDIR /home/jovyan/work
