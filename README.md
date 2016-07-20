Docker image for Python, Jupyter and Spark.

## Get image

    $ docker pull geraudster/pyspark-jupyter

## Run it

    docker run -d -v $HOME/conf:/opt/spark/conf \
                  -p 4040:4040 \
                  -p 8888:8888 geraudster/pyspark-jupyter

Open http://localhost:8888

## Configuration & Run

See [dockerjupyter image](https://hub.docker.com/r/geraudster/dockerjupyter/)

Run with:

    export SPARK_LOCAL_IP=$(ifconfig tap0 | grep 'inet addr' | tr ':' ' ' | tr -s ' ' | cut -f4 -d' ')
    docker run -d -v $HOME/.jupyter/secret:/home/jupyter/secret \
              -v $HOME/jupyter:/data/jupyter \
              -v $HOME/conf:/opt/spark/conf \
              -e SSL_ENABLED=true \
              -e PASSWORD_ENABLED=true \
              -e HADOOP_USER_NAME=$USER \
              -e SPARK_LOCAL_IP \
              --net=host \
              -p 8888:8888 geraudster/pyspark-jupyter

Then open https://localhost:8888
