FROM java:openjdk-8u111-alpine

RUN mkdir /app

WORKDIR /app

COPY target/jenkins-test-0.1.0.jar /app

EXPOSE 8080

CMD [ "java", "-jar", "jenkins-test-0.1.0.jar" ]
