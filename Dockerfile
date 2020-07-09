FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

WORKDIR /build/

COPY pom.xml /build/
COPY src /build/src/

ADD https://get.aquasec.com/microscanner .
RUN chmod +x microscanner
RUN ./microscanner NThmZjVjZDk1NDlh

RUN mvn validate

RUN mvn clean install

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "target/capstoneProject-0.0.1-SNAPSHOT.jar"
