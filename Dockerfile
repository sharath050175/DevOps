FROM tomcat:latest
RUN cp -r /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
COPY target/maven-project-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

