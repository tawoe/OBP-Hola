FROM openjdk:11.0.14.1-jre-bullseye


COPY target/obp-hola-app-*.jar /opt/application/hola.jar

ENTRYPOINT ["/opt/java/jdk/bin/java", "-jar", "/opt/application/hola.jar"]

EXPOSE 8080