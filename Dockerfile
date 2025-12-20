# This base image automatically selects the correct architecture
FROM eclipse-temurin:21-jdk
# Set the working directory in the container
WORKDIR /app

# Copy the jar file from your target folder to the container
COPY target/SpringBootSwagger2-0.1.jar app.jar

# Expose the port your Spring Boot app runs on (usually 8080)
EXPOSE 8011

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
