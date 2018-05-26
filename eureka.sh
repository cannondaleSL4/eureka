#!/usr/bin/env bash

fuser -k 8761/tcp

cd "$(dirname "$0")"

mvn clean install

chmod +x ./target/fxquotes.eureka-1.0-SNAPSHOT.jar
java -Xms256m -Xmx512m -XX:+UseSerialGC -jar ./target/*.jar