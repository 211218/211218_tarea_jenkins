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
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'docker run -d -p 3000:3000 --name node-hello-world node-hello-world'
                    }
                }
            }
        }
    }
}
