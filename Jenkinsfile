pipeline{
    agent any
    environment {
        DOCKER_IMAGE = 'sharusharath/test-dev:latest'
    }
    stages{
        stage('Clone Repository') {
            steps {
                    git branch: 'Live', url: 'https://github.com/sharath050175/DevOps.git'
            }
        }
        stage('Build Docker Image'){
            steps {
                sh '''
               docker build --no-cache -t $DOCKER_IMAGE .
                '''
            }
        }          
        stage('Login to Docker Hub'){
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials',usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                sh 'docker push $DOCKER_IMAGE'
            }
            
        }
        stage('Deploy to kubernetes') {
            steps {
                sh '''
                microk8s.kubectl apply -f deploy.yaml
                '''
            }    
        }
    }    
}        



