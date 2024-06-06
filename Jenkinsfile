pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Check Docker') {
            steps {
                script {
                    sh 'docker --version'
                }
            }
        }

        stage('Check Repository') {
            steps {
                script {
                    echo 'Cloning...'
                    sh 'git pull https://github.com/211218/211218_tarea_jenkins.git'
                }
            }
        }

        stage('Build and Test') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t soa-deploy:latest .'
                }
            }
        }
    }

    post {
        always {
            script {
                // Check if the container exists and remove it if necessary
                def containerExists = sh(script: 'docker ps -q -f name=soa-deploy-test', returnStatus: true) == 0
                if (containerExists) {
                    sh 'docker rm -f soa-deploy-test'
                }
                // Run the new container
                sh 'docker run -d -p 3000:3000 --name soa-deploy-test soa-deploy:latest'
            }
        }
        failure {
            echo 'Build or tests failed. No deployment will be done.'
        }
    }
}
