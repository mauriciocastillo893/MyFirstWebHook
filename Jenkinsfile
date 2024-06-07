pipeline {
    agent any
    stages {
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
                echo 'Deploying the application on Docker'
                sh 'docker run -p 3000:3000 -d nodejs-hello-world'
            }
        }
    }
}
