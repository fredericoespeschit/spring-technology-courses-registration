# Use uma imagem base com OpenJDK 17
FROM adoptopenjdk/openjdk20:latest AS build

# Defina o diretório de trabalho
WORKDIR /app

# Copie o código-fonte e o arquivo pom.xml para o contêiner
COPY . .

# Instale o Maven
RUN apt-get update && apt-get install -y maven

# Compile o projeto com o Maven
RUN mvn clean install

# Crie uma imagem de produção com uma imagem base mais leve
FROM adoptopenjdk/openjdk20:slim

# Defina o diretório de trabalho
WORKDIR /app

# Exponha a porta 8080 (se necessário)
EXPOSE 8080

# Copie o arquivo JAR compilado do estágio de compilação para o estágio de produção
COPY --from=build /app/target/technology-courses-registration-backend-1.0.0.jar app.jar

# Defina o comando de inicialização
CMD ["java", "-jar", "app.jar"]
