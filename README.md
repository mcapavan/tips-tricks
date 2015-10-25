# tips-tricks
Tips and Tricks for configuration, installation, etc

# Maven Installation

Step 1: Go to http://maven.apache.org/download.cgi and copy the latest download url. Run the below command for Maven 3.2.5 version.

$ wget http://mirror.ox.ac.uk/sites/rsync.apache.org/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz

Step 2: 
$ tar xvf apache-maven-3.2.5-bin.tar.gz 
 
Step 3:
$ mv apache-maven-3.2.5 /usr/local/ 
 
Step 4:  
Add export PATH=/usr/local/apache-maven-3.2.5/bin:$PATH to the ~/.bashrc file to auto set the values for $PATH.
 
Step 5: 
$ mvn -version 
