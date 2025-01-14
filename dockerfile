# Imagen base con Maven y JDK preinstalados
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo de configuración de Maven (pom.xml) y las dependencias necesarias
COPY pom.xml /app/
COPY src /app/src

# Compilar la aplicación
RUN mvn clean package -DskipTests

# Crear una nueva imagen para ejecutar la aplicación
FROM eclipse-temurin:17-jdk-jammy

# Exponer el puerto en el que corre la aplicación (ajusta según tu aplicación)
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["sh", "-c", "java -jar target/*.jar"]
