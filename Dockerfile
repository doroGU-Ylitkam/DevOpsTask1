FROM openjdk:24-jre-slim
COPY target/ServiceForStudy01-0.0.1-SNAPSHOT.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
