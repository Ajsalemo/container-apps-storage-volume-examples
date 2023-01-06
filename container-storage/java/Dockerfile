FROM maven:3.8.7-eclipse-temurin as build
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN mvn -f /usr/src/app/pom.xml clean package -DskipTests

FROM eclipse-temurin:17.0.5_8-jdk-jammy
WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/azure-0.0.1-SNAPSHOT.jar azure-0.0.1-SNAPSHOT.jar
COPY --from=build /usr/src/app/init_container.sh init_container.sh 
COPY --from=build /usr/src/app/files files

EXPOSE 8080 

ENTRYPOINT [ "/usr/src/app/init_container.sh" ]