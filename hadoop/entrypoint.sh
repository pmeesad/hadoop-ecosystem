#!/bin/bash

# Define the NameNode and DataNode directories
NAMENODE_DIR="/home/hadoop/hadoop/data/namenode"
DATANODE_DIR="/home/hadoop/hadoop/data/datanode"

# Create the directories if they don't exist
mkdir -p $NAMENODE_DIR
mkdir -p $DATANODE_DIR

# Change ownership to hadoop user
chown -R hadoop:hadoop $NAMENODE_DIR
chown -R hadoop:hadoop $DATANODE_DIR

# Check if the NameNode is formatted by looking for the VERSION file
if [ ! -f $NAMENODE_DIR/current/VERSION ]; then
    echo "Formatting NameNode..."
    hdfs namenode -format
else
    echo "NameNode is already formatted."
fi

# Start the NameNode
echo "Starting NameNode..."
hdfs --daemon start namenode

# Start the DataNode
echo "Starting DataNode..."
hdfs --daemon start datanode

# Start the ResourceManager
echo "Starting ResourceManager..."
yarn --daemon start resourcemanager

# Start the NodeManager
echo "Starting NodeManager..."
yarn --daemon start nodemanager

# Start the Secondary NameNode
echo "Starting Secondary NameNode..."
hdfs --daemon start secondarynamenode

# Tail the logs to keep the container running
tail -f /dev/null
