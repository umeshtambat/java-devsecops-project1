pipeline {
    agent any

    stages {
        stage('clone') {
            steps {
                echo 'cloning the project'
                git url: 'https://github.com/umeshtambat/java-devsecops-project1.git', branch:'main'
            }
        }
    
        stage('build') {
            steps {
                echo 'building the image'
                sh "docker build -t java-devsecops-project1-image ."
            }
        }
        
        stage('push image to docker hub') {
            steps {
                echo 'pushing the image'
                withCredentials([usernamePassword(credentialsId:"dockerhub-cred", usernameVariable: "username", passwordVariable: "password")]) {
                    sh "docker tag java-devsecops-project1-image ${username}/java-devsecops-project1-image:latest"
                    sh "docker login -u ${username} -p ${password}"
                    sh "docker push ${username}/java-devsecops-project1-image:latest"
                }
            }
        }
        
        stage('deploy') {
            steps {
                sh "docker-compose down & docker-compose up -d"
            }
        }
    }
}
