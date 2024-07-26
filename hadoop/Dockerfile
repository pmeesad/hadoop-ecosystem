# hadoop/Dockerfile
FROM openjdk:8-jdk

# Set environment variables
ENV HADOOP_VERSION 3.4.0
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Download and extract Hadoop
RUN curl -o /tmp/hadoop-$HADOOP_VERSION.tar.gz https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz \
    && tar -xzvf /tmp/hadoop-$HADOOP_VERSION.tar.gz -C /opt/ \
    && mv /opt/hadoop-$HADOOP_VERSION $HADOOP_HOME \
    && rm /tmp/hadoop-$HADOOP_VERSION.tar.gz

# Copy configuration files
COPY core-site.xml $HADOOP_CONF_DIR/
COPY hdfs-site.xml $HADOOP_CONF_DIR/
COPY yarn-site.xml $HADOOP_CONF_DIR/
COPY mapred-site.xml $HADOOP_CONF_DIR/

# Expose HDFS and YARN ports
EXPOSE 9870 9864 8088 8042 8080 8188

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
