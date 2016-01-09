# tips-tricks
Tips and Tricks for configuration, installation, etc

### Maven Installation

1. git clone https://github.com/mcapavan/tips-tricks.git
2. cd tips-tricks/install
3. ./download.sh
4. ./install-maven.sh

 
### Java Installation

1. git clone https://github.com/mcapavan/tips-tricks.git
2. cd tips-tricks/install
3. ./download.sh
4. ./install-java8.sh

### Locate the Hive table data location

``` 
$ hive -S -e "describe formatted <tablename> ;" | grep 'Location' | awk '{ print $NF }'
```

### How to find HDFS file / directory size

```
$ hadoop fs -du -s -h /apps/hive/warehouse/flightdb.db/flight_events/event=arrival
```
