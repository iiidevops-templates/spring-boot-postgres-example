FROM dockerhub/library/gradle:7.4.1-jdk8 as builder
COPY ./app /app
WORKDIR /app
RUN ls && gradle build
FROM dockerhub/library/tomcat:jdk11
RUN ["rm", "-rf", "/usr/local/tomcat/webapps/ROOT"]
COPY --from=builder /app/build/libs/*.jar /usr/local/tomcat/webapps/ROOT.jar
CMD ["java","-jar","/usr/local/tomcat/webapps/ROOT.jar"]

#FROM openjdk:8-jdk-alpine
#MAINTAINER experto.com
#VOLUME /tmp
#EXPOSE 8080
#ADD build/libs/springbootpostgresqldocker-0.0.1-SNAPSHOT.jar springbootpostgresqldocker.jar
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/springbootpostgresqldocker.jar"]
