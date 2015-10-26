#!/bin/bash

echo "Usage is: install.sh [-e ENV]"
echo " - for example: ./install.sh -e bob"

echo "Parsing script parameters"
while [[ $# > 0 ]]
do
key="$1"

case $key in
    -e|--environment)
    ENV="$2"
    shift # past argument
    ;;
    -a|--another-option)
    AOTHER_OPTION="$2"
    shift # past argument
    ;;
    *)
    # unknown option
    ;;
esac
shift # past argument or value
done

echo "Loading properties"
. install.properties

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
#echo "Setting environment to '$ENV'"
#echo "$ENV" > $DIR/env/current

#ENVIRONMENT=$(cat "$DIR"/env/current)
#if [ "$ENVIRONMENT" != "" ]; then
#    echo "Overloading properties for environment $ENV"
#    . env/install-$ENVIRONMENT.properties
#fi



echo "The process:"
echo "7. download maven, if not already there"
echo "8. download java 8, if not already there"
echo ""

if [ ! -e "~/Downloads" ]; then
    mkdir "~/Downloads"
fi


if [ ! -e "~/Downloads/apache-maven-$MAVEN_VERSION-bin.tar.gz" ]; then
    echo "Downloading Maven"
    curl -Lo "~/Downloads/apache-maven-$MAVEN_VERSION-bin.tar.gz" http://mirror.sdunix.com/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
else
    echo "Skipping Maven download because it already exists"
fi
echo "7. Download Maven: OK"

if [ ! -e "~/Downloads/$JDK_PACKAGE.tar.gz" ]; then
    echo "Downloading Java 8"
    curl -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/$JDK_PACKAGE.tar.gz" > /root/Downloads/$JDK_PACKAGE.tar.gz
else
    echo "Skipping Java 8 download because it already exists"
fi
echo "8. Download Java 8: OK"

echo "Software is downloaded SUCCESSFUL!!! Please proceed to install required component."

