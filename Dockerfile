# Use uma imagem base com OpenJDK 17
FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .

RUN apt-get install maven -y 
RUN mvn clean install

FROM openjdk:17-jdk-slim

# Exponha a porta 8080 (se necessário)
EXPOSE 8080

# Copie o arquivo JAR compilado do estágio de compilação para o estágio de produção
COPY --from=build target/technology-courses-registration-backend-0.0.1-SNAPSHOT.jar app.jar

# Defina o comando de inicialização
ENTRYPOINT ["java", "-jar", "app.jar"]
