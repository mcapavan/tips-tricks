# tips-tricks
Tips and Tricks for configuration, installation, etc

### Maven Installation

1. git clone https://github.com/mcapavan/tips-tricks.git
2. cd tips-tricks/install
3. ./download.sh
4. ./install-maven.sh

**Alternative options**

ref: https://www.vultr.com/docs/how-to-install-apache-maven-3-5-on-centos-7

*get the latest maven version from http://maven.apache.org/download.cgi*
```
cd /tmp
wget http://mirror.jax.hugeserver.com/apache/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
tar -zxvf apache-maven-3.5.3-bin.tar.gz

sudo mv ~/apache-maven-3.5.3 /opt
sudo chown -R root:root /opt/apache-maven-3.5.3
sudo ln -s /opt/apache-maven-3.5.0 /opt/apache-maven
echo 'export PATH=$PATH:/opt/apache-maven/bin' | sudo tee -a /etc/profile
source /etc/profile
mvn --version
```

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

### Debug any commands in real-time in the console
HADOOP_ROOT_LOGGER="DEBUG,console" hdfs dfs -tail SOMEFILE

### Making git “forget” about a file that was tracked but is now in .gitignore

.gitignore will prevent untracked files from being added (without an add -f) to the set of files tracked by git, however git will continue to track any files that are already being tracked.

To stop tracking a file you need to remove it from the index. This can be achieved with this command.
```
git rm --cached <file>
```
The removal of the file from the head revision will happen on the next commit.

### Locate the Maven dependencies you're missing

```
mvn dependency::tree
```

### Avoiding “add jar” to load custom SerDe
Refer https://analyticsanvil.wordpress.com/2015/06/21/avoiding-add-jar-to-load-custom-serde-when-using-excel-or-beeswax-on-hortonworks-hadoop/

Step1: Load the SerDe JAR file to a location on the local filesystem of the Hadoop node running the Hiveserver2

Step2: Add this line to the end of hive-env.sh:
export HIVE_AUX_JARS_PATH=${HIVE_AUX_JARS_PATH}:/home/hive/json-serde-1.3-jar-with-dependencies.jar

Step3: Add this config to the custom hive-site.xml file:
hive.aux.jars.path = file:///home/hive/json-serde-1.3-jar-with-dependencies.jar (or the custom SerDe)

Step4: Restart Hive components.

if not, use below by adding jar file while executing the hive query.

```
  hive -e "ADD JAR /root/Hive-Json-Serde/json-serde-1.3.8-SNAPSHOT-jar-with-dependencies.jar; LOAD DATA LOCAL INPATH '~/Downloads/all_tweets.json' OVERWRITE INTO TABLE tweets;"
```


### Find services and port numbers used in xOS:
```
$ netstat -anp tcp | grep 3000
```
### Error while transferring twitter data - hosebird-client-0 Error connecting w/ status code - 401, reason - Authorization Required
ref: https://vandannguyen.wordpress.com/2014/12/02/twitter-error-connecting-w-status-code-401-reason-authorization-required/
```
sudo yum install ntp
sudo ntpdate pool.ntp.org
```

### Kafka to hdfs

https://github.com/rohanswaroop/hadoop-consumer
