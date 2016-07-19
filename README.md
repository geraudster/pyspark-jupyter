Docker image for Python, Jupyter and Spark.

## Get image

    $ docker pull geraudster/pyspark-jupyter

## Configuration & Run

See [dockerjupyter image](https://hub.docker.com/r/geraudster/dockerjupyter/)

Run with:

    export SPARK_LOCAL_IP=$(ifconfig tap0 | grep 'inet addr' | tr ':' ' ' | tr -s ' ' | cut -f4 -d' ')
    docker run -d -v $HOME/.jupyter/secret:/home/jupyter/secret \
              -v $HOME/jupyter:/data/jupyter \
              -v $HOME/conf:/opt/spark/conf \
              -e HADOOP_USER_NAME=$USER \
              -e SPARK_LOCAL_IP \
              --net=host \
              -p 8888:8888 geraudster/pyspark-jupyter

Then open https://localhost:8888

