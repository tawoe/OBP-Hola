FROM adoptopenjdk/openjdk12 as build


RUN jlink \
    --add-modules jdk.unsupported,java.sql,java.desktop,java.naming,java.management,java.instrument,java.security.jgss \
    --verbose \
    --strip-debug \
    --compress 2 \
    --no-header-files \
    --no-man-pages \
    --output /opt/java/jdk

FROM openjdk:11.0.14.1-jre-bullseye


COPY --from=build /opt/java/jdk /opt/java/jdk
COPY target/obp-hola-app-0.0.29-SNAPSHOT.jar /opt/application/hola.jar

ENTRYPOINT ["/opt/java/jdk/bin/java", "-jar", "/opt/application/hola.jar"]

EXPOSE 8080