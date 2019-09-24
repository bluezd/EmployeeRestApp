FROM openjdk:8-alpine

RUN apk add maven \
    && mvn -v \
    && mkdir /app

COPY . /app/

# build the package
RUN cd /app && mvn clean package

WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "target/RestServiceMaven-1.0-SNAPSHOT.jar"]
