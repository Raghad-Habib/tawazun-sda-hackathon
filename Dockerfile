FROM maven:3.8.6-openjdk-11
ENV DB_URL=mysqldb
ENV DB_NAME=mysql
ENV DB_USERNAME=mysql
ENV DB_PASSWORD=mysql
ENV DB_PORT=3306
WORKDIR /app
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","verify","clean","--fail-never"]
COPY . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/tawazun.war"]