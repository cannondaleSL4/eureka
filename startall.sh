#!/usr/bin/env bash

cd "$(dirname "$0")"

chmod +x ./stop.sh
./stop.sh

mvn clean install
mvn -f ../entity clean install
mvn -f ../identity clean install
mvn -f ../gateway clean install
mvn -f ../request clean install
mvn -f ../persist clean install

chmod +x ./target/fxquotes.eureka-1.0-SNAPSHOT.jar
chmod +x ../gateway/target/fxquotes.gateway-1.0-SNAPSHOT.jar
chmod +x ../identity/target/fxquotes.identity-1.0-SNAPSHOT.jar
chmod +x ../request/target/fxquotes.request-1.0-SNAPSHOT.jar
chmod +x ../persist/target/fxquotes.persist-1.0-SNAPSHOT.jar

nohup java -jar ./target/*.jar &
nohup java -jar ../gateway/target/*.jar &
nohup java -jar ../identity/target/*.jar &
nohup java -jar ../request/target/*.jar &
nohup java -jar ../persist/target/*.jar &

#run angular
cd ../front/
ng build --prod
ng server --open