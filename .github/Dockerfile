FROM gcr.io/distroless/java11-debian11

COPY target/obp-hola-app-0.0.29-SNAPSHOT.jar /opt/application/hola.jar

ENTRYPOINT ["/opt/java/jdk/bin/java", "-jar", "/opt/application/hola.jar"]

EXPOSE 8080