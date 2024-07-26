# Use the base image
FROM python:3.12

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip

# Download and install Sqoop
RUN wget http://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz && \
    tar -xzvf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz && \
    mv sqoop-1.4.7.bin__hadoop-2.6.0 /usr/local/sqoop && \
    rm sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz

# Copy MySQL JDBC driver
COPY mysql-connector-java-8.0.25.jar /usr/local/sqoop/lib/

# Set environment variables
ENV SQOOP_HOME=/usr/local/sqoop
ENV PATH=$PATH:$SQOOP_HOME/bin

# Set the working directory
#WORKDIR /workspace

# Expose the port for Jupyter Lab
#EXPOSE 8888

# Start Jupyter Lab
#CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''"]
