#This file builds the docker Image for student survey form war file. 

FROM tomcat:9.0-jdk15

LABEL maintainer="shikhara1997@gmail.com"

ADD studentsurvey.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
