pipeline {
    agent any
    stages {
        stage('Identify and stop container') {
            steps {
                script {
                    def containerId = sh(returnStdout: true, script: "sudo docker ps -q --filter \"publish=3000\"").trim()
                    if (containerId) {
                        sh "sudo docker stop $containerId"
                        sh "sudo docker rm $containerId"
                        echo "Container with ID $containerId stopped and removed."
                    } else {
                        echo "No container using port 3000 found."
                    }
                }
            }
        }
        stage('Clone the repo') {
            steps {
                echo 'Cloning the repository:'
                git url: 'https://github.com/mauriciocastillo893/MyFirstWebHook.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the NodeJSHelloWorld application on Docker'
                sh 'docker build . -t nodejs-hello-world'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Stopping and removing existing container'
                sh 'docker stop nodejs-hello-world || true'
                sh 'docker rm nodejs-hello-world || true'
                
                echo 'Deploying the application on Docker'
                sh 'docker run -p 3000:3000 -d --name nodejs-hello-world nodejs-hello-world'
            }
}


        // stage('Deploy') {
        //     steps {
        //         echo 'Deploying the application on Docker'
        //         sh 'docker run -p 3000:3000 -d nodejs-hello-world'
        //     }
        // }
    }
}
