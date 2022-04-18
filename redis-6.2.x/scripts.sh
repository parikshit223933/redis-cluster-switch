# stop all running cluster nodes
sh ./create-cluster stop

# Clean cluster node conf and log files 
sh ./create-cluster clean

# Start cluster nodes
sh ./create-cluster start

# start redis server with provided configuration
redis-server ./redis.conf

# create cluster
redis-cli --cluster create 127.0.0.1:6379 127.0.0.1:6380 127.0.0.1:6381 127.0.0.1:6382 127.0.0.1:6383 127.0.0.1:6384 127.0.0.1:6385 --cluster-replicas 1

# Connect to redis client with given host and port
redis-cli -h 127.0.0.1 -p 6379

# Get all redis cluster nodes
redis-cli -h 127.0.0.1 -p 6379 cluster nodes

# Flush all keys in redis cluster
redis-cli flushall

# Reset redis cluster
redis-cli cluster reset

# Make a call for all nodes
redis-cli --cluster call  127.0.0.1:6379 keys "*"

