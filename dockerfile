FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the application .war file into the container at /usr/src/app
COPY dptweb-1.0.war .

# Expose the port the app runs on
EXPOSE 8080

# Define environment variable
ENV JAVA_OPTS=""

# Run the .war file when the container launches
CMD ["java", "-jar", "dptweb-1.0.war"]
