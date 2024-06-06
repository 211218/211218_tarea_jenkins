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
                    sh 'docker build -t container-act-3:latest .'
                }
            }
        }
    }

    post {
        always {
            script {
                def containerExists = sh(script: 'docker ps -q -f name=container-act-3', returnStatus: true) == 0
                if (containerExists) {
                    sh 'docker rm -f container-act-3'
                }
                sh 'docker run -d -p 3000:3000 --name container-act-3 container-act-3:latest'
            }
        }
        failure {
            echo 'Build or tests failed. No deployment will be done.'
        }
    }
}
