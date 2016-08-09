FROM geraudster/dockerjupyter
MAINTAINER geraudster

USER root
COPY spark* /cache/
RUN if [ ! -f /cache/spark-1.6.2-bin-hadoop2.6.tgz ]; then \
    mkdir -p /cache && \
    cd /cache && \
    curl -o spark-1.6.2-bin-hadoop2.6.tgz http://apache.crihan.fr/dist/spark/spark-1.6.2/spark-1.6.2-bin-hadoop2.6.tgz; \
    fi; \
    mkdir -p /opt/spark && \
    cd /opt/spark && \
    tar xvzf /cache/spark-*.tgz && \
    rm -f /cache/spark-*.tgz

USER jupyter
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set SPARK env variables
ENV SPARK_HOME /opt/spark/spark-1.6.2-bin-hadoop2.6
ENV HADOOP_CONF_DIR /etc/hadoop/conf
ENV SPARK_CONF_DIR /etc/spark/conf
WORKDIR /data/jupyter/

