FROM ubuntu
#Install git
RUN apt-get update && apt-get install -y git && apt-get install -y apt-transport-https
#RUN mkdir /home/demo \      
#           cd /home/demo \        
RUN git clone https://github.com/kkenan/basic-microservices 
#Set working directory
#WORKDIR /home/demo/basic-microservices-master \
FROM openjdk:8-jre
#WORKDIR /app
FROM node:latest
WORKDIR /app
COPY package.json /app
#COPY package*.json ./
RUN npm install npm@latest -g
COPY . /app
RUN npm install express --save
WORKDIR /basic-microservices-master/node-app
CMD [ "node", "index.js" ]
EXPOSE 8081
FROM maven:3.6.3
WORKDIR /basic-microservices-master/spring-boot-app
COPY . /basic-microservices-master/spring-boot-app
RUN mvn clean package
#COPY /target/spring-boot-app-1.0-SNAPSHOT.jar /spring-boot-app-1.0-SNAPSHOT.jar
CMD ["java","-jar","spring-boot-app-1.0-SNAPSHOT.jar"]
EXPOSE 8080