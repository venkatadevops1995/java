pipeline {
    agent any

    stages {
        stage("Clone the code") {
            steps {
                git 'https://github.com/venkatadevops1995/java.git'
            }
        }

        stage("Build code") {
            steps {
                sh 'mvn package'
            }
        }

        stage("Build Docker image") {
            steps {
                script {
                    // Set Docker image and tag
                    def dockerImage = "venkatasundeep/application"
                    def dockerTag = "latest"

                    // Dockerfile content
                    writeFile file: 'Dockerfile', text: '''
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
                    '''

                    // Build Docker image
                    dir('target') {
                        sh 'ls' // List files in target directory (optional)
                        sh "docker build -t ${dockerImage}:${dockerTag} . -f ../Dockerfile"
                    }
                    sh 'docker login -u venkatasundeep -p Sandeep@2023'
                    
                    sh "docker push ${dockerImage}:${dockerTag}"
                }
            }
        }
    }
}
