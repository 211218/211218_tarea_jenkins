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
                    // Construir la imagen Docker con el nombre correcto
                    sh "sudo docker build -t ${DOCKER_IMAGE}:${BUILD_ID} ."
                }
            }
        }
        stage('Run') {
            steps {
                script {
                    // Ejecutar el contenedor Docker
                    sh "sudo docker run -d -p 3000:3000 ${DOCKER_IMAGE}:${BUILD_ID}"
                }
            }
        }
    }
}
