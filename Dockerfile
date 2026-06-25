# Use the official Tomcat image with Java 17 pre-installed
FROM tomcat:9.0-jdk17

# Notice the clean separation here
RUN apt-get update && \
    apt-get install -y git maven

WORKDIR /myapp
COPY . /myapp

RUN mvn clean package
RUN cp target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
