FROM maven:3-jdk-11-slim as build

RUN mkdir /usr/src/s4s
COPY . /usr/src/s4s
WORKDIR /usr/src/s4s
RUN mvn package -DskipTests

FROM tomcat:9
RUN apt-get update
RUN apt-get install -y vim
COPY --from=build /usr/src/s4s/target/handling-form-submission-complete.war /usr/local/tomcat/webapps/handling-form-submission-complete.war