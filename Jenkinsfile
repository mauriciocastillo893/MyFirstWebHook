pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/mauriciocastillo893/MyFirstWebHook.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                script {
                    def app = docker.build("node-hello-world:latest")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image("node-hello-world:latest").inside("-v ${env.WORKSPACE}/.npm:/root/.npm") {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image("node-hello-world:latest").inside {
                        sh 'npm start'
                    }
                }
            }
        }
    }
}
