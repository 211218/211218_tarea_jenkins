pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node-hello-world'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'npm install'
                        sh 'chmod +x ./node_modules/.bin/mocha'
                        sh 'npm run test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    def container = docker.image(DOCKER_IMAGE).run('-d -p 3000:3000')
                    echo "Container ID: ${container.id}"
                    sh "docker ps -a" // List all containers to check if it's running
                }
            }
        }
    }
}
