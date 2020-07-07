FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

WORKDIR /build/

COPY pom.xml /build/
COPY src /build/src/

RUN mvn validate

RUN mvn clean install

ENTRYPOINT ["java", "-jar", "target/CapstoneProjectApplication-0.0.1-SNAPSHOT.jar"]
