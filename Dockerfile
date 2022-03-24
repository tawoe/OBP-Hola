FROM adoptopenjdk/openjdk12 as build


RUN jlink \
    --add-modules jdk.unsupported,java.sql,java.desktop,java.naming,java.management,java.instrument,java.security.jgss \
    --verbose \
    --strip-debug \
    --compress 2 \
    --no-header-files \
    --no-man-pages \
    --output /opt/java/jdk

FROM panga/alpine:3.8-glibc2.27


COPY --from=build /opt/java/jdk /opt/java/jdk
COPY target/obp-hydra-auth2-0.0.29-SNAPSHOT.jar /opt/application/hola.jar

ENTRYPOINT ["/opt/java/jdk/bin/java", "-jar", "/opt/application/hola.jar"]

EXPOSE 8080