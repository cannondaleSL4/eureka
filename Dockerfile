FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/*.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]

# docker build -t eureka .
# docker run -p 8761:8761 --net=host eureka