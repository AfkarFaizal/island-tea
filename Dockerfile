FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /workspace
COPY island-tea-webapp/pom.xml ./pom.xml
COPY island-tea-webapp/src ./src
RUN mvn -B -DskipTests clean package

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=build /workspace/target/island-tea-webapp.jar ./app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
