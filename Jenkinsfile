pipeline {
    agent any 
    stages {
        stage('Clone the Repo:') { 
            steps {
                echo 'Cloning the repository:'  
                git url: 'https://github.com/mauriciocastillo893/MyFirstWebHook.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the NodeJSHelloWorld application using Docker image'
                sh 'docker build -t nombre_imagen:tag .'
            }
        }
        stage('Deploy the Application') { 
            steps {
                sh "docker-compose down"
                sh "docker-compose up -d"
            }
        }
    }
}

// pipeline {
//     agent any
//     stages {
//         stage('Clone the repo') {
//             steps {
//                 echo 'Cloning the repository:'
//                 git url: 'https://github.com/mauriciocastillo893/MyFirstWebHook.git', branch: 'main'
//             }
//         }
//         stage('Build') {
//             steps {
//                 echo 'Building the NodeJSHelloWorld application on Docker'
//                 sh 'docker build . -t nodejs-hello-world'
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 echo 'Deploying the application on Docker'
//                 sh 'docker run -p 3000:3000 -d nodejs-hello-world'
//             }
//         }
//     }
// }
