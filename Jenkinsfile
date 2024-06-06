pipeline {
    agent any

    stages {
        stage('Check Docker') {
            steps {
                script {
                    try {
                        // Verificar la versión de Docker para asegurarse de que está instalado y en ejecución
                        sh 'docker --version'
                    } catch (Exception e) {
                        error "Docker is not running or not installed"
                    }
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
                    // Obtener el ID de la imagen Docker existente
                    def imageId = sh(script: 'docker images -q soa-deploy:latest', returnStdout: true).trim()

                    // Si la imagen existe, manejar contenedores en ejecución y eliminar la imagen
                    if (imageId != "") {
                        def containerId = sh(script: 'docker ps -q -f name=soa-deploy-test', returnStdout: true).trim()
                        if (containerId != "") {
                            sh "docker stop $containerId"
                            sh "docker rm $containerId"
                        }
                        sh "docker rmi -f $imageId"
                    }

                    // Construir la nueva imagen Docker
                    echo 'Building Docker image and running tests...'
                    sh "docker build -t soa-deploy:latest ."
                }
            }
        }
    }

    post {
        success {
            script {
                // Detener y eliminar cualquier contenedor en ejecución con el mismo nombre
                def containerRunning = sh(script: 'docker ps -q -f name=soa-deploy-test', returnStdout: true).trim()
                if (containerRunning != "") {
                    sh "docker stop $containerRunning"
                    sh "docker rm $containerRunning"
                }

                // Desplegar el nuevo contenedor
                sh "docker run -d -p 3000:3000 --name soa-deploy-test soa-deploy:latest"

                // Verificar que el contenedor esté corriendo
                sh 'docker ps -a'
            }
        }
        failure {
            echo 'Build or tests failed. No deployment will be done.'
        }
    }
}
