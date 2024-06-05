pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node-hello-world'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/211218/211218_tarea_jenkins.git/', branch: 'master'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Construir la imagen Docker con sudo
                    sh 'sudo docker build -t ${env.DOCKER_IMAGE}:${env.BUILD_ID} .'
                }
            }
        }
        stage('Run') {
            steps {
                script {
                    // Ejecutar el contenedor Docker con sudo
                    sh 'sudo docker run -d -p 3000:3000 ${env.DOCKER_IMAGE}:${env.BUILD_ID}'
                }
            }
        }
    }
}
