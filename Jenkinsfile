pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node-hello-world:latest'
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
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Detener cualquier contenedor en ejecución del mismo nombre
                    sh 'docker rm -f node-hello-world-container || true'
                    
                    // Desplegar el contenedor
                    docker.image(DOCKER_IMAGE).run('-d -p 3000:3000 --name node-hello-world-container')
                }
            }
        }
    }
    post {
        always {
            // Limpiar contenedores creados durante las etapas
            sh 'docker rm -f node-hello-world-container || true'
        }
        cleanup {
            // Limpiar imágenes no utilizadas
            sh 'docker image prune -f'
        }
    }
}
