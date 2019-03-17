FROM java:8
VOLUME /tmp
ADD bees-0.0.1-SNAPSHOT.jar /bees-springboot.jar
EXPOSE 8010
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","-Denv=DEV","/bees-springboot.jar"]

